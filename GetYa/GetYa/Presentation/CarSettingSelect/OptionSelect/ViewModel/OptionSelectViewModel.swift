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
    }
    
    // MARK: - Output
    struct Output {
        
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
        
        return output
    }
}
