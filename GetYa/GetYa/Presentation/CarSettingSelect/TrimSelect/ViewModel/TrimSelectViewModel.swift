//
//  TrimSelectViewModel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Combine

class TrimSelectViewModel {
    // MARK: - Input
    struct Input {
        let viewDidLoadEvent: AnyPublisher<Void, Never>
        let touchUpSubOptionSelect: AnyPublisher<TrimSubOptionSelectModel, Never>
        let touchUpTrimSelectButton: AnyPublisher<TrimSelectModel, Never>
    }
    
    // MARK: - Output
    struct Output {
        
    }
    
    // MARK: - Dependency
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Properties
    private var useCase: TrimSelectUseCase
    private let carSpecID: Int
    
    // MARK: - LifeCycle
    init(carSpecID: Int, useCase: TrimSelectUseCase) {
        self.useCase = useCase
        self.carSpecID = carSpecID
    }
    
    // MARK: - Functions
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.viewDidLoadEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchTrim(carSpecID: carSpecID)
            })
            .store(in: &cancellables)
        
        input.touchUpTrimSelectButton
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.trimSelect.send($0)
            })
            .store(in: &cancellables)
        
        input.touchUpSubOptionSelect
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchTrim(trimSubOptionSelectModel: $0)
            })
            .store(in: &cancellables)
        return output
    }
}
