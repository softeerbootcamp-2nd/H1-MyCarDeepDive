//
//  SessionProviderImpl.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import Foundation

final class SessionProvider {
    enum SessionError: Swift.Error {
        /// Base Url 만들 때
        case components
        case unknown
        case urlRequest(Error)
        case failedStatusCode(Int)
        case timeout
        case emptyBytes
        case failedDecode
    }
    
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - EndpointProvider
extension SessionProvider: EndpointProvider {
    func request<R, E>(
        endpoint: E
    ) async throws -> R where R == E.ResponseDTO, E: NetworkInteractionable {
        let urlRequest = try endpoint.makeRequest(with: endpoint.responseType)
        print(urlRequest.url)
        do {
            let (data, response) = try await session.data(for: urlRequest)
            try checkResult(data: data, response)
            return try decode(data: data)
        } catch let networkError as SessionError {
            throw networkError
        } catch {
            throw SessionError.urlRequest(error)
        }
    }
}

// MARK: - Private functions
extension SessionProvider {
    private func checkResult(data: Data, _ response: URLResponse) throws {
        guard let response = response as? HTTPURLResponse else {
            throw SessionError.unknown
        }
        try checkResponse(response.statusCode)
        guard !data.isEmpty else { throw SessionError.emptyBytes }
    }
    
    private func decode<T: Decodable>(data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode(T.self, from: data)
            return model
        } catch {
            throw SessionError.emptyBytes
        }
    }
    
    private func checkResponse(_ statusCode: Int) throws {
        guard (200...299).contains(statusCode) else {
            throw SessionError.failedStatusCode(statusCode)
        }
    }
}
