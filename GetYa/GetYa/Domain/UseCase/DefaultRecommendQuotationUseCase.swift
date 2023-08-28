//
//  DefaultRecommendQuotationUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import Foundation
import Combine

class DefaultRecommendQuotationUseCase: RecommendQuotationUseCase {
    // MARK: - Dependency
    var quotation = PassthroughSubject<Quotation, Never>()
    
    // MARK: - Properties
    let repository: RecommendQuotationRepository
    private var cancellabels = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(repository: RecommendQuotationRepository) {
        self.repository = repository
    }
    
    // MARK: - Functions
    func fetchQuotationInquery(characterSelectModel: CharacterSelectModel) {
        Task(operation: {
            do {
                let quotation = try await repository.fetchQuotationInquery(with: characterSelectModel)
                self.quotation.send(quotation)
            } catch {
                print("CharacterSelectModel 의 정보에 따라 Quotation 정보를 받아오지 못했습니다.")
            }
        })
    }
}
