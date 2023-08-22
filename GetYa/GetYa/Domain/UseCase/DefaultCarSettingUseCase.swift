//
//  DefaultCarSettingUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

class DefaultCarSettingUseCase: TrimSelectUseCase, ColorSelectUseCase {
    // MARK: - Dependency
    var trimSelect = PassthroughSubject<TrimSelectModel, Never>()
    var colorSelect = PassthroughSubject<ColorSelectModel, Never>()
    var optionSelect = PassthroughSubject<OptionSelectModel, Never>()
    
    // MARK: - Properties
    var colorRepository: ColorRepository
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(colorRepository: ColorRepository) {
        self.colorRepository = colorRepository
    }
    
    // MARK: - Functions
}

// MARK: - TrimSelectUseCase
extension DefaultCarSettingUseCase {
    func fetchTrim(trimSubOptionSelectModel: TrimSubOptionSelectModel) {
        print(trimSubOptionSelectModel)
    }
    func fetchTrim(carSpecID: Int) {
        print(carSpecID)
    }
}

// MARK: - ColorSelectUseCase
extension DefaultCarSettingUseCase {
    
}
