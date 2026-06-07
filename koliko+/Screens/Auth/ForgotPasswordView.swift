//
//  ForgotPasswordView.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//
// Screens/Auth/ForgotPasswordView.swift
import SwiftUI
 
struct ForgotPasswordView: View {
    @Binding var path: NavigationPath
    @State private var email = ""
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
 
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 0) {
                KolikoLogo()
                    .padding(.top, 16)
 
                VStack(alignment: .leading, spacing: 8) {
                    Text("Forgot your password?")
                        .font(.system(size: 26, weight: .bold))
                    Text("Enter the email tied to your account and we'll send you a reset link.")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)
 
                AuthFieldLabel("Email")
                    .padding(.top, 28)
                AuthTextField(placeholder: "you@example.com", text: $email)
                    .keyboardType(.emailAddress)
 
                PrimaryButton(title: "Send reset link", icon: "chevron.right") {
                    path.append(AuthRoute.checkInbox(email: email))
                }
                .padding(.top, 16)
 
                Spacer()
            }
            .padding(.horizontal)
 
            Button("Remembered it? Login") {
                path.removeLast()
            }
            .font(.system(size: 13))
            .foregroundColor(.secondary)
            .padding(.bottom, 32)
        }
        .background(Color(.systemBackground))
    }
}
 
 
// MARK: - Check Inbox
struct CheckInboxView: View {
    @Binding var path: NavigationPath
    let email: String
    @State private var resendSeconds = 42
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
 
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                KolikoLogo()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 16)
 
                Spacer()
 
                // Bell icon
                ZStack {
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 80, height: 80)
                    Image(systemName: "bell")
                        .font(.system(size: 32))
                        .foregroundColor(blue)
                }
 
                VStack(spacing: 10) {
                    Text("Check your inbox.")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.top, 20)
 
                    Group {
                        Text("We sent a reset link to\n")
                        + Text(email).bold()
                        + Text(". Tap it to choose\na new password.")
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                }
 
                PrimaryButton(title: "Open mail app", icon: "checkmark") {
                    // open mail
                    if let url = URL(string: "message://") {
                        UIApplication.shared.open(url)
                    }
                }
                .padding(.top, 24)
 
                HStack(spacing: 4) {
                    Text("Didn't get it?")
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                    Button("Resend in 0:\(String(format: "%02d", resendSeconds))") {}
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(blue)
                }
                .padding(.top, 12)
 
                Spacer()
            }
            .padding(.horizontal)
 
            Button("Use a different email") {
                path.removeLast()
            }
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.primary)
            .padding(.bottom, 32)
        }
        .background(Color(.systemBackground))
    }
}
 
 
// MARK: - Success
struct SuccessView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    let blue = Color(red: 30/255, green: 154/255, blue: 255/255)
 
    var body: some View {
        ZStack {
            // Gradient background at bottom
            VStack {
                Spacer()
                LinearGradient(
                    colors: [Color.blue.opacity(0.15), Color.cyan.opacity(0.1)],
                    startPoint: .leading, endPoint: .trailing
                )
                .frame(height: 200)
                .blur(radius: 40)
            }
            .ignoresSafeArea()
 
            VStack(spacing: 0) {
                Spacer()
 
                // Check circle with dots
                ZStack {
                    // Decorative dots
                    Circle().fill(blue.opacity(0.4)).frame(width: 8, height: 8).offset(x: -60, y: -20)
                    Circle().fill(blue.opacity(0.3)).frame(width: 5, height: 5).offset(x: 60, y: -30)
                    Circle().fill(blue).frame(width: 6, height: 6).offset(x: 50, y: 20)
                    Text("+").font(.system(size: 18, weight: .bold)).foregroundColor(blue).offset(x: -50, y: 30)
 
                    // Main circle
                    Circle()
                        .fill(
                            LinearGradient(colors: [blue, Color.cyan.opacity(0.8)],
                                           startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(width: 100, height: 100)
                        .shadow(color: blue.opacity(0.4), radius: 20)
 
                    Image(systemName: "checkmark")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                }
 
                VStack(spacing: 10) {
                    Text("You're all set, Sarah.")
                        .font(.system(size: 26, weight: .bold))
                        .padding(.top, 28)
 
                    Text("Your library is ready. Watch, read, and\nshare whatever speaks to you.")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
 
                PrimaryButton(title: "Proceed to Koliko+", icon: "chevron.right") {
                    isLoggedIn = true
                }
                .padding(.top, 32)
 
                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationBarHidden(true)
        .background(Color(.systemBackground))
    }
}
