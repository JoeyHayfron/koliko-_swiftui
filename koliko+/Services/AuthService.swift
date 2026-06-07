//
//  AuthService.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//

// Services/AuthService.swift
import Foundation
 
final class AuthService {
    static let shared = AuthService()
    private init() {}
 
    func register(
        email: String,
        password: String,
        displayName: String,
        phone: String = ""
    ) async throws -> AuthResponse {
        let body = RegisterRequest(
            email: email,
            password: password,
            displayName: displayName,
            phone: phone
        )
        return try await APIClient.shared.request(
            "/api/v1/auth/register",
            method: .POST,
            body: body
        )
    }
 
    func login(identifier: String, password: String) async throws -> AuthResponse {
        let body = LoginRequest(identifier: identifier, password: password)
        return try await APIClient.shared.request(
            "/api/v1/auth/login",
            method: .POST,
            body: body
        )
    }
 
    func forgotPassword(email: String) async throws {
        struct ForgotBody: Encodable { let email: String }
        let _: EmptyResponse = try await APIClient.shared.request(
            "/api/v1/auth/forgot-password",
            method: .POST,
            body: ForgotBody(email: email)
        )
    }
 
    func getMe() async throws -> User {
        return try await APIClient.shared.request(
            "/api/v1/users/me",
            requiresAuth: true
        )
    }
}
 
// For endpoints that return no body
struct EmptyResponse: Decodable {}
