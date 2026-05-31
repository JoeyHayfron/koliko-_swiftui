//
//  OnboardingViewModalTests.swift
//  koliko+
//
//  Created by Joseph Acquah on 31/05/2026.
//

import XCTest
@testable import koliko_

final class OnboardingViewModalTests: XCTestCase {
    var viewModel: OnboardingViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = OnboardingViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testInitialStepsIsZero() {
        XCTAssertEqual(viewModel.currentStep, 0)
    }
    
    func testCannotGoPassLastStep() {
        viewModel.nextStep()
        viewModel.nextStep()
        viewModel.nextStep()
        XCTAssertEqual(viewModel.currentStep, 1)
    }
}
