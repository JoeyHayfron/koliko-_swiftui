//
//  AuthStore.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//
// Services/AuthStore.swift
import Security
import Foundation
 
final class AuthStore {
    static let shared = AuthStore()
    private init() {}
 
    private let tokenKey = "koliko_access_token"
    private let refreshKey = "koliko_refresh_token"
 
    // MARK: - Access Token
    func saveToken(_ token: String) {
        save(key: tokenKey, value: token)
    }
 
    func getToken() -> String? {
        read(key: tokenKey)
    }
 
    func deleteToken() {
        delete(key: tokenKey)
    }
 
    // MARK: - Refresh Token
    func saveRefreshToken(_ token: String) {
        save(key: refreshKey, value: token)
    }
 
    func getRefreshToken() -> String? {
        read(key: refreshKey)
    }
 
    // MARK: - Save auth response (convenience)
    func save(authResponse: AuthResponse) {
        saveToken(authResponse.accessToken)
        saveRefreshToken(authResponse.refreshToken)
    }
 
    func clearAll() {
        delete(key: tokenKey)
        delete(key: refreshKey)
    }
 
    // MARK: - Keychain helpers
    private func save(key: String, value: String) {
        guard let data = value.data(using: .utf8) else { return }
        let query: [String: Any] = [
            kSecClass as String:       kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String:   data
        ]
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }
 
    private func read(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String:       kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String:  true,
            kSecMatchLimit as String:  kSecMatchLimitOne
        ]
        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)
        guard let data = result as? Data else { return nil }
        return String(data: data, encoding: .utf8)
    }
 
    private func delete(key: String) {
        let query: [String: Any] = [
            kSecClass as String:       kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(query as CFDictionary)
    }
}
 
