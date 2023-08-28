//
//  DefaultRecommendQuotationRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import Foundation

class DefaultRecommendQuotationRepository: RecommendQuotationRepository {
    typealias Endpoint = RecommendQuotationEndpoint
    private let provider: EndpointProvider
    
    init(provider: EndpointProvider) {
        self.provider = provider
    }

    func fetchQuotationInquery(with request: CharacterSelectModel) async throws -> Quotation {
        let endpoint = Endpoint.shared.fetchQuotationInquery(with: request)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data.toDomain()
    }
}
