//
//  OptionSelectUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation

protocol OptionSelectUseCase {
    var optionSelectRepository: OptionSelectRepository { get set }
    
    func fetchAdditionalOptions()
}
