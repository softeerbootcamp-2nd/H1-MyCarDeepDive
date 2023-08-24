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
    var exteriorColorSelect: CurrentValueSubject<Color?, Never> { get set }
    var interiorColorSelect: CurrentValueSubject<Color?, Never> { get set }
    var trimColorInquery: PassthroughSubject<TrimColorInquery, Never> { get set }
    var colorSelectRepository: ColorSelectRepository { get set }
    
    func fetchColorInquery()
    func validateInteriorColor(
        interiorColor: ColorSelectModel
    ) -> AnyPublisher<ColorChangeType, ColorSelectUseCaseError>
    func validateExteriorColor(
        exteriorColor: ColorSelectModel
    ) -> AnyPublisher<ColorChangeType, ColorSelectUseCaseError>
}
