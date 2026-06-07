// Screens/Auth/PasswordResetViewModel.swift
import Foundation
internal import Combine

@MainActor
final class PasswordResetViewModel: ObservableObject {
    @Published var email = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var didSendReset = false

    // Resend countdown
    @Published var resendSeconds = 42
    private var timer: AnyCancellable?

    func sendResetLink() async {
        guard !email.isEmpty else { return }
        isLoading = true
        errorMessage = nil

        do {
            try await AuthService.shared.forgotPassword(email: email)
            didSendReset = true
            startResendTimer()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    func startResendTimer() {
        resendSeconds = 42
        timer?.cancel()
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                if self.resendSeconds > 0 {
                    self.resendSeconds -= 1
                } else {
                    self.timer?.cancel()
                }
            }
    }

    var resendLabel: String {
        resendSeconds > 0 ? "Resend in 0:\(String(format: "%02d", resendSeconds))" : "Resend"
    }

    func resend() async {
        guard resendSeconds == 0 else { return }
        await sendResetLink()
    }
}
