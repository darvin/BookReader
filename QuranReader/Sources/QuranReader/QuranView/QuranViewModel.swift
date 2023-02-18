//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation
import AVFoundation

public class QuranViewModel: ObservableObject {
    @Published
    var verseViewModel: VerseViewModel? = nil
    
    

    let book: QuranBook
    
    private var arabic = [Verse]()
    private var arabicTranslit = [Verse]()
    private var translation = [Verse]()
    private var translationTranslit = [Verse]()
    private var recitationAligment = [AyahRecitationAlignment]()

    private let quranAligmentAPI = QuranAlignAPI()
    
    var aligment: AyahRecitationAlignment {
        let a = recitationAligment.filter {
            $0.ayah == verseInChapterIndex && $0.surah == chapterIndex
        }.first
        return a!
    }
    
    var aligmentMilliseconds: [Int] {
        let msWordBoundaries = aligment.segments.map {
            return [$0.msStart, $0.msEnd]
        }
      
        let flattenArray = msWordBoundaries.reduce([], { (result: [Int], element: [Int]) -> [Int] in
            return result + element
        })

        return flattenArray
        
    }
    
    @Published
    var verseIndex: Int = 0 {
        didSet {
            updateState()
        }
    }
    
    private func updateState() {
        verseInChapterIndex = arabic[verseIndex].verse
        chapterIndex = arabic[verseIndex].chapter
        verseViewModel = makeVerseViewModel()
    }
    
    @Published
    var verseInChapterIndex: Int = 1
    
    @Published
    var chapterIndex: Int = 1

    @Published
    var isReady = false

    
    init(book: QuranBook,
         isReady: Bool = false) {
        self.book = book
        self.isReady = isReady
    }
    
    func arabicText() -> String {
        return arabic[verseIndex].text
    }
    
    func arabicTranliterationText() -> String? {
        guard verseIndex < arabicTranslit.count else { return nil }
        return arabicTranslit[verseIndex].text
    }
    
    func translationText() -> String? {
        guard verseIndex < translation.count else { return nil }
        return translation[verseIndex].text

    }
    func translationTranslitText() -> String? {
        guard verseIndex < translationTranslit.count else { return nil }
        return translationTranslit[verseIndex].text

    }

    
    private func makeVerseViewModel() -> VerseViewModel  {
        return VerseViewModel(
            book: book,
            verse: verseInChapterIndex,
          chapter: chapterIndex,
          arabic: arabicText(),
          arabicTranslit: arabicTranliterationText(),
          translation: translationText(),
          translationTranslit: translationTranslitText())
    }
    
    
    func load() async {
        do {
            let arabicVerses = try await QuranAPI.shared.fetchVerses(book.arabic)
            let arabicTranliterationVerses = (book.arabicTrasliteration != nil) ? try await QuranAPI.shared.fetchVerses(book.arabicTrasliteration!) : []
            let translationVerses = (book.translation != nil) ? try await QuranAPI.shared.fetchVerses(book.translation!) : []
            let translationTransliterationVerses = (book.translationTransliteration != nil) ? try await QuranAPI.shared.fetchVerses(book.translationTransliteration!) : []
            
            recitationAligment = try await quranAligmentAPI.fetch(for: book.recitation)
            
            await MainActor.run {
                arabic = arabicVerses
                arabicTranslit = arabicTranliterationVerses
                translation = translationVerses
                translationTranslit = translationTransliterationVerses
                updateState()
                isReady = true
            }
            
        } catch {
            print("Error fecthing quran: \(error)")
        }
        
        

    }
    
    
    
    var audioPlayer: AVPlayer?
    private var timeObserver: Any?
    private func killTimeObserver() {
        guard let timeObserver = timeObserver else { return }
        audioPlayer?.removeTimeObserver(timeObserver)
        self.timeObserver = nil
    }
    
    private func killAudioPlayer() {
        guard let audioPlayer = audioPlayer else { return }
        killTimeObserver()
        audioPlayer.pause()
        self.audioPlayer = nil
    }
    
    func playRecitation(){
        killAudioPlayer()
        
        let url = EveryAyahAPI.shared.url(recitation: book.recitation, verseInChapter: verseInChapterIndex, chapter: chapterIndex)
        let player = AVPlayer(url: url)

        let observedTimes = aligmentMilliseconds.map { ms in
            let cmTime = CMTime(seconds: Double(ms)/1000.0, preferredTimescale: 1000)
            return cmTime
        }
        
        let observedTimesValues = observedTimes.map { cmTime in
            NSValue(time: cmTime)
        }
        
        let segments = aligment.segments
        
        timeObserver = player.addBoundaryTimeObserver(forTimes: observedTimesValues, queue: .main) {
            let currentTime = player.currentTime()
            let currentTimeMs = Int(currentTime.seconds * 1000.0)
            
            let filteredSegments = segments.filter {
                return $0.msStart <= currentTimeMs && currentTimeMs <= $0.msEnd
            }
            guard let currentAligment = filteredSegments.first else {
                print("ALIGMENT ERROR: \(currentTimeMs)  not found in \(segments)")
                return
            }
            
            
            
            let aligmentIndex = segments.firstIndex(of: currentAligment)!
            
            self.verseViewModel?.higlighedVerseRange = NSRange(location: currentAligment.indexStart, length: currentAligment.indexStart - currentAligment.indexEnd)
            
            if aligmentIndex == (segments.count - 1) {
                print("CURR: \(currentTimeMs) end \(segments[aligmentIndex].msEnd)")
            }
//
            if aligmentIndex == (segments.count - 1) && currentTimeMs >= segments[aligmentIndex].msEnd {
                self.killTimeObserver()
                self.verseIndex += 1

            }
        }

        player.play()
        
        audioPlayer = player
        
    }

}
