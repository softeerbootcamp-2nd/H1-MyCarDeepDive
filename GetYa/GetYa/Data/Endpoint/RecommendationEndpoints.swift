//
//  RecommendationEndpoints.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct RecommendationEndpoints {
    private init() {}
    static let shared = RecommendationEndpoints()
    
    func fetchCarDetailRecommendationOption(
        with requestDTO: CustomRecomendation
    ) -> Endpoint<QuotationDTO> {
        return Endpoint<QuotationDTO>(
            method: .get,
            responseType: .carRecommendationCustom,
            queryParams: requestDTO)
    }
}
