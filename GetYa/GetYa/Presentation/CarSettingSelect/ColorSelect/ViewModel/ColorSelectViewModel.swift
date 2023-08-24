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
        let touchUpColorCellResult = PassthroughSubject<ColorChangeType, ColorSelectUseCaseError>()
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
            .dropFirst(2)
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                if $0.colorType == .exterior {
                    useCase.validateExteriorColor(exteriorColor: $0)
                        .sink(
                            receiveCompletion: {
                                switch $0 {
                                case .failure(let error):
                                    print(error)
                                case .finished:
                                    break
                                }
                            }, receiveValue: {
                                print($0)
                            })
                        .store(in: &cancellables)
                } else {
                    useCase.validateInteriorColor(interiorColor: $0)
                        .sink(
                            receiveCompletion: {
                                if $0 == .finished { return }
                                output.touchUpColorCellResult.send(completion: $0)
                            }, receiveValue: {
                                output.touchUpColorCellResult.send($0)
                            })
                        .store(in: &cancellables)
                }
            })
            .store(in: &cancellables)
        
        useCase.trimColorInquery
            .sink(receiveValue: {
                output.trimColorInquery.send($0)
            })
            .store(in: &cancellables)
        
        return output
    }
}
