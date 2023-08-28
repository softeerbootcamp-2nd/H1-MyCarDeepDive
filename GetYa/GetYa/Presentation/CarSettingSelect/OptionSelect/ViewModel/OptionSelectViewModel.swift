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
        let additionalViewWillAppearEvent: AnyPublisher<Void, Never>
        let basicViewWillAppearEvent: AnyPublisher<Void, Never>
        let touchUpCategoryEvent: AnyPublisher<Int, Never>
        let touchUpBasicCategoryEvent: AnyPublisher<Int, Never>
        let selectedOptionNumberList: AnyPublisher<[Int], Never>
        let selectedPackageOptionNumberList: AnyPublisher<[Int], Never>
    }
    
    // MARK: - Output
    struct Output {
        let additionalOptionInquery = PassthroughSubject<AdditionalOptionInquery, Never>()
        let basicOptionArray = PassthroughSubject<[BasicOption], Never>()
        let additionalTagOptionInquery = PassthroughSubject<AdditionalTagOptionInquery, Never>()
        let basicTagOptionArray = PassthroughSubject<[BasicOption], Never>()
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
        
        input.additionalViewWillAppearEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchAdditionalOptions()
            })
            .store(in: &cancellables)
        
        input.basicViewWillAppearEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchBasicOptions()
            })
            .store(in: &cancellables)
        
        input.touchUpCategoryEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchAdditionalOptionsByTag(tagID: $0)
            })
            .store(in: &cancellables)
        
        input.touchUpBasicCategoryEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchBasicOptionsByTag(tagID: $0)
            })
            .store(in: &cancellables)
        
        input.selectedOptionNumberList
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.storeSelectOptionList(optionNumbers: $0)
            })
            .store(in: &cancellables)
        
        input.selectedPackageOptionNumberList
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.storeSelectPackageOptionList(optionNumbers: $0)
            })
            .store(in: &cancellables)
        
        useCase.additionalOptionInqeury
            .sink(receiveValue: {
                guard let additionalOptionInquery = $0 else { return }
                output.additionalOptionInquery.send(additionalOptionInquery)
            })
            .store(in: &cancellables)
        
        useCase.basicOptionArray
            .sink(receiveValue: {
                output.basicOptionArray.send($0)
            })
            .store(in: &cancellables)
        
        useCase.additionalTagOptionInquery
            .sink(receiveValue: {
                output.additionalTagOptionInquery.send($0)
            })
            .store(in: &cancellables)
        
        useCase.basicTagOptionArray
            .sink(receiveValue: {
                output.basicTagOptionArray.send($0)
            })
            .store(in: &cancellables)
        
        return output
    }
}
