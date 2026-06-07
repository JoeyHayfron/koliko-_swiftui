// Screens/Auth/SignUpViewModel.swift
import Foundation
internal import Combine

@MainActor
final class SignUpViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var agreedToTerms = false

    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var didRegister = false

    var passwordMismatch: Bool {
        !confirmPassword.isEmpty && confirmPassword != password
    }

    var isFormValid: Bool {
        !fullName.isEmpty &&
        !email.isEmpty &&
        password.count >= 8 &&
        confirmPassword == password &&
        agreedToTerms
    }

    func register() async {
        guard isFormValid else { return }
        isLoading = true
        errorMessage = nil

        do {
            let response = try await AuthService.shared.register(
                email: email,
                password: password,
                displayName: fullName
            )
            AuthStore.shared.save(authResponse: response)
            didRegister = true
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
