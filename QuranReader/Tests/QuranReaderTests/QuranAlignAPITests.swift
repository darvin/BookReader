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
    
    func testAbdul() throws {
        guard let fixtureURL = Bundle.module.url(forResource: "Abdul_Basit_Mujawwad_128kbps", withExtension: "json", subdirectory: "Fixtures") else {
            fatalError("fixture not found")
        }
        try deserializationTest(fixtureURL: fixtureURL)
    }
    
    func testAbdurrahmaan() throws {
        guard let fixtureURL = Bundle.module.url(forResource: "Abdurrahmaan_As-Sudais_192kbps", withExtension: "json", subdirectory: "Fixtures") else {
            fatalError("fixture not found")
        }
        try deserializationTest(fixtureURL: fixtureURL)
    }

    func testSaood() throws {
        guard let fixtureURL = Bundle.module.url(forResource: "Saood_ash-Shuraym_128kbps", withExtension: "json", subdirectory: "Fixtures") else {
            fatalError("fixture not found")
        }
        try deserializationTest(fixtureURL: fixtureURL)
    }
    
    func deserializationTest(fixtureURL:URL) throws {
    
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
        
        
        XCTAssertGreaterThanOrEqual(firstA.segments.count, 2)
        
        XCTAssertEqual(lastA.segments.count, 3)
        
        guard let veryFirstSegment = firstA.segments.first else { fatalError("x") }
        
        guard let veryLastSegment = lastA.segments.last else { fatalError("x") }
        
        XCTAssertGreaterThanOrEqual(veryFirstSegment.msStart, 0)
        XCTAssertGreaterThanOrEqual(veryFirstSegment.msEnd, 650)

        XCTAssertEqual(veryFirstSegment.indexStart, 0)
        XCTAssertEqual(veryFirstSegment.indexEnd, 1)

        
        XCTAssertGreaterThanOrEqual(veryLastSegment.msStart, 1410)
        XCTAssertGreaterThanOrEqual(veryLastSegment.msEnd, 3130)

        XCTAssertEqual(veryLastSegment.indexStart, 2)
        XCTAssertEqual(veryLastSegment.indexEnd, 3)


    }


}
