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
    }
    
    // MARK: - Output
    struct Output {
        let contractionQuotation = PassthroughSubject<ContractionQuotation, Never>()
    }
    
    // MARK: - Dependency
    private let useCase: CarSettingUseCase
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    init(useCase: CarSettingUseCase) {
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
       
        return output
    }
}
