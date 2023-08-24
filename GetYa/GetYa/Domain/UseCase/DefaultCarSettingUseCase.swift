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
    var trimSelect = CurrentValueSubject<TrimSelectModel?, Never>(nil)
    var trimInquery = CurrentValueSubject<TrimInquery?, Never>(nil)
    var colorSelect = PassthroughSubject<ColorSelectModel, Never>()
    var optionSelect = PassthroughSubject<OptionSelectModel, Never>()
    var trimSelectResult = PassthroughSubject<String, Never>()
    
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
                        index: recommendID - 1,
                        trimTag: [
                            Engine.allCases[trimSubOptionSelect.engineID - 1].rawValue,
                            Body.allCases[trimSubOptionSelect.bodyID - 1].rawValue,
                            DrivingSystem.allCases[trimSubOptionSelect.drivingSystemID - 1].rawValue
                        ],
                        trimName: recommendCarSpec.trimName,
                        trimPrice: recommendCarSpec.price))
                self.trimInquery.send(trimInquery)
            } catch {
                print("TrimInquery 데이터를 받아오지 못하였습니다.")
            }
        })
    }
    
    func fetchTrimSelectLog(trimSelectModel: TrimSelectModel) {
        Task(operation: {
            do {
                guard let trimInquery = trimInquery.value else { return }
                let carSpec = trimInquery.carSpecs[trimSelectModel.index]
                let result = try await repository.fetchTrimSelectLog(
                    with: carSpec.trimID)
                self.trimSelect.send(trimSelectModel)
                self.trimSelectResult.send(carSpec.trimImageURL)
            } catch {
                print("Trim Select 데이터를 전송하지 못하였습니다.")
            }
        })
    }
}
