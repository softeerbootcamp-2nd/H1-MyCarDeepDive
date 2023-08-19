//
//  SessionProviderImpl.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import Foundation

final class SessionProviderImpl {
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - EndpointProvider
extension SessionProviderImpl: EndpointProvider {
    func request<R, E>(
        with endpoint: E
    ) async throws -> R where R == E.ResponseDTO, E: NetworkInteractionable {
        let urlRequest = try endpoint.makeRequest()
        do {
            let (data, _) = try await session.data(for: urlRequest)
            return try decode(data: data)
        } catch let networkError as NetworkError {
            throw networkError
        } catch {
            throw NetworkError.urlRequest(error)
        }
    }
    
    func request(_ url: URL) async throws -> Data {
        return .init()
    }
}

// MARK: - Private functions
extension SessionProviderImpl {
    private func checkResult(data: Data, _ response: URLResponse) throws {
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.unknown
        }
        guard response.responseType == .success else {
            throw NetworkError.invalidResponseStatus(response.responseType)
        }
        guard !data.isEmpty else { throw NetworkError.emptyBytes }
    }
    
    private func decode<T: Decodable>(data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode(T.self, from: data)
            return model
        } catch {
            throw NetworkError.emptyBytes
        }
    }
}
