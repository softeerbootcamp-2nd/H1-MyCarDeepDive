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
    var trimSelectResult = PassthroughSubject<String, Never>()
    
    var exteriorColorSelect = CurrentValueSubject<ColorSelectModel?, Never>(nil)
    var interiorColorSelect = CurrentValueSubject<ColorSelectModel?, Never>(nil)
    var trimColorInquery = PassthroughSubject<TrimColorInquery, Never>()
    var exteriorColorChangeModel = PassthroughSubject<ColorChangeModel, Never>()
    var interiorColorChangeModel = PassthroughSubject<ColorChangeModel, Never>()
    var exteriorColorChangeResult = PassthroughSubject<ColorChangeType, Never>()
    var interiorColorChangeResult = PassthroughSubject<ColorChangeType, Never>()
    
    var optionSelectArray = CurrentValueSubject<[OptionSelectModel], Never>([])
    
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
                        trimID: recommendCarSpec.trimID,
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
                guard let trimInquery = trimInquery.value,
                      let carSpec = trimInquery.carSpecs.first(where: {
                          $0.trimID == trimSelectModel.trimID
                      }) else { return }
                _=try await trimSelectRepository.fetchTrimSelectLog(with: carSpec.trimID)
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
                guard let trimSelect = trimSelect.value else { return }
                let trimColorInquery = try await colorSelectRepository.fetchTrimColorInquery(with: trimSelect.trimID)
                self.trimColorInquery.send(trimColorInquery)
                
                let availableExteriorColor = trimColorInquery.exteriorColor.availableColors[0]
                let availableInteriorColor = trimColorInquery.interiorColor.availableColors[0]
                self.exteriorColorSelect.send(
                    ColorSelectModel(
                        colorType: .exterior,
                        colorID: availableExteriorColor.colorID,
                        colorName: availableExteriorColor.name,
                        colorPrice: availableExteriorColor.price,
                        trimID: availableExteriorColor.trimID,
                        oppositeColors: availableExteriorColor.oppositeColors))
                self.interiorColorSelect.send(
                    ColorSelectModel(
                        colorType: .interior,
                        colorID: availableInteriorColor.colorID,
                        colorName: availableInteriorColor.name,
                        colorPrice: availableInteriorColor.price,
                        trimID: availableInteriorColor.trimID,
                        oppositeColors: availableInteriorColor.oppositeColors))
            } catch {
                print("TrimColorInquery 데이터를 받아오지 못하였습니다.")
            }
        })
    }
    
    func fetchExteriorColorInquery(interiorColor: ColorSelectModel) {
        Task(operation: {
            do {
                let exteriorColor = try await colorSelectRepository
                    .fetchExteriorColor(with: interiorColor)
                let index = exteriorColor.availableColors.firstIndex(where: {
                    exteriorColorSelect.value?.colorID == $0.colorID
                })
                guard let interiorColorSelect = interiorColorSelect.value else { return }
                self.exteriorColorChangeModel.send(
                    ColorChangeModel(
                        trimColor: exteriorColor,
                        colorSelectModel: interiorColorSelect,
                        selectIndex: index ?? 0))
            } catch {
                print("ExteriorColor 데이터를 받아오지 못했습니다.")
            }
        })
    }
    
    func fetchInteriorColorInquery(exteriorColor: ColorSelectModel) {
        Task(operation: {
            do {
                let interiorColor = try await colorSelectRepository
                    .fetchInteriorColor(with: exteriorColor)
                let index = interiorColor.availableColors.firstIndex(where: {
                    interiorColorSelect.value?.colorID == $0.colorID
                })
                guard let exteriorColorSelect = exteriorColorSelect.value else { return }
                self.interiorColorChangeModel.send(
                    ColorChangeModel(
                        trimColor: interiorColor,
                        colorSelectModel: exteriorColorSelect,
                        selectIndex: index ?? 0))
            } catch {
                print("InteriorColor 데이터를 받아오지 못했습니다.")
            }
        })
    }
    
    func validateInteriorColor(
        interiorColor: ColorSelectModel
    ) {
        if let exteriorColorSelect = exteriorColorSelect.value {
            if interiorColor.oppositeColors.contains(exteriorColorSelect.colorID) {
                if interiorColor.trimID != exteriorColorSelect.trimID {
                    guard let otherTrim = trimInquery.value?.carSpecs
                        .first(where: { $0.trimID == interiorColor.trimID }),
                          let trimSelect = trimSelect.value else { return }
                    
                    exteriorColorChangeResult.send(
                        .needChangeTrim(
                            trimChangeModel: TrimChangeModel(
                                trimSelectModel: trimSelect,
                                otherTrimSelectModel: TrimSelectModel(
                                    trimID: otherTrim.trimID,
                                    trimTag: trimSelect.trimTag,
                                    trimName: otherTrim.trimName,
                                    trimPrice: otherTrim.price),
                                exteriorColorSelectModel: exteriorColorSelect,
                                optionSelectModelArray: optionSelectArray.value
                            )))
                } else {
                    interiorColorSelect.send(interiorColor)
                    fetchExteriorColorInquery(interiorColor: interiorColor)
                }
            } else {
                if interiorColor.trimID != exteriorColorSelect.trimID {
                    guard let otherTrim = trimInquery.value?.carSpecs
                        .first(where: { $0.trimID == interiorColor.trimID }),
                          let trimSelect = trimSelect.value else { return }
                    
                    interiorColorChangeResult.send(
                        .needChangeExteriorColorWithTrim(
                            trimChangeModel: TrimChangeModel(
                                trimSelectModel: trimSelect,
                                otherTrimSelectModel: TrimSelectModel(
                                    trimID: otherTrim.trimID,
                                    trimTag: trimSelect.trimTag,
                                    trimName: otherTrim.trimName,
                                    trimPrice: otherTrim.price),
                                exteriorColorSelectModel: exteriorColorSelect,
                                optionSelectModelArray: optionSelectArray.value
                            )))
                } else {
                    interiorColorChangeResult.send(
                        .needChangeExteriorColor(
                            trimChangeModel: TrimChangeModel(
                                exteriorColorSelectModel: exteriorColorSelect,
                                interiorColorSelectModel: ColorSelectModel(
                                    colorType: .interior,
                                    colorID: -1,
                                    colorName: interiorColor.colorName,
                                    colorPrice: interiorColor.colorPrice,
                                    trimID: interiorColor.trimID,
                                    oppositeColors: interiorColor.oppositeColors),
                                optionSelectModelArray: optionSelectArray.value
                            )))
                }
            }
        }
    }
    
    func validateExteriorColor(
        exteriorColor: ColorSelectModel
    ) {
        if let interiorColorSelect = interiorColorSelect.value {
            if exteriorColor.oppositeColors.contains(interiorColorSelect.colorID) {
                if exteriorColor.trimID != interiorColorSelect.trimID {
                    guard let otherTrim = trimInquery.value?.carSpecs
                        .first(where: { $0.trimID == exteriorColor.trimID }),
                          let trimSelect = trimSelect.value else { return }
                    
                    exteriorColorChangeResult.send(
                        .needChangeTrim(
                            trimChangeModel: TrimChangeModel(
                                trimSelectModel: trimSelect,
                                otherTrimSelectModel: TrimSelectModel(
                                    trimID: otherTrim.trimID,
                                    trimTag: trimSelect.trimTag,
                                    trimName: otherTrim.trimName,
                                    trimPrice: otherTrim.price),
                                interiorColorSelectModel: interiorColorSelect,
                                optionSelectModelArray: optionSelectArray.value)))
                } else {
                    exteriorColorSelect.send(exteriorColor)
                    fetchInteriorColorInquery(exteriorColor: exteriorColor)
                }
            } else {
                if exteriorColor.trimID != interiorColorSelect.trimID {
                    guard let otherTrim = trimInquery.value?.carSpecs
                        .first(where: { $0.trimID == exteriorColor.trimID }),
                          let trimSelect = trimSelect.value else { return }
                    
                    exteriorColorChangeResult.send(
                        .needChangeInteriorColorWithTrim(
                            trimChangeModel: TrimChangeModel(
                                trimSelectModel: trimSelect,
                                otherTrimSelectModel: TrimSelectModel(
                                    trimID: otherTrim.trimID,
                                    trimTag: trimSelect.trimTag,
                                    trimName: otherTrim.trimName,
                                    trimPrice: otherTrim.price),
                                interiorColorSelectModel: interiorColorSelect,
                                optionSelectModelArray: optionSelectArray.value
                            )))
                } else {
                    exteriorColorChangeResult.send(
                        .needChangeInteriorColor(
                            trimChangeModel: TrimChangeModel(
                                exteriorColorSelectModel: ColorSelectModel(
                                    colorType: .exterior,
                                    colorID: -1,
                                    colorName: exteriorColor.colorName,
                                    colorPrice: exteriorColor.colorPrice,
                                    trimID: exteriorColor.trimID,
                                    oppositeColors: exteriorColor.oppositeColors),
                                interiorColorSelectModel: interiorColorSelect,
                                optionSelectModelArray: optionSelectArray.value
                            )))
                }
            }
        }
    }
}
