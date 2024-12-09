//
//  IOsPracticeTDDTests.swift
//  IOsPracticeTDDTests
//
//  Created by Hovhannes on 09.12.2024.
//

import XCTest
@testable import IOsPracticeTDD

final class Task006IntValidationTest: XCTestCase {

 
    func test_positive_success() {
        let newIntPositiveValidation: NewInt = PositiveNewInt()
        let newIntNegativeValidation: NewInt = NegativeNewInt()
        
        let data = [1, 2, 3, 4, 5, 6, 12, 13, 234, 1234, Int.max]
        
        data.forEach { number in
            XCTAssertEqual(true, newIntPositiveValidation.isValid(number: number))
            XCTAssertEqual(false, newIntNegativeValidation.isValid(number: number))
        }
        
        XCTAssertEqual(false, newIntPositiveValidation.isValid(number: 0))
        XCTAssertEqual(false, newIntNegativeValidation.isValid(number: 0))
    }
    
    func test_positive_not_success() {
        let newIntPositiveValidation: NewInt = PositiveNewInt()
        let newIntNegativeValidation: NewInt = NegativeNewInt()
        
        let data = [-1, -2, -3, -4, -5, -6, -12, -13, -234, -1234, Int.min]
        
        data.forEach { number in
            XCTAssertEqual(false, newIntPositiveValidation.isValid(number: number))
            XCTAssertEqual(true, newIntNegativeValidation.isValid(number: number))
        }
    }
    
    func test_odd_success() throws {
        let newIntOddValidation: NewInt = OddNewInt()
        let newIntEvenValidation: NewInt = EvenNewInt()
        let data = [1, 3, 5, 7, 9, 13, 15, 11, 34589, -3, -7, -893]
        data.forEach { number in
            XCTAssertEqual(true, newIntOddValidation.isValid(number: number))
            XCTAssertEqual(false, newIntEvenValidation.isValid(number: number))
         }
     }
    
    func test_odd_not_success() throws {
        let newIntOddValidation: NewInt = OddNewInt()
        let newIntEvenValidation: NewInt = EvenNewInt()
        let data = [0, 2, 4, 6, 8, 10, -2, -6, -456, 898]
        data.forEach { number in
            XCTAssertEqual(false, newIntOddValidation.isValid(number: number))
            XCTAssertEqual(true, newIntEvenValidation.isValid(number: number))
         }
    }
    
    func test_odd_and_positive_success() {
        let validation = OddNewInt(PositiveNewInt())
        let data = [1, 3, 5, 7, 9, 13, 15, 11, 34589]
        data.forEach { number in
            XCTAssertEqual(true, validation.isValid(number: number))
        }
    }
    
    func test_odd_and_positive_not_success() {
        let validation = OddNewInt(PositiveNewInt())
        let data = [2, -3, -4, -7, -9, -13, -15, -11, -34589, 456, 878, 100034]
        data.forEach { number in
            XCTAssertEqual(false, validation.isValid(number: number))
        }
    }
    
    func test_less_than_success() {
        let validation = LessNewInt(limit: 10)
        let data = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -10, -100, -138965, Int.min]
        data.forEach { number in
            XCTAssertEqual(true, validation.isValid(number: number))
        }
    }
    
    func test_less_than_not_success() {
        let validation = LessNewInt(limit: 10)
        let data = [10, 11, 12, 13, 1487, 234234, 1234235243, Int.max]
        data.forEach { number in
            XCTAssertEqual(false, validation.isValid(number: number))
        }
    }
    
    func test_triple_validation_success() {
        let validation = PositiveNewInt(OddNewInt(LessNewInt(limit: 10)))
        let list = [1, 3, 5, 7, 9]
        list.forEach { number in
            XCTAssertEqual(true, validation.isValid(number: number))
        }
    }
    
    func test_triple_validation_not_success() {
        let validation = PositiveNewInt(OddNewInt(LessNewInt(limit: 10)))
        let list = [-3, 4, 10, 0, Int.max, 7654, 765, -98989, -9898]
        list.forEach { number in
            XCTAssertEqual(false, validation.isValid(number: number))
        }
    }
}

