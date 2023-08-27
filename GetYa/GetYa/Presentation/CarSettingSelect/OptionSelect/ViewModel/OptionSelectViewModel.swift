//
//  OptionSelectViewModel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

class OptionSelectViewModel {
    // MARK: - Input
    struct Input {
        let viewWillAppearEvent: AnyPublisher<Void, Never>
        let touchUpcategoryEvent: AnyPublisher<Int, Never>
    }
    
    // MARK: - Output
    struct Output {
        let additionalOptionInquery = PassthroughSubject<AdditionalOptionInquery, Never>()
        let additionalTagOptionInquery = PassthroughSubject<AdditionalTagOptionInquery, Never>()
    }
    
    // MARK: - Dependency
    private let useCase: OptionSelectUseCase
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    init(useCase: OptionSelectUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.viewWillAppearEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchAdditionalOptions()
            })
            .store(in: &cancellables)
        
        input.touchUpcategoryEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchAdditionalOptionsByTag(tagID: $0)
            })
            .store(in: &cancellables)
        
        useCase.additionalOptionInqeury
            .sink(receiveValue: {
                guard let additionalOptionInquery = $0 else { return }
                output.additionalOptionInquery.send(additionalOptionInquery)
            })
            .store(in: &cancellables)
        
        useCase.additionTagOptionInquery
            .sink(receiveValue: {
                output.additionalTagOptionInquery.send($0)
            })
            .store(in: &cancellables)
        
        return output
    }
}
