//
//  QuotationRepository.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

protocol QuotationRepository {
    func fetchCarDetailRecommendation(
        with requestDTO: CustomRecomendation
    ) async throws -> Quotation
}
