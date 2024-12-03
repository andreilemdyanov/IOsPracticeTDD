//
//  IOsPracticeTDDTests.swift
//  IOsPracticeTDDTests
//
//  Created by Hovhannes on 03.12.2024.
//

import XCTest
@testable import IOsPracticeTDD

final class Task003OneArgFunTest: XCTestCase {

    func testTask003OneArgFun() throws {
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
