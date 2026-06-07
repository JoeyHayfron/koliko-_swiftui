//
//  LoginView.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//
// Screens/Auth/LoginView.swift
import SwiftUI
 
struct LoginView: View {
    @Binding var path: NavigationPath
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var loginError = false
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
 
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 0) {
                KolikoLogo()
                    .padding(.top, 16)
 
                VStack(alignment: .leading, spacing: 6) {
                    Text("Welcome back.")
                        .font(.system(size: 26, weight: .bold))
                    Text("Sign in to pick up where you left off.")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)
 
                // Email
                AuthFieldLabel("Email")
                    .padding(.top, 24)
                AuthTextField(placeholder: "you@example.com", text: $email, isError: loginError)
                    .keyboardType(.emailAddress)
 
                // Password
                AuthFieldLabel("Password")
                    .padding(.top, 12)
                ZStack(alignment: .trailing) {
                    AuthTextField(
                        placeholder: "Your password",
                        text: $password,
                        isSecure: !showPassword,
                        isError: loginError
                    )
                    Button(showPassword ? "Hide" : "Show") {
                        showPassword.toggle()
                    }
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.secondary)
                    .padding(.trailing, 12)
                }
 
                if loginError {
                    Text("Wrong email or password. Try again or reset it below.")
                        .font(.system(size: 12))
                        .foregroundColor(.red)
                        .padding(.top, 4)
                }
 
                HStack {
                    Spacer()
                    Button("Forgot password?") {
                        path.append(AuthRoute.forgotPassword)
                    }
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(blue)
                }
                .padding(.top, 8)
 
                PrimaryButton(title: "Sign in", icon: "chevron.right") {
                    // TODO: call login API, set loginError on failure
                    loginError = false
                }
                .padding(.top, 16)
 
                OrDivider().padding(.vertical, 16)
 
                GoogleButton()
 
                Spacer()
            }
            .padding(.horizontal)
 
            HStack(spacing: 4) {
                Text("Don't have an account?")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                Button("Sign up") { path.append(AuthRoute.signup) }
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(blue)
            }
            .padding(.bottom, 32)
        }
        .background(Color(.systemBackground))
    }
}
