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
        let touchUpColorCell: AnyPublisher<ColorSelectModel, Never>
    }
    
    // MARK: - Output
    struct Output {
        let trimColorInquery = PassthroughSubject<TrimColorInquery, Never>()
        let exteriorColorChangeModel = PassthroughSubject<ColorChangeModel, Never>()
        let interiorColorChangeModel = PassthroughSubject<ColorChangeModel, Never>()
        let touchUpExterirorColorResult = PassthroughSubject<ColorChangeType, Never>()
        let touchUpInterirorColorResult = PassthroughSubject<ColorChangeType, Never>()
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
        
        input.touchUpColorCell
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                if $0.colorType == .exterior {
                    useCase.validateExteriorColor(exteriorColor: $0)
                } else {
                    useCase.validateInteriorColor(interiorColor: $0)
                }
            })
            .store(in: &cancellables)
        
        useCase.trimColorInquery
            .sink(receiveValue: {
                output.trimColorInquery.send($0)
            })
            .store(in: &cancellables)
        
        useCase.exteriorColorChangeModel
            .sink(receiveValue: {
                output.exteriorColorChangeModel.send($0)
            })
            .store(in: &cancellables)
        
        useCase.interiorColorChangeModel
            .sink(receiveValue: {
                output.interiorColorChangeModel.send($0)
            })
            .store(in: &cancellables)
        
        useCase.exteriorColorChangeResult
            .sink(receiveValue: {
                
                output.touchUpExterirorColorResult.send($0)
            })
            .store(in: &cancellables)
        
        useCase.interiorColorChangeResult
            .sink(receiveValue: {
                output.touchUpInterirorColorResult.send($0)
            })
            .store(in: &cancellables)
        
        return output
    }
}
