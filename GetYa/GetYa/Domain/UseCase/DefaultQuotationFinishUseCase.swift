//
//  DefaultQuotationFinishUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation
import Combine

class DefaultQuotationFinishUseCase: QuotationFinishUseCase {
    // MARK: - Dependency
    
    // MARK: - Properties
    private let repository: QuotationRepository
    
    // MARK: - LifeCycle
    init(repository: QuotationRepository) {
        self.repository = repository
    }
    
    // MARK: - Functions
}
