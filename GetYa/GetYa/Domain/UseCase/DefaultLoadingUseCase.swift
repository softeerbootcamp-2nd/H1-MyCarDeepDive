//
//  DefaultLoadingUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation
import Combine

class DefaultLoadingUseCase: LoadingUseCase {
    // MARK: - Dependency
    
    // MARK: - Properties
    private let repository: LoadingRepository
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(repository: LoadingRepository) {
        self.repository = repository
    }
    
    // MARK: - Functions
}
