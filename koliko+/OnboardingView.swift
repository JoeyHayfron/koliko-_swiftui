//
//  OnboardingView.swift
//  koliko+
//
//  Created by Joseph Acquah on 31/05/2026.
//
import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()

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
                
                
                
                Image(viewModel.currentStepData.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 60)
                    .padding(.top, 64)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.currentStepData.tag)
                        .font(.poppins(.semibold))
                        .foregroundColor(.blue)
                        .kerning(1.5)
                    
                    Text(viewModel.currentStepData.title)
                        .font(.poppins(.bold,size: 30))
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(viewModel.currentStepData.subtitle)
                        .font(.poppins(.regular))
                        .foregroundColor(.black)
                        .padding(.top, 4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 28)
                .padding(.bottom, 75)
                
                HStack {
                    HStack(spacing: 6) {
                        ForEach(0..<viewModel.steps.count, id:\.self) { index in
                            if index == viewModel.currentStep {
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
                        if viewModel.currentStep < viewModel.steps.count - 1 {
                            viewModel.currentStep += 1
                        } else {
                            // TODO:
                        }
                    }) {
                        Image(systemName: viewModel.currentStepData.buttonIcon)
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
