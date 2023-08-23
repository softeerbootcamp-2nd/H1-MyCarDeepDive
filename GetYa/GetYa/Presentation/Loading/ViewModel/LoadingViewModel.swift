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
        
    }
    
    // MARK: - Output
    struct Output {
        
    }
    
    // MARK: - Dependency
    
    // MARK: - Properties
    private let useCase: LoadingUseCase
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(useCase: LoadingUseCase) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
}
