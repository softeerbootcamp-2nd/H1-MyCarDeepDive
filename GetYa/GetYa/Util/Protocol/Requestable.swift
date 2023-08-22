//
//  Requestable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/19.
//

import Foundation

protocol Requestable {
    typealias SessionError = SessionProvider.SessionError
    var scheme: String { get }
    var host: String { get }
    var method: HTTPMethod { get }
    var prefixPath: String { get }
    var responseType: ResponseType { get }
    var queryParams: Encodable? { get }
    var headers: [String: String]? { get }
}

// MARK: - Functions
extension Requestable {
    func url(with responseType: ResponseType) throws -> URL {
        let baseUrlString = "\(scheme)://\(host)" + prefixPath + responseType.path
        guard var components = URLComponents(string: baseUrlString) else {
            throw SessionError.components
        }
        components.queryItems = makeQueryItems
        guard let url = components.url else {
            throw SessionError.components
        }
        return url
    }
    
    func makeRequest(with responseType: ResponseType) throws -> URLRequest {
        var urlRequest = URLRequest(url: try url(with: responseType))
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
}
