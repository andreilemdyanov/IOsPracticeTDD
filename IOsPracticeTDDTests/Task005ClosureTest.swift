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
        let min = -10000000 //but should be Int.min, you can try with that
        for i in (min)..<1 {
            do {
                let x = try Repeatable(times: i)
                XCTAssertEqual(1, i, "never reaches this line")
            } catch {
                XCTAssertEqual(true, error is IllegalStateError)
            }
        }
    }
}
