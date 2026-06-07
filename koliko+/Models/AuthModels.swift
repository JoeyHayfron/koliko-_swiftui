//
//  AuthModels.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//
// Models/AuthModels.swift
import Foundation
 
// MARK: - Requests
struct RegisterRequest: Encodable {
    let email: String
    let password: String
    let displayName: String
    let phone: String
}
 
struct LoginRequest: Encodable {
    let identifier: String
    let password: String
}
 
// MARK: - Responses
struct AuthResponse: Decodable {
    let userId: String
    let email: String
    let displayName: String
    let accessToken: String
    let accessTokenExpiresAt: String
    let refreshToken: String
    let refreshTokenExpiresAt: String
}
 
// MARK: - User
struct User: Decodable {
    let id: String
    let email: String
    let phone: String?
    let displayName: String
    let profilePhotoUrl: String?
    let coverPhotoUrl: String?
    let country: String?
    let emailVerified: Bool
    let phoneVerified: Bool
    let active: Bool
    let lastLoginAt: String
}
 
