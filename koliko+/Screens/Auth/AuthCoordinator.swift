//
//  AuthCoordinator.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//

// Screens/Auth/AuthCoordinator.swift
import SwiftUI
 
enum AuthRoute: Hashable {
    case signup
    case login
    case forgotPassword
    case checkInbox(email: String)
    case success
}
 
struct AuthCoordinator: View {
    @State private var path = NavigationPath()
 
    var body: some View {
        NavigationStack(path: $path) {
            InitialAuthView(path: $path)
                .navigationDestination(for: AuthRoute.self) { route in
                    switch route {
                    case .signup:
                        SignUpView(path: $path)
                    case .login:
                        LoginView(path: $path)
                    case .forgotPassword:
                        ForgotPasswordView(path: $path)
                    case .checkInbox(let email):
                        CheckInboxView(path: $path, email: email)
                    case .success:
                        SuccessView()
                    }
                }
        }
    }
}
