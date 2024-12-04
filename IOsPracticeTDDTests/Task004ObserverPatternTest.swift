//
//  IOsPracticeTDDTests.swift
//  IOsPracticeTDDTests
//
//  Created by Hovhannes on 04.12.2024.
//

import XCTest
@testable import IOsPracticeTDD

final class Task004ObserverPatternTest: XCTestCase {

    func testTask004ObserverPattern() {
        let observable: UiObservable = BaseUiObservable()
        
        let firstObserver = FakeUiObserverImpl()
        observable.register(name: "first", observer: firstObserver)
        firstObserver.assertNotifyCalled(expectedTimes: 0)
        
        observable.notify()
        firstObserver.assertNotifyCalled(expectedTimes: 1)
        
        let secondObserver = FakeUiObserverImpl()
        observable.register(name: "second", observer: secondObserver)
        firstObserver.assertNotifyCalled(expectedTimes: 1)
        secondObserver.assertNotifyCalled(expectedTimes: 0)
        
        observable.notify()
        firstObserver.assertNotifyCalled(expectedTimes: 2)
        secondObserver.assertNotifyCalled(expectedTimes: 1)
        
        observable.unregister(name: "first")
        firstObserver.assertNotifyCalled(expectedTimes: 2)
        secondObserver.assertNotifyCalled(expectedTimes: 1)
        
        observable.notify()
        firstObserver.assertNotifyCalled(expectedTimes: 2)
        secondObserver.assertNotifyCalled(expectedTimes: 2)
    }
    
    func testReplaceObserver() {
        let observable: UiObservable = BaseUiObservable()
        
        let firstObserver = FakeUiObserverImpl()
        observable.register(name: "main", observer: firstObserver)
        firstObserver.assertNotifyCalled(expectedTimes: 0)
        
        observable.notify()
        firstObserver.assertNotifyCalled(expectedTimes: 1)
        
        let secondObserver = FakeUiObserverImpl()
        observable.register(name: "main", observer: secondObserver)
        firstObserver.assertNotifyCalled(expectedTimes: 1)
        secondObserver.assertNotifyCalled(expectedTimes: 0)
        
        observable.notify()
        firstObserver.assertNotifyCalled(expectedTimes: 1)
        secondObserver.assertNotifyCalled(expectedTimes: 1)
    }
}

private protocol FakeUiObserver : UiObserver {
    
    func assertNotifyCalled(expectedTimes: Int)
}

private class FakeUiObserverImpl : FakeUiObserver {
    
    private var notifyCalledTimes = 0
    
    func notify() {
        notifyCalledTimes += 1
    }
    
    func assertNotifyCalled(expectedTimes: Int) {
        XCTAssertEqual(expectedTimes, notifyCalledTimes)
    }
}
