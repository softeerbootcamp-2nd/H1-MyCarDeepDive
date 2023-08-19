//
//  Requestable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/19.
//

import Foundation

protocol Requestable {
    var scheme: String { get }
    var host: String { get }
    var method: HTTPMethod { get }
    var prefixPath: String { get }
    var path: String { get }
    var queryParams: Encodable? { get }
    var bodyParams: Encodable? { get }
    var headers: [String: String]? { get }
}

// MARK: - Functions
extension Requestable {
    func url() throws -> URL {
        let baseUrlString = "\(scheme)://\(host)"
        guard var components = URLComponents(string: baseUrlString) else {
            throw NetworkError.components
        }
        components.queryItems = makeQueryItems
        guard let url = components.url else {
            throw NetworkError.components
        }
        return url
    }
    
    func makeRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: try url())
        urlRequest.httpMethod = method.rawValue
        do {
            urlRequest.httpBody = try makeHttpBody()
        } catch {
            throw NetworkError.invalidBodyParams
        }
        _=headers?.map { urlRequest.setValue($1, forHTTPHeaderField: $0) }
        return urlRequest
    }
}

// MARK: Private functions
private extension Requestable {
    var makeQueryItems: [URLQueryItem]? {
        guard let querys = queryParams?.toDictionary else {
            return nil
        }
        return querys.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
    
    func makeHttpBody() throws -> Data? {
        guard let bodyParams else {
            return nil
        }
        return try JSONEncoder().encode(bodyParams)
    }
    
    private func debugPrintURL(_ url: URL) {
        #if DEBUG
        print("DEBUG: \(url)")
        #endif
    }
}
