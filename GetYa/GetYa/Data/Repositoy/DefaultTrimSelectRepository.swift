//
//  DefaultTrimSelectRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation

class DefaultTrimSelectRepository: TrimSelectRepository {
    typealias Endpoint = TrimSelectEndpoint
    
    private let provider: EndpointProvider
    
    init(provider: EndpointProvider) {
        self.provider = provider
    }
    
    func fetchTrimInquery(
        with request: TrimSubOptionSelect
    ) async throws -> TrimInquery {
        let endpoint = Endpoint.shared.fetchTrimInquery(with: request)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data.toDomain()
    }
}
