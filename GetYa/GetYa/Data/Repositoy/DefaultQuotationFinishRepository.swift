//
//  DefaultQuotationFinishRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation
import Combine

struct DefaultQuotationFinishRepository: QuotationFinishRepository {
    typealias Endpoints = QuotationFinishEndpoint
    let provider = SessionProvider()
    
//    func fetchCarDetailRecommendation(
//        with requestDTO: CustomRecomendation
//    ) async throws -> QuotationDTO {
//        let endpoint = Endpoints.shared.fetchCarDetailRecommendationOption(with: requestDTO)
//        let commonDTO = try await provider.request(endpoint: endpoint)
//        return commonDTO.data
//    }
}
