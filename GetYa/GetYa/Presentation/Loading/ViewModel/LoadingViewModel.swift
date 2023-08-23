//
//  LoadingViewModel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation
import Combine

class LoadingViewModel {
    // MARK: - Input
    struct Input {
        let viewDidLoadEvent: AnyPublisher<Void, Never>
    }
    
    // MARK: - Output
    struct Output {
        
    }
    
    // MARK: - Dependency
    
    // MARK: - Properties
    private let useCase: LoadingUseCase
    private let contrationQuotation: ContractionQuotation
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(contrationQuotation: ContractionQuotation, useCase: LoadingUseCase) {
        self.useCase = useCase
        self.contrationQuotation = contrationQuotation
    }
    
    // MARK: - Functions
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.viewDidLoadEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchPdfID(contrationQuotation: contrationQuotation)
            })
            .store(in: &cancellables)
        
        useCase.pdfID
            .sink(receiveValue: {
                print($0)
            })
            .store(in: &cancellables)
        
        return output
    }
}
