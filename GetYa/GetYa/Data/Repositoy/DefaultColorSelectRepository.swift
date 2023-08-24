//
//  DefaultColorRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

class DefaultColorSelectRepository: ColorSelectRepository {
    typealias Endpoint = ColorSelectEndpoint
    
    private let provider: EndpointProvider
    
    init(provider: EndpointProvider) {
        self.provider = provider
    }
    
    func fetchTrimInquery(with trimID: Int) async throws -> TrimColorInquery {
        let endpoint = Endpoint.shared.fetchColorInquery(with: trimID)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data.toDomain()
    }
}
