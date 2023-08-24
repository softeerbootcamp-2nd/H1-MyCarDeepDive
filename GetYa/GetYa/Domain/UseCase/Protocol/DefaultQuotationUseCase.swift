//
//  DefaultQuotationUseCase.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/23.
//

import Foundation
import Combine

final class DefaultQuotationUseCase: QuotationUseCase {
    // MARK: - Properties
    var carQuotation = PassthroughSubject<QuotationModel, Never>()
    var subscriptions = Set<AnyCancellable>()
    var userSelectedQuestionModel: CustomRecomendationModel
    
    let defaultQuotationRepository: QuotationRepository
    
    // MARK: - Lifecycles
    init(defaultQuotationRepository: QuotationRepository, userSelectedQuestionModel: CustomRecomendationModel) {
        self.defaultQuotationRepository = defaultQuotationRepository
        self.userSelectedQuestionModel = userSelectedQuestionModel
    }
    
    // MARK: - Functions
    func fetchCarQuotation() {
        Task(priority: .high) {
            do {
                let quotation = try await self.defaultQuotationRepository
                    .fetchCarDetailRecommendation(with: userSelectedQuestionModel.toDTO())
                carQuotation.send(quotation)
            } catch let error as SessionProvider.SessionError {
                print("Error 발생: \(error.localizedDescription)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
