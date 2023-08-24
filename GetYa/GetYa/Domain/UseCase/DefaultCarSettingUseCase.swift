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
    var trimSelect = CurrentValueSubject<TrimSelectModel?, Never>(nil)
    var trimInquery = CurrentValueSubject<TrimInquery?, Never>(nil)
    var exteriorColorSelect = CurrentValueSubject<Color?, Never>(nil)
    var interiorColorSelect = CurrentValueSubject<Color?, Never>(nil)
    var optionSelect = PassthroughSubject<OptionSelectModel, Never>()
    var trimColorInquery = PassthroughSubject<TrimColorInquery, Never>()
    var trimSelectResult = PassthroughSubject<String, Never>()
    
    // MARK: - Properties
    var trimSelectRepository: TrimSelectRepository
    var colorSelectRepository: ColorSelectRepository
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(
        trimSelectRepository: TrimSelectRepository,
        colorSelectRepository: ColorSelectRepository
    ) {
        self.trimSelectRepository = trimSelectRepository
        self.colorSelectRepository = colorSelectRepository
    }
    
    // MARK: - Functions
}

// MARK: - TrimSelectUseCase
extension DefaultCarSettingUseCase {
    func fetchTrimInqeury(trimSubOptionSelect: TrimSubOptionSelect) {
        Task(operation: {
            do {
                let trimInquery = try await trimSelectRepository.fetchTrimInquery(with: trimSubOptionSelect)
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
                let result = try await trimSelectRepository.fetchTrimSelectLog(
                    with: carSpec.trimID)
                self.trimSelect.send(trimSelectModel)
                self.trimSelectResult.send(carSpec.trimImageURL)
            } catch {
                print("Trim Select 데이터를 전송하지 못하였습니다.")
            }
        })
    }
}

// MARK: - ColorSelectUseCase
extension DefaultCarSettingUseCase {
    func fetchColorInquery() {
        Task(operation: {
            do {
                let trimColorInquery = try await colorSelectRepository.fetchTrimInquery(with: 1)
                self.trimColorInquery.send(trimColorInquery)
                
                let availableExteriorColor = trimColorInquery.exteriorColor.availableColors[0]
                let availableInteriorColor = trimColorInquery.interiorColor.availableColors[0]
                self.exteriorColorSelect.send(availableExteriorColor)
                self.interiorColorSelect.send(availableInteriorColor)
            } catch {
                print("TrimColorInquery 데이터를 받아오지 못하였습니다.")
            }
        })
    }
    
    func validateInteriorColor(
        interiorColor: ColorSelectModel
    ) -> AnyPublisher<ColorChangeType, ColorSelectUseCaseError> {
        if let exteriorColor = exteriorColorSelect.value {
            // 외장색깔.호환가능한내장색상.cotains(interiorColor)
            // true 면 바로변경
            // false 면 타입 내려주기, 타입에 따라 알럿 보여주기, 변경하기 클릭 시 타입에 따라 API 변경
        } else {
            return Fail(error: ColorSelectUseCaseError.notExistExteriorColor)
                .eraseToAnyPublisher()
        }
        
        return Just(.canChange)
            .setFailureType(to: ColorSelectUseCaseError.self)
            .eraseToAnyPublisher()
    }
    
    func validateExteriorColor(
        exteriorColor: ColorSelectModel
    ) -> AnyPublisher<ColorChangeType, ColorSelectUseCaseError> {
        if let interiorColorSelect = interiorColorSelect.value {
            
            return Just(.canChange).setFailureType(to: ColorSelectUseCaseError.self).eraseToAnyPublisher()
        } else {
            return Fail(error: ColorSelectUseCaseError.notExistInteriorColor)
                .eraseToAnyPublisher()
        }
    }
}
