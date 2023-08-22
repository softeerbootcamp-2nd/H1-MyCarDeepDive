//
//  RecommendationRepositoryImpl.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct QuotationRepositoryImpl: QuotationRepository {
    
    typealias Endpoints = RecommendationEndpoints
    let provider = SessionProvider()
    
    func fetchCarDetailRecommendation(
        with requestDTO: CustomRecomendation
    ) async throws -> QuotationDTO {
        let endpoint = Endpoints.shared.fetchCarDetailRecommendationOption(with: requestDTO)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data
    }
}
