//
//  QuotationFinishRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation
import Combine

protocol QuotationFinishRepository {
    func fetchCarInquery(with request: String) async throws -> QuotationFinish
    func fetchPdfEmail(with request: PdfEmail) async throws -> Bool
}
