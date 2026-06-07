//
//  SignUpView.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//

// Screens/Auth/SignUpView.swift
import SwiftUI
 
struct SignUpView: View {
    @Binding var path: NavigationPath
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var agreedToTerms = false
    @State private var passwordMismatch = false
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
 
    var isFormValid: Bool {
        !fullName.isEmpty && !email.isEmpty &&
        password.count >= 8 && confirmPassword == password && agreedToTerms
    }
 
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    KolikoLogo()
                        .padding(.top, 16)
 
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Create your account")
                            .font(.system(size: 26, weight: .bold))
                        Text("One step and you're in.")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 20)
 
                    // Full name
                    AuthFieldLabel("Full name")
                    AuthTextField(placeholder: "Sarah Thompson", text: $fullName)
 
                    // Email
                    AuthFieldLabel("Email")
                        .padding(.top, 12)
                    AuthTextField(placeholder: "sarah@example.com", text: $email)
                        .keyboardType(.emailAddress)
 
                    // Password
                    AuthFieldLabel("Password")
                        .padding(.top, 12)
                    AuthTextField(placeholder: "At least 8 characters", text: $password, isSecure: true)
                    Text("Use 8+ characters with a number or symbol.")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                        .padding(.top, 4)
 
                    // Confirm password
                    AuthFieldLabel("Confirm password")
                        .padding(.top, 12)
                    AuthTextField(
                        placeholder: "Re-enter password",
                        text: $confirmPassword,
                        isSecure: true,
                        isError: passwordMismatch
                    )
                    if passwordMismatch {
                        Text("Passwords don't match. Please try again.")
                            .font(.system(size: 12))
                            .foregroundColor(.red)
                            .padding(.top, 4)
                    }
 
                    // Terms
                    HStack(alignment: .top, spacing: 10) {
                        Toggle("", isOn: $agreedToTerms)
                            .toggleStyle(CheckboxStyle(blue: blue))
                        Text("I agree to Koliko+'s ")
                            .font(.system(size: 13))
                        + Text("Privacy Policy").font(.system(size: 13, weight: .bold))
                        + Text(" and ").font(.system(size: 13))
                        + Text("Terms of Use").font(.system(size: 13, weight: .bold))
                        + Text(".").font(.system(size: 13))
                    }
                    .padding(.top, 16)
 
                    PrimaryButton(title: "Sign up", icon: "chevron.right", isDisabled: !isFormValid) {
                        if password != confirmPassword {
                            passwordMismatch = true
                        } else {
                            passwordMismatch = false
                            path.append(AuthRoute.checkInbox(email: email))
                        }
                    }
                    .padding(.top, 16)
 
                    Spacer().frame(height: 80)
                }
                .padding(.horizontal)
            }
 
            HStack(spacing: 4) {
                Text("Already have an account?")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                Button("Login") { path.append(AuthRoute.login) }
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(blue)
            }
            .padding(.bottom, 32)
        }
        .navigationBarBackButtonHidden(false)
        .background(Color(.systemBackground))
    }
}
