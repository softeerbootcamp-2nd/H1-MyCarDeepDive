//
//  ColorSelectUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

enum ColorSelectUseCaseError: Error {
    case notExistExteriorColor
    case notExistInteriorColor
}

protocol ColorSelectUseCase {
    var exteriorColorSelect: CurrentValueSubject<ColorSelectModel?, Never> { get set }
    var interiorColorSelect: CurrentValueSubject<ColorSelectModel?, Never> { get set }
    var trimColorInquery: PassthroughSubject<TrimColorInquery, Never> { get set }
    var exteriorColorChangeModel: PassthroughSubject<ColorChangeModel, Never> { get set }
    var interiorColorChangeModel: PassthroughSubject<ColorChangeModel, Never> { get set }
    var exteriorColorChangeResult: PassthroughSubject<ColorChangeType, Never> { get set }
    var interiorColorChangeResult: PassthroughSubject<ColorChangeType, Never> { get set }
    var colorSelectRepository: ColorSelectRepository { get set }
    
    func fetchColorInquery()
    func validateInteriorColor(interiorColor: ColorSelectModel)
    func validateExteriorColor(exteriorColor: ColorSelectModel)
}
