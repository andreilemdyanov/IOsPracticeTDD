//
//  BaseNumbers.swift
//  IOsPracticeTDD
//
//  Created by Andrei Lemdyanov on 10.12.2024.
//

class BaseNumbers : Numbers {
    private let first: Int
    private let second:Int
    
    init(first: Int, second:Int){
        self.first = first
        self.second = second
    }
    
    func sum() -> Int {
        return first + second
    }
    
    func difference() -> Int {
        return first - second
    }
    
    func multiplication() -> Int {
        return first * second
    }
    
    func division() throws -> Int {
        return if second == 0 {
            throw ZeroDivisionError()
        } else {
            first / second
        }
    }
}
