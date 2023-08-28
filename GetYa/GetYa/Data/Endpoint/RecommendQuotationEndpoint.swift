//
//  RecommendQuotationEndpoint.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import Foundation

struct RecommendQuotationEndpoint {
    private init() {}
    static let shared = RecommendQuotationEndpoint()
    
    func fetchQuotationInquery(with request: CharacterSelectModel) -> Endpoint<QuotationDTO> {
        return Endpoint<QuotationDTO>(
            method: .get,
            responseType: .carRecommendation,
            queryParams: request
        )
    }
}
