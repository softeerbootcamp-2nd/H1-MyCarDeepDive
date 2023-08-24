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
        let touchUpSubOptionSelect: AnyPublisher<TrimSubOptionSelect, Never>
        let touchUpTrimSelectButton: AnyPublisher<TrimSelectModel, Never>
    }
    
    // MARK: - Output
    struct Output {
        let trimInquery = PassthroughSubject<(TrimInquery, [String]), Never>()
    }
    
    // MARK: - Dependency
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Properties
    private var useCase: TrimSelectUseCase
    private let trimSubOptionSelect: TrimSubOptionSelect
    
    // MARK: - LifeCycle
    init(trimSubOptionSelect: TrimSubOptionSelect, useCase: TrimSelectUseCase) {
        self.useCase = useCase
        self.trimSubOptionSelect = trimSubOptionSelect
    }
    
    // MARK: - Functions
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.viewDidLoadEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchTrimInqeury(trimSubOptionSelect: trimSubOptionSelect)
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
                useCase.fetchTrimInqeury(trimSubOptionSelect: $0)
            })
            .store(in: &cancellables)
        
        useCase.trimInquery
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                var trimSubOptionNames: [String] = []
                trimSubOptionNames.append(
                    Engine.allCases[trimSubOptionSelect.engineID].rawValue)
                trimSubOptionNames.append(
                    Body.allCases[trimSubOptionSelect.bodyID].rawValue)
                trimSubOptionNames.append(
                    DrivingSystem.allCases[trimSubOptionSelect.drivingSystemID].rawValue)
                output.trimInquery.send(($0, trimSubOptionNames))
            })
            .store(in: &cancellables)
        return output
    }
}
