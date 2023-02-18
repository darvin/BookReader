//
//  QuranAlignAPITests.swift
//  
//
//  Created by standard on 2/18/23.
//

import XCTest
import QuranReader

final class QuranAlignAPITests: XCTestCase {
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
    }

    func testDeserialization() throws {
        
        guard let fixtureURL = Bundle.module.url(forResource: "Abdul_Basit_Mujawwad_128kbps", withExtension: "json", subdirectory: "Fixtures") else {
            fatalError("fixture not found")
        }

        
        guard let data = try? Data(contentsOf: fixtureURL) else {
            fatalError("fixture not loaded")

        }

        let decoder = JSONDecoder()
        
        let aligments = try! decoder.decode([AyahRecitationAlignment].self, from: data)
        
        XCTAssertEqual(aligments.count, 6236)
        
        let sortedAligmnents = aligments.sorted()
        
        guard let firstA = sortedAligmnents.first else { fatalError("x") }
        guard let lastA = sortedAligmnents.last else { fatalError("x") }
        
        XCTAssertEqual(firstA.surah, 1)
        XCTAssertEqual(firstA.ayah, 1)
        
        XCTAssertEqual(lastA.surah, 114)
        XCTAssertEqual(lastA.ayah, 6)
        
        
        XCTAssertEqual(firstA.segments.count, 4)
        
        XCTAssertEqual(lastA.segments.count, 3)
        
        guard let veryFirstSegment = firstA.segments.first else { fatalError("x") }
        
        guard let veryLastSegment = lastA.segments.last else { fatalError("x") }
        
        XCTAssertEqual(veryFirstSegment.msStart, 0)
        XCTAssertEqual(veryFirstSegment.msEnd, 960)

        XCTAssertEqual(veryFirstSegment.indexStart, 0)
        XCTAssertEqual(veryFirstSegment.indexEnd, 1)

        
        XCTAssertEqual(veryLastSegment.msStart, 4160)
        XCTAssertEqual(veryLastSegment.msEnd, 9090)

        XCTAssertEqual(veryLastSegment.indexStart, 2)
        XCTAssertEqual(veryLastSegment.indexEnd, 3)


    }


}
