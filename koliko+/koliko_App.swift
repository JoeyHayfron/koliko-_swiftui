//
//  KolikoApp.swift
//  koliko+
//
//  Created by Joseph Acquah on 25/05/2026.
//

import SwiftUI

@main
struct KolikoApp: App {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var isGuest = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//            Group {
//                if !hasCompletedOnboarding {
//                    OnboardingView(
//                        onBrowse: {
//                            hasCompletedOnboarding = true
//                            isGuest = true
//                        },
//                        onSignIn: {
//                            hasCompletedOnboarding = true
//                        }
//                    )
//                } else if isLoggedIn && AuthStore.shared.getToken() != nil {
//                    HomeView()
//                } else if isGuest {
//                    HomeView()
//                } else {
//                    AuthCoordinator()
//                }
//            }.frame(maxWidth: .infinity, maxHeight: .infinity)
//            .ignoresSafeArea(.all)
        }
      
        
    }
}
