//
//  DefaultCarSettingUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

class DefaultCarSettingUseCase: TrimSelectUseCase, ColorSelectUseCase, OptionSelectUseCase {
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
    
    var additionalOptionInqeury = CurrentValueSubject<AdditionalOptionInquery?, Never>(nil)
    var additionalTagOptionInquery = PassthroughSubject<AdditionalTagOptionInquery, Never>()
    var additionalOptionSelectArray = CurrentValueSubject<[AdditionalOption], Never>([])
    var additionalPackageOptionSelectArray = CurrentValueSubject<[AdditionalOption], Never>([])
    
    // MARK: - Properties
    var trimSelectRepository: TrimSelectRepository
    var colorSelectRepository: ColorSelectRepository
    var optionSelectRepository: OptionSelectRepository
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(
        trimSelectRepository: TrimSelectRepository,
        colorSelectRepository: ColorSelectRepository,
        optionSelectRepository: OptionSelectRepository
    ) {
        self.trimSelectRepository = trimSelectRepository
        self.colorSelectRepository = colorSelectRepository
        self.optionSelectRepository = optionSelectRepository
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
                        carSpecID: recommendCarSpec.carSpecID,
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
                
                if let exteriorColorSelect = exteriorColorSelect.value,
                   let interiorColorSelect = interiorColorSelect.value {
                    self.exteriorColorSelect.send(exteriorColorSelect)
                    self.interiorColorSelect.send(interiorColorSelect)
                } else {
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
                }
            } catch {
                print("TrimColorInquery 데이터를 받아오지 못하였습니다.")
            }
        })
    }
    
    func fetchExteriorInteriorTrimColor(colorSelect: ColorSelectModel) {
        Task(operation: {
            do {
                if colorSelect.colorType == .exterior {
                    self.exteriorColorSelect.send(colorSelect)
                    guard let trimInquery = trimInquery.value,
                          let trimSelect = trimSelect.value else { return }
                    let trim = trimInquery.carSpecs.filter { $0.trimID == colorSelect.trimID }[0]
                    fetchTrimSelectLog(
                        trimSelectModel: TrimSelectModel(
                            carSpecID: trim.carSpecID,
                            trimID: trim.trimID,
                            trimTag: trimSelect.trimTag,
                            trimName: trim.trimName,
                            trimPrice: trim.price))
                    
                    let interiorTrimColor = try await self.colorSelectRepository.fetchInteriorColor(
                        with: colorSelect)
                    let interiorIndex = interiorTrimColor.availableColors.firstIndex(where: {
                        interiorColorSelect.value?.colorID == $0.colorID
                    })
                    
                    let interiorColor = interiorTrimColor.availableColors[interiorIndex ?? 0]
                    let interiorColorSelectModel = ColorSelectModel(
                        colorType: .interior,
                        colorID: interiorColor.colorID,
                        colorName: interiorColor.name,
                        colorPrice: interiorColor.price,
                        trimID: interiorColor.trimID,
                        oppositeColors: interiorColor.oppositeColors)
                    self.interiorColorChangeModel.send(
                        ColorChangeModel(
                            trimColor: interiorTrimColor,
                            colorSelectModel: colorSelect,
                            selectIndex: interiorIndex ?? 0))
                    self.interiorColorSelect.send(interiorColorSelectModel)
                    let exteriorColor = try await colorSelectRepository.fetchExteriorColor(
                        with: interiorColorSelectModel)
                    let exteriorIndex = exteriorColor.availableColors.firstIndex(where: {
                        colorSelect.colorID == $0.colorID
                    })
                    self.exteriorColorChangeModel.send(
                        ColorChangeModel(
                            trimColor: exteriorColor,
                            colorSelectModel: interiorColorSelectModel,
                            selectIndex: exteriorIndex ?? 0))
                } else {
                    self.interiorColorSelect.send(colorSelect)
                    guard let trimInquery = trimInquery.value,
                          let trimSelect = trimSelect.value else { return }
                    let trim = trimInquery.carSpecs.filter { $0.trimID == colorSelect.trimID }[0]
                    fetchTrimSelectLog(
                        trimSelectModel: TrimSelectModel(
                            carSpecID: trim.carSpecID,
                            trimID: trim.trimID,
                            trimTag: trimSelect.trimTag,
                            trimName: trim.trimName,
                            trimPrice: trim.price))
                    
                    let exteriorTrimColor = try await self.colorSelectRepository.fetchExteriorColor(
                        with: colorSelect)
                    let exteriorIndex = exteriorTrimColor.availableColors.firstIndex(where: {
                        exteriorColorSelect.value?.colorID == $0.colorID
                    })
                    
                    let exteriorColor = exteriorTrimColor.availableColors[exteriorIndex ?? 0]
                    let exteriorColorSelectModel = ColorSelectModel(
                        colorType: .interior,
                        colorID: exteriorColor.colorID,
                        colorName: exteriorColor.name,
                        colorPrice: exteriorColor.price,
                        trimID: exteriorColor.trimID,
                        oppositeColors: exteriorColor.oppositeColors)
                    self.exteriorColorChangeModel.send(
                        ColorChangeModel(
                            trimColor: exteriorTrimColor,
                            colorSelectModel: colorSelect,
                            selectIndex: exteriorIndex ?? 0))
                    self.exteriorColorSelect.send(exteriorColorSelectModel)
                    let interiorColor = try await colorSelectRepository.fetchInteriorColor(
                        with: exteriorColorSelectModel)
                    let interiorIndex = interiorColor.availableColors.firstIndex(where: {
                        colorSelect.colorID == $0.colorID
                    })
                    self.interiorColorChangeModel.send(
                        ColorChangeModel(
                            trimColor: interiorColor,
                            colorSelectModel: exteriorColorSelectModel,
                            selectIndex: interiorIndex ?? 0))
                }
            } catch {
                print("색상 변경에 따른 데이터 통신이 잘못되었습니다.")
            }
        })
    }
    
    func fetchExteriorTrimColor(interiorColor: ColorSelectModel) {
        Task(operation: {
            do {
                self.interiorColorSelect.send(interiorColor)
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
    
    func fetchInteriorTrimColor(exteriorColor: ColorSelectModel) {
        Task(operation: {
            do {
                self.exteriorColorSelect.send(exteriorColor)
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
                                    carSpecID: otherTrim.carSpecID,
                                    trimID: otherTrim.trimID,
                                    trimTag: trimSelect.trimTag,
                                    trimName: otherTrim.trimName,
                                    trimPrice: otherTrim.price),
                                interiorColorSelectModel: interiorColor,
                                optionSelectModel: additionalOptionSelectArray.value,
                                packageOptionSelectModel: additionalPackageOptionSelectArray.value
                            )))
                } else {
                    fetchExteriorTrimColor(interiorColor: interiorColor)
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
                                    carSpecID: otherTrim.carSpecID,
                                    trimID: otherTrim.trimID,
                                    trimTag: trimSelect.trimTag,
                                    trimName: otherTrim.trimName,
                                    trimPrice: otherTrim.price),
                                exteriorColorSelectModel: exteriorColorSelect,
                                optionSelectModel: additionalOptionSelectArray.value,
                                packageOptionSelectModel: additionalPackageOptionSelectArray.value),
                            colorSelectModel: interiorColor
                        ))
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
                                optionSelectModel: additionalOptionSelectArray.value,
                                packageOptionSelectModel: additionalPackageOptionSelectArray.value),
                            colorSelectModel: interiorColor
                        ))
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
                                    carSpecID: otherTrim.carSpecID,
                                    trimID: otherTrim.trimID,
                                    trimTag: trimSelect.trimTag,
                                    trimName: otherTrim.trimName,
                                    trimPrice: otherTrim.price),
                                exteriorColorSelectModel: exteriorColor,
                                optionSelectModel: additionalOptionSelectArray.value,
                                packageOptionSelectModel: additionalPackageOptionSelectArray.value
                            )))
                } else {
                    fetchInteriorTrimColor(exteriorColor: exteriorColor)
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
                                    carSpecID: otherTrim.carSpecID,
                                    trimID: otherTrim.trimID,
                                    trimTag: trimSelect.trimTag,
                                    trimName: otherTrim.trimName,
                                    trimPrice: otherTrim.price),
                                interiorColorSelectModel: interiorColorSelect,
                                optionSelectModel: additionalOptionSelectArray.value,
                                packageOptionSelectModel: additionalPackageOptionSelectArray.value),
                            colorSelectModel: exteriorColor
                        ))
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
                                optionSelectModel: additionalOptionSelectArray.value,
                                packageOptionSelectModel: additionalPackageOptionSelectArray.value),
                            colorSelectModel: exteriorColor
                        ))
                }
            }
        }
    }
}

// MARK: - OptionSelectUseCase
extension DefaultCarSettingUseCase {
    func fetchAdditionalOptions() {
        Task(operation: {
            do {
                guard let trimSelect = trimSelect.value else { return }
                let additionalOptionInquery = try await self.optionSelectRepository
                    .fetchAdditionalOption(with: trimSelect.carSpecID)
                
                self.additionalOptionInqeury.send(additionalOptionInquery)
            } catch {
                print("Car Spec ID에 해당하는 추가 옵션 리스트를 전송받지 못하였습니다.")
            }
        })
    }
    
    func fetchAdditionalOptionsByTag(tagID: Int) {
        Task(operation: {
            do {
                guard let trimSelect = trimSelect.value else { return }
                
                if tagID == 1 {
                    self.additionalOptionInqeury.send(additionalOptionInqeury.value)
                } else {
                    let additionalTagOptionInquery = try await self.optionSelectRepository
                        .fetchAdditionalOptionByTag(carSpecID: trimSelect.carSpecID, tagID: tagID)
                    
                    self.additionalTagOptionInquery.send(additionalTagOptionInquery)
                }
            } catch {
                print("Car Spec ID와 Tag ID에 해당하는 추가 태그 옵션 리스트를 전송받지 못하였습니다.")
            }
        })
    }
    
    func storeSelectOptionList(optionNumbers: [Int]) {
        guard let inqeury = additionalOptionInqeury.value else { return }
        let optionSelectArray = inqeury.additionalOptionList
            .filter { optionNumbers.contains($0.optionID) }
        additionalOptionSelectArray.send(optionSelectArray)
    }
    
    func storeSelectPackageOptionList(optionNumbers: [Int]) {
        guard let inqeury = additionalOptionInqeury.value else { return }
        let optionSelectArray = inqeury.optionPackageList
            .filter { optionNumbers.contains($0.optionID) }
        additionalPackageOptionSelectArray.send(optionSelectArray)
    }
}
