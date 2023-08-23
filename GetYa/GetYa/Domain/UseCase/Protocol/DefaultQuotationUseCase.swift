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
                switch error {
                case .unknown:
                    break
                case .components:
                    break
                case .emptyBytes:
                    break
                case .failedDecode:
                    break
                case .failedStatusCode:
                    break
                case .timeout:
                    break
                case .urlRequest:
                    break
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
