//
//  QuotationEndpoints.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct QuotationEndpoint {
    private init() {}
    static let shared = QuotationEndpoint()
    
    func fetchCarDetailRecommendationOption(
        with requestDTO: CustomRecomendationDTO
    ) -> Endpoint<QuotationDTO> {
        return Endpoint<QuotationDTO>(
            method: .get,
            responseType: .carRecommendationCustom,
            queryParams: requestDTO)
    }
}
