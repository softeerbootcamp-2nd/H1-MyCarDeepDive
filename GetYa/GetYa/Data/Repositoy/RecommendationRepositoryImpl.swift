//
//  RecommendationRepositoryImpl.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct RecommendationRepositoryImpl: RecommendationRepository {
    typealias Endpoints = RecommendationEndpoints
    let provider = SessionProvider()
    
    func fetchCarDetailRecommendation(
        with requestDTO: CustomRecomendation
    ) async throws -> QuotationDTO.Data {
        let endpoint = Endpoints.shared.fetchCarDetailRecommendationOption(with: requestDTO)
        let responseDTO = try await provider.request(endpoint: endpoint)
        return responseDTO.data
    }
}
