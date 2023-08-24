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
    var trimInquery = PassthroughSubject<(TrimInquery), Never>()
    var colorSelect = PassthroughSubject<ColorSelectModel, Never>()
    var optionSelect = PassthroughSubject<OptionSelectModel, Never>()
    
    // MARK: - Properties
    private let repository: TrimSelectRepository
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(repository: TrimSelectRepository) {
        self.repository = repository
    }
    
    // MARK: - Functions
}

// MARK: - TrimSelectUseCase
extension DefaultCarSettingUseCase {
    func fetchTrimInqeury(trimSubOptionSelect: TrimSubOptionSelect) {
        Task(operation: {
            do {
                let trimInquery = try await repository.fetchTrimInquery(with: trimSubOptionSelect)
                let recommendID = trimInquery.recommendTrimID
                let recommendCarSpec = trimInquery.carSpecs[recommendID]
                self.trimSelect.send(
                    TrimSelectModel(
                        trimName: recommendCarSpec.trimName,
                        trimPrice: recommendCarSpec.price))
                self.trimInquery.send(trimInquery)
            } catch {
                print("TrimInquery 데이터를 받아오지 못하였습니다.")
            }
        })
    }
}
