//
//  DefaultOptionSelectRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

class DefaultOptionSelectRepository: OptionSelectRepository {
    typealias Endpoint = OptionSelectEndpoint
    
    private let provider: EndpointProvider
    
    init(provider: EndpointProvider) {
        self.provider = provider
    }
    
    func fetchAdditionalOption(with carSpecID: Int) async throws -> AdditionalOptionInquery {
        let endpoint = Endpoint.shared.fetchAdditionalOption(with: carSpecID)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data.toDomain()
    }
    
    func fetchBasicOption(with carSpecID: Int) async throws -> [BasicOption] {
        let endpoint = Endpoint.shared.fetchBasicOption(with: carSpecID)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data.map { $0.toDomain() }
    }
    
    func fetchAdditionalOptionByTag(carSpecID: Int, tagID: Int) async throws -> AdditionalTagOptionInquery {
        let endpoint = Endpoint.shared.fetchAdditionalOptionByTag(carSpecID: carSpecID, tagID: tagID)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data.toDomain()
    }
}
