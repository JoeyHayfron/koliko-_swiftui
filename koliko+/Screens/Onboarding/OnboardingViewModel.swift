//
//  OnboardingViewModel.swift
//  koliko+
//
//  Created by Joseph Acquah on 31/05/2026.
//
import Foundation
internal import Combine

struct OnboardingStep {
    let image: String
    let tag: String
    let title: String
    let subtitle: String
    let buttonIcon: String
}


class OnboardingViewModel: ObservableObject {
    @Published var currentStep = 0
    
    let steps: [OnboardingStep] = [
        OnboardingStep(image:"onboarding-step1-content", tag: "WELCOME", title: "A library you\ncan share", subtitle: "Exclusive videos, books, and wallpapers — and easy ways to share them with the people you love.", buttonIcon: "chevron.right"),
        OnboardingStep(image:"onboarding-step2-offline", tag: "OFFLINE", title: "Take it with you", subtitle: "Download what matters and keep watching, reading, and listening — even when you're offline.", buttonIcon: "checkmark")
    ]
    
    var isLastStep: Bool {
        currentStep == steps.count - 1
    }
    
    var currentStepData: OnboardingStep {
        steps[currentStep]
    }
    
    func nextStep() {
        currentStep += 1
    }
}
