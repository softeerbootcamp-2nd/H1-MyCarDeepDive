//
//  QuotaionFinishViewModel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

class QuotationFinishViewModel {
    // MARK: - Input
    struct Input {
        let viewDidLoadEvent: AnyPublisher<Void, Never>
        let postEmailEvent: AnyPublisher<String, Never>
    }
    
    // MARK: - Output
    struct Output {
        let carInquery = PassthroughSubject<QuotationFinish, Never>()
        let emailResult = PassthroughSubject<Bool, Never>()
    }
    
    // MARK: - Dependency
    private let useCase: QuotationFinishUseCase
    
    // MARK: - Properties
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(useCase: QuotationFinishUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func transform(input: Input) -> Output {
        let output = Output()
        
        input.viewDidLoadEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchCarInquery()
            })
            .store(in: &cancellables)
        
        input.postEmailEvent
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                useCase.fetchEmail(email: $0)
            })
            .store(in: &cancellables)
        
        useCase.carInquery
            .sink(receiveValue: {
                output.carInquery.send($0)
            })
            .store(in: &cancellables)
        
        useCase.emailResult
            .sink(receiveValue: {
                output.emailResult.send($0)
            })
            .store(in: &cancellables)
        
        return output
    }
}
