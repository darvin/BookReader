//
//  File.swift
//  
//
//  Created by standard on 2/17/23.
//

import Foundation


extension QuranBook {
    static let previewQurans = [
        QuranBook(recitation: QuranRecitation(subfolder: "Abdurrahmaan_As-Sudais_192kbps", name: "Abdurrahmaan As-Sudais", bitrate: "192kbps"), arabic: QuranEdition(name: "ara-quranbazzi", author: "Quran Bazzi", language: "Arabic", direction: "rtl", source: "https://qurancomplex.gov.sa/", comments: "Version 7 ,The verse numbering of this quran has been changed to Uthmanic version, so that Apps can easily use this, and people can benefit from it, If you want the copy with original verse numbering, please go to https://fonts.qurancomplex.gov.sa/ , The following characters were replaced (to open fathatan,dammatan and kasratan) to conform to unicode standard,\'ٖ\'(u+0656)->\'ࣲ\'(u+08f2),\'ٗ\'(u+0657)->\'ࣰ\'(u+08f0),\'ٞ\'(u+065E)->\'ࣱ\'(u+08f1) , You can use bazzi fonts with full suffix to view this text", link: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quranbazzi.json", linkmin: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quranbazzi.min.json"), translation: nil, translationTransliteration: nil, arabicTrasliteration: nil),
        QuranBook(recitation: QuranRecitation(subfolder: "Alafasy_128kbps", name: "Alafasy", bitrate: "128kbps"), arabic: QuranEdition(name: "ara-quranbazzi", author: "Quran Bazzi", language: "Arabic", direction: "rtl", source: "https://qurancomplex.gov.sa/", comments: "Version 7 ,The verse numbering of this quran has been changed to Uthmanic version, so that Apps can easily use this, and people can benefit from it, If you want the copy with original verse numbering, please go to https://fonts.qurancomplex.gov.sa/ , The following characters were replaced (to open fathatan,dammatan and kasratan) to conform to unicode standard,\'ٖ\'(u+0656)->\'ࣲ\'(u+08f2),\'ٗ\'(u+0657)->\'ࣰ\'(u+08f0),\'ٞ\'(u+065E)->\'ࣱ\'(u+08f1) , You can use bazzi fonts with full suffix to view this text", link: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quranbazzi.json", linkmin: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quranbazzi.min.json"), translation: Optional(QuranEdition(name: "tgk-abdolmohammaday", author: "Abdolmohammad Ayati", language: "Tajik", direction: "ltr", source: "http://tanzil.net", comments: "", link: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/tgk-abdolmohammaday.json", linkmin: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/tgk-abdolmohammaday.min.json")), translationTransliteration: Optional(QuranEdition(name: "tgk-abdolmohammaday-la", author: "Abdolmohammad Ayati", language: "Tajik", direction: "ltr", source: "http://tanzil.net", comments: "", link: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/tgk-abdolmohammaday-la.json", linkmin: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/tgk-abdolmohammaday-la.min.json")), arabicTrasliteration: Optional(QuranEdition(name: "ara-quran-la", author: "Quran Transliteration", language: "Arabic", direction: "ltr", source: "http://tanzil.net", comments: "", link: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quran-la.json", linkmin: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quran-la.min.json"))),
        QuranBook(recitation: QuranRecitation(subfolder: "Abdurrahmaan_As-Sudais_192kbps", name: "Abdurrahmaan As-Sudais", bitrate: "192kbps"), arabic: QuranEdition(name: "ara-quranbazzi", author: "Quran Bazzi", language: "Arabic", direction: "rtl", source: "https://qurancomplex.gov.sa/", comments: "Version 7 ,The verse numbering of this quran has been changed to Uthmanic version, so that Apps can easily use this, and people can benefit from it, If you want the copy with original verse numbering, please go to https://fonts.qurancomplex.gov.sa/ , The following characters were replaced (to open fathatan,dammatan and kasratan) to conform to unicode standard,\'ٖ\'(u+0656)->\'ࣲ\'(u+08f2),\'ٗ\'(u+0657)->\'ࣰ\'(u+08f0),\'ٞ\'(u+065E)->\'ࣱ\'(u+08f1) , You can use bazzi fonts with full suffix to view this text", link: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quranbazzi.json", linkmin: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quranbazzi.min.json"), translation: Optional(QuranEdition(name: "mkd-sheikhhassangil-lad", author: "Sheikh Hassan Gilo", language: "Macedonian", direction: "ltr", source: "http://www.qurandownload.com , https://www.islamic-invitation.com", comments: "", link: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/mkd-sheikhhassangil-lad.json", linkmin: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/mkd-sheikhhassangil-lad.min.json")), translationTransliteration: Optional(QuranEdition(name: "mkd-sheikhhassangil-la", author: "Sheikh Hassan Gilo", language: "Macedonian", direction: "ltr", source: "http://www.qurandownload.com , https://www.islamic-invitation.com", comments: "", link: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/mkd-sheikhhassangil-la.json", linkmin: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/mkd-sheikhhassangil-la.min.json")), arabicTrasliteration: Optional(QuranEdition(name: "ara-quran-la", author: "Quran Transliteration", language: "Arabic", direction: "ltr", source: "http://tanzil.net", comments: "", link: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quran-la.json", linkmin: "https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quran-la.min.json"))),


    ]
}