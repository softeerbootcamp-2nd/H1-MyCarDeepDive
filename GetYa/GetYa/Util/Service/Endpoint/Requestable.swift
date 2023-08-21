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
    var headers: [String: String]? { get }
}

// MARK: - Functions
extension Requestable {
    func url(with path: String) throws -> URL {
        let baseUrlString = "\(scheme)://\(host)" + prefixPath + "/(path)"
        guard let url = URLComponents(string: baseUrlString)?.url else {
            throw NetworkError.components
        }
        return url
    }
    
    func makeRequest(with path: String) throws -> URLRequest {
        var urlRequest = URLRequest(url: try url(with: path))
        _=headers?.map { urlRequest.setValue($1, forHTTPHeaderField: $0) }
        return urlRequest
    }
}
