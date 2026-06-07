// Screens/Auth/LoginViewModel.swift
import Foundation
internal import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var identifier = ""   // email or phone
    @Published var password = ""
    @Published var showPassword = false

    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var didLogin = false

    func login() async {
        guard !identifier.isEmpty, !password.isEmpty else { return }
        isLoading = true
        errorMessage = nil

        do {
            let response = try await AuthService.shared.login(
                identifier: identifier,
                password: password
            )
            AuthStore.shared.save(authResponse: response)
            didLogin = true
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
