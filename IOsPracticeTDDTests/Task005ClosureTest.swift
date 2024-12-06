//
//  IOsPracticeTDDTests.swift
//  IOsPracticeTDDTests
//
//  Created by Hovhannes on 05.12.2024.
//

import XCTest
@testable import IOsPracticeTDD

final class Task005ClosureTest: XCTestCase {

    func testClosure() throws {
        let repeatable = try Repeatable(times: 77)
      
        var count = 0
        repeatable.repeatAction {
            count += 1
        }
        XCTAssertEqual(77, count)
    }
    
    func testIllegalThrowsError() {
        do {
            let illegalNumber = Int.random(in: Int.min..<1)
            let x = try Repeatable(times: illegalNumber)
            XCTAssertEqual(1, illegalNumber, "never reaches this line")
        } catch {
            XCTAssertEqual(true, error is IllegalStateError)
        }
    }
}
