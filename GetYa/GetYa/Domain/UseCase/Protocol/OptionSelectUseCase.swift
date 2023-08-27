//
//  OptionSelectUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

protocol OptionSelectUseCase {
    var optionSelectRepository: OptionSelectRepository { get set }
    var additionalOptionInqeury: CurrentValueSubject<AdditionalOptionInquery?, Never> { get set }
    var additionalOptionSelect: CurrentValueSubject<AdditionalOptionSelectModel?, Never> { get set }
    var additionTagOptionInquery: PassthroughSubject<AdditionalTagOptionInquery, Never> { get set }
    
    func fetchAdditionalOptions()
    func fetchAdditionalOptionsByTag(tagID: Int)
}
