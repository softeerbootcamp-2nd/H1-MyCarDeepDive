//
//  ColorSelectUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

protocol ColorSelectUseCase {
    var colorSelect: PassthroughSubject<ColorSelectModel, Never> { get set }
    var trimColorInquery: PassthroughSubject<TrimColorInquery, Never> { get set }
    var colorRepository: ColorRepository { get set }
    
    func fetchColorInquery()
}
