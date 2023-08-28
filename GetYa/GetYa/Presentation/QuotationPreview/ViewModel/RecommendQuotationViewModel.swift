//
//  RecommendQuotationViewModel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import Foundation
import Combine

class RecommendQuotationViewModel {
    // MARK: - Input
    struct Input {
        let viewDidLoadEvent: AnyPublisher<Void, Never>
    }
    
    // MARK: - Output
    struct Output {
        let quotation = PassthroughSubject<Quotation, Never>()
    }
    
    // MARK: - Dependency
    
    // MARK: - Properties
    let useCase: RecommendQuotationUseCase
    private let characterSelectModel: CharacterSelectModel
    private var cancellabels = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(characterSelectModel: CharacterSelectModel, useCase: RecommendQuotationUseCase) {
        self.characterSelectModel = characterSelectModel
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.viewDidLoadEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchQuotationInquery(characterSelectModel: characterSelectModel)
            })
            .store(in: &cancellabels)
        
        useCase.quotation
            .sink(receiveValue: {
                output.quotation.send($0)
            })
            .store(in: &cancellabels)
        
        return output
    }
}
