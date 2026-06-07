//
//  InitialAuthView.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//
// Screens/Auth/InitialAuthView.swift
import SwiftUI
 
struct InitialAuthView: View {
    @Binding var path: NavigationPath
    @State private var email = ""
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
 
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 0) {
                // Logo
                KolikoLogo()
                    .padding(.top, 40)
                    .padding(.horizontal)
 
                VStack(alignment: .leading, spacing: 12) {
                    Text("Start by creating\nan account.")
                        .font(.system(size: 28, weight: .bold))
 
                    Text("We'll send a verification to your email to keep\nyour library safe.")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }
                .padding(.top, 32)
                .padding(.horizontal)
 
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email")
                        .font(.system(size: 13, weight: .medium))
                    AuthTextField(placeholder: "you@example.com", text: $email)
                }
                .padding(.top, 28)
                .padding(.horizontal)
 
                PrimaryButton(title: "Continue", icon: "chevron.right") {
                    path.append(AuthRoute.signup)
                }
                .padding(.top, 16)
                .padding(.horizontal)
 
                // OR divider
                OrDivider()
                    .padding(.vertical, 16)
                    .padding(.horizontal)
 
                GoogleButton()
                    .padding(.horizontal)
 
                Spacer()
            }
 
            // Bottom
            VStack(spacing: 6) {
                Text("By continuing you agree to our ")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                + Text("Privacy Policy").font(.system(size: 12, weight: .bold))
                + Text(" and ").font(.system(size: 12)).foregroundColor(.secondary)
                + Text("Terms of Use.").font(.system(size: 12, weight: .bold))
 
                HStack(spacing: 4) {
                    Text("Already have an account?")
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                    Button("Login") { path.append(AuthRoute.login) }
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(blue)
                }
            }
            .multilineTextAlignment(.center)
            .padding(.bottom, 32)
            .padding(.horizontal)
        }
        .background(Color(.systemBackground))
        .navigationBarHidden(true)
    }
}
