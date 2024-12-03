//
//  IOsPracticeTDDTests.swift
//  IOsPracticeTDDTests
//
//  Created by Hovhannes on 03.12.2024.
//

import XCTest
@testable import IOsPracticeTDD

final class Task003OneArgFunTest: XCTestCase {

    func testTask003OneArgFun() {
        let analytics: FakeAnalytics = FakeAnalyticsImpl()
        let viewModel: LoginViewModel = LoginViewModel(analytics: analytics)
        viewModel.signIn()
        analytics.assertSendEventCalled(expected: "signIn")
        analytics.assertSendEventCalled(times: 1)
        viewModel.login()
        analytics.assertSendEventCalled(expected: "login")
        analytics.assertSendEventCalled(times: 2)
    }
}

private protocol FakeAnalytics : Analytics {
    
    func assertSendEventCalled(expected: String)
    
    func assertSendEventCalled(times: Int)
}

private class FakeAnalyticsImpl : FakeAnalytics {
    
    private var names: [String] = []
    private var index = 0
    
    func sendEvent(name: String) {
        names.append(name)
    }
    
    func assertSendEventCalled(expected: String) {
        XCTAssertEqual(expected, names[index])
        index += 1
    }
    
    func assertSendEventCalled(times: Int) {
        XCTAssertEqual(names.count, times)
    }
}
