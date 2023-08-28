//
//  RecommendQuotationRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import Foundation

protocol RecommendQuotationRepository {
    func fetchQuotationInquery(with request: CharacterSelectModel) async throws -> Quotation
}
