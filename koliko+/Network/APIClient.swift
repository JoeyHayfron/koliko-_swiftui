//
//  APIClient.swift
//  koliko+
//
//  Created by Joseph Acquah on 07/06/2026.
//
// Network/APIClient.swift
import Foundation
 
enum HTTPMethod: String {
    case GET, POST, PUT, DELETE, PATCH
}
 
enum APIError: LocalizedError {
    case invalidURL
    case requestFailed(statusCode: Int, message: String)
    case decodingFailed
    case noToken
 
    var errorDescription: String? {
        switch self {
        case .invalidURL:               return "Invalid URL."
        case .requestFailed(_, let msg): return msg
        case .decodingFailed:           return "Failed to parse response."
        case .noToken:                  return "Not authenticated."
        }
    }
}
 
final class APIClient {
    static let shared = APIClient()
    private init() {}
 
    private var baseURL: String {
        Bundle.main.infoDictionary?["API_BASE_URL"] as? String ?? "https://dev-api.eoasiamah.dev"
    }
 
    // MARK: - Core request
    func request<T: Decodable>(
        _ endpoint: String,
        method: HTTPMethod = .GET,
        body: Encodable? = nil,
        requiresAuth: Bool = false
    ) async throws -> T {
        guard let url = URL(string: baseURL + endpoint) else {
            throw APIError.invalidURL
        }
 
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
 
        // Attach token if needed
        if requiresAuth {
            guard let token = AuthStore.shared.getToken() else {
                throw APIError.noToken
            }
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
 
        // Encode body
        if let body {
            request.httpBody = try JSONEncoder().encode(body)
        }
 
        let (data, response) = try await URLSession.shared.data(for: request)
 
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.requestFailed(statusCode: 0, message: "No response.")
        }
 
        guard (200...299).contains(httpResponse.statusCode) else {
            // Try to parse error message from backend
            let message = (try? JSONDecoder().decode(APIErrorResponse.self, from: data))?.message
                ?? "Something went wrong."
            throw APIError.requestFailed(statusCode: httpResponse.statusCode, message: message)
        }
 
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingFailed
        }
    }
}
 
// MARK: - Error response shape (adjust to match your backend)
private struct APIErrorResponse: Decodable {
    let message: String
}
 
