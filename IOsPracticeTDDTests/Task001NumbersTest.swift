//
//  IOsPracticeTDDTests.swift
//  IOsPracticeTDDTests
//
//  Created by Hovhannes on 27.11.2024.
//

import XCTest
@testable import IOsPracticeTDD

final class Task001NumbersTest: XCTestCase {

    func testTask001Numbers() {
        let numbers: Numbers = BaseNumbers(first: 12, second: 4)
        
        XCTAssertEqual(16, numbers.sum(), "test sum")
        
        XCTAssertEqual(8, numbers.difference(), "test difference")
        
        XCTAssertEqual(48, numbers.multiplication(), "test multiply")
        
        XCTAssertEqual(3, try numbers.division(), "test divide")
    }
    
    func testTask001NumbersDivideByZero() {
        let numbers: Numbers = BaseNumbers(first: 12, second: 0)
        
        XCTAssertThrowsError(try numbers.division()) { error in
            XCTAssertTrue(error is ZeroDivisionError)
        }
    }
}
