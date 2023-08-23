//
//  LoadingRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation
import Combine

protocol LoadingRepository {
    func fetchPdfID(with request: ContractionQuotation) async throws -> String?
}
