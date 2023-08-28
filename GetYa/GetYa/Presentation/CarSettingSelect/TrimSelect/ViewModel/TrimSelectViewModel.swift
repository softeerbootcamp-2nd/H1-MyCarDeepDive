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
        let trimInquery = PassthroughSubject<(TrimInquery?, [String]), Never>()
        let trimSelectModel = PassthroughSubject<TrimSelectModel, Never>()
        let trimSelectResult = PassthroughSubject<String, Never>()
    }
    
    // MARK: - Dependency
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Properties
    private var useCase: TrimSelectUseCase
    private var trimSubOptionSelect: TrimSubOptionSelect
    
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
                useCase.fetchTrimSelectLog(trimSelectModel: $0)
            })
            .store(in: &cancellables)
        
        input.touchUpSubOptionSelect
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                trimSubOptionSelect = $0
                useCase.fetchTrimInqeury(trimSubOptionSelect: $0)
            })
            .store(in: &cancellables)
        
        useCase.trimInquery
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                var trimSubOptionNames: [String] = []
                trimSubOptionNames.append(
                    Engine.allCases[trimSubOptionSelect.engineID - 1].rawValue)
                trimSubOptionNames.append(
                    Body.allCases[trimSubOptionSelect.bodyID - 1].rawValue)
                trimSubOptionNames.append(
                    DrivingSystem.allCases[trimSubOptionSelect.drivingSystemID - 1].rawValue)
                output.trimInquery.send(($0, trimSubOptionNames))
            })
            .store(in: &cancellables)
        
        useCase.trimSelect
            .sink(receiveValue: {
                guard let trimSelectModel = $0 else { return }
                output.trimSelectModel.send(trimSelectModel)
            })
            .store(in: &cancellables)
        
        useCase.trimSelectResult
            .sink(receiveValue: {
                output.trimSelectResult.send($0)
            })
            .store(in: &cancellables)
        
        return output
    }
}
