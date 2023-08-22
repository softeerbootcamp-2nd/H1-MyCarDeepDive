//
//  DefaultCarSettingUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

class DefaultCarSettingUseCase: TrimSelectUseCase {
    // MARK: - Dependency
    var trimSelect = PassthroughSubject<TrimSelectModel, Never>()
    var colorSelect = PassthroughSubject<ColorSelectModel, Never>()
    var optionSelect = PassthroughSubject<OptionSelectModel, Never>()
    
    // MARK: - Properties
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init() {
        trimSelect
            .zip(colorSelect, optionSelect)
            .sink(receiveCompletion: {
                print($0)
            }, receiveValue: {
                print($0)
            })
            .store(in: &cancellables)
    }
    
    // MARK: - Functions
}

// MARK: - TrimSelectUseCase
extension DefaultCarSettingUseCase {
    func fetchTrim(trimSubOptionSelectMode: TrimSubOptionSelectModel) {
        print(trimSubOptionSelectMode)
    }
    func fetchTrim(carSpecID: Int) {
        print(carSpecID)
    }
}
