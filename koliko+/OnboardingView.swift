//
//  OnboardingView.swift
//  koliko+
//
//  Created by Joseph Acquah on 31/05/2026.
//
import SwiftUI

struct OnboardingStep {
    let image: String
    let tag: String
    let title: String
    let subtitle: String
    let buttonIcon: String
}

struct OnboardingView: View {
    @State private var currentStep = 0
    
    let steps: [OnboardingStep] = [
        OnboardingStep(image:"onboarding-step1-content", tag: "WELCOME", title: "A library you\ncan share", subtitle: "Exclusive videos, books, and wallpapers — and easy ways to share them with the people you love.", buttonIcon: "chevron.right"),
        OnboardingStep(image:"onboarding-step2-offline", tag: "OFFLINE", title: "Take it with you", subtitle: "Download what matters and keep watching, reading, and listening — even when you're offline.", buttonIcon: "checkmark")
    ]
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Image("koliko-waves")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 320)
            }.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Koliko")
                        .font(.poppins(.bold, size: 25))
                    
                    Text("+")
                        .font(.poppins(.bold, size: 25))
                        .foregroundColor(.blue)
                        .padding(.leading, -9)
                }.padding(.leading, 30)
                
                
                
                Image(steps[currentStep].image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 60)
                    .padding(.top, 64)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(steps[currentStep].tag)
                        .font(.poppins(.semibold))
                        .foregroundColor(.blue)
                        .kerning(1.5)
                    
                    Text(steps[currentStep].title)
                        .font(.poppins(.bold,size: 30))
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(steps[currentStep].subtitle)
                        .font(.poppins(.regular))
                        .foregroundColor(.black)
                        .padding(.top, 4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 28)
                .padding(.bottom, 75)
                
                HStack {
                    HStack(spacing: 6) {
                        ForEach(0..<steps.count, id:\.self) { index in
                            if index == currentStep {
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(width: 20, height: 8)
                            } else {
                                Circle()
                                    .fill(Color.gray.opacity(0.4))
                                    .frame(width: 8, height: 8)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if currentStep < steps.count - 1 {
                            currentStep += 1
                        } else {
                            // TODO:
                        }
                    }) {
                        Image(systemName: steps[currentStep].buttonIcon)
                            .foregroundColor(.white)
                            .frame(width: 56, height: 56)
                            .background(.blue)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 28)
                .padding(.bottom, 40)
            }
        }
        
    }
}

#Preview {
    OnboardingView()
}
