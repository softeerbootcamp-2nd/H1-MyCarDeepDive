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
    var exteriorColorSelect = CurrentValueSubject<ColorSelectModel?, Never>(nil)
    var interiorColorSelect = CurrentValueSubject<ColorSelectModel?, Never>(nil)
    var optionSelect = PassthroughSubject<OptionSelectModel, Never>()
    var trimColorInquery = PassthroughSubject<TrimColorInquery, Never>()
    
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
    func fetchColorInquery() {
        Task(operation: {
            do {
                let trimColorInquery = try await colorRepository.fetchTrimInquery(with: 1)
                self.trimColorInquery.send(trimColorInquery)
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
        if let exteriorColor = exteriorColorSelect.value {
            
        } else {
            return Fail(error: ColorSelectUseCaseError.notExistExteriorColor)
                .eraseToAnyPublisher()
        }
        
        return Just(.canChange)
            .setFailureType(to: ColorSelectUseCaseError.self)
            .eraseToAnyPublisher()
    }
}
