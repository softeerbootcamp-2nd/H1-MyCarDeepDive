//
//  CarSettingSelectViewModel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import Foundation
import Combine

class CarSettingSelectViewModel {
    // MARK: - Input
    struct Input {
        let touchUpNextButton: AnyPublisher<Void, Never>
        let touchUpQuoteButton: AnyPublisher<Void, Never>
    }
    
    // MARK: - Output
    struct Output {
        let contractionQuotation = PassthroughSubject<ContractionQuotation, Never>()
        let smallTitle = PassthroughSubject<String, Never>()
        let totalPrice = PassthroughSubject<Int, Never>()
        let modelInfo = PassthroughSubject<(String, Int), Never>()
        let colorInfo = PassthroughSubject<(String, Int, String, Int), Never>()
        let optionInfo = PassthroughSubject<([String], [Int]), Never>()
    }
    
    // MARK: - Dependency
    private let useCase: DefaultCarSettingUseCase
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    init(useCase: DefaultCarSettingUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.touchUpNextButton
            .sink(receiveValue: { [weak self] in
                guard let self,
                      let contracitionQuotation = useCase.fetchContractionQuotation() else { return }
                output.contractionQuotation.send(contracitionQuotation)
            })
            .store(in: &cancellables)
        
        input.touchUpQuoteButton
            .sink(receiveValue: { [weak self] in
                guard let self,
                      let contracitionQuotation = useCase.fetchContractionQuotation() else { return }
                output.contractionQuotation.send(contracitionQuotation)
            })
            .store(in: &cancellables)
        
        useCase.smallTitle
            .sink(receiveValue: {
                output.smallTitle.send($0)
            })
            .store(in: &cancellables)
        
        useCase.totalPrice
            .sink(receiveValue: {
                output.totalPrice.send($0)
            })
            .store(in: &cancellables)
        
        useCase.modelTitle
            .combineLatest(useCase.modelPrice)
            .sink(receiveValue: {
                output.modelInfo.send($0)
            })
            .store(in: &cancellables)
        
        useCase.exteriorColorTitle
            .combineLatest(useCase.exteriorColorPrice, useCase.interiorColorTitle, useCase.interiorColorPrice)
            .sink(receiveValue: {
                output.colorInfo.send($0)
            })
            .store(in: &cancellables)
        
        useCase.optionTitles
            .combineLatest(useCase.optionPrices)
            .sink(receiveValue: {
                output.optionInfo.send($0)
            })
            .store(in: &cancellables)
       
        return output
    }
}
