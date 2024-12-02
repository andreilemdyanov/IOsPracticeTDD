//
//  IOsPracticeTDDTests.swift
//  IOsPracticeTDDTests
//
//  Created by Hovhannes on 2.12.2024.
//

import XCTest
@testable import IOsPracticeTDD

final class Task002EmptyFunTest: XCTestCase {

    func testTask002EmptyFun() throws {
        let analytics: FakeAnalytics = FakeAnalyticsImpl()
        let viewModel: OnboardingViewModel = OnboardingViewModel(analytics: analytics)
        viewModel.onboardingIsShown()
        analytics.assertOnBoardingEventCalled()
    }
}

private protocol FakeAnalytics : Analytics {
    
    func assertOnBoardingEventCalled()
}

private class FakeAnalyticsImpl : FakeAnalytics {
    
    private var sendOnboardingEventCalled = false
    
    func sendOnboardingEvent() {
        sendOnboardingEventCalled = true
    }
    
    func assertOnBoardingEventCalled() {
        XCTAssertTrue(sendOnboardingEventCalled)
    }
}
