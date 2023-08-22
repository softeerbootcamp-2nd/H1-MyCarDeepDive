//
//  ColorSelectViewModel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

class ColorSelectViewModel {
    // MARK: - Input
    struct Input {
        let viewDidLoadEvent: AnyPublisher<Void, Never>
    }
    
    // MARK: - Output
    struct Output {
        let trimInquery = PassthroughSubject<TrimColorInquery, Never>()
    }
    
    // MARK: - Dependency
    private let useCase: ColorSelectUseCase
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    init(useCase: ColorSelectUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func transform(input: Input) -> Output {
        let output = Output()
        input.viewDidLoadEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchColorInquery()
            })
            .store(in: &cancellables)
        
        useCase.trimColorInquery
            .sink(receiveValue: {
                output.trimInquery.send($0)
            })
            .store(in: &cancellables)
        
        return output
    }
}
