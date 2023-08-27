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
    var additionalTagOptionInquery: PassthroughSubject<AdditionalTagOptionInquery, Never> { get set }
    var additionalOptionSelectArray: CurrentValueSubject<[AdditionalOption], Never> { get set }
    var additionalPackageOptionSelectArray: CurrentValueSubject<[AdditionalOption], Never> { get set }
    
    func fetchAdditionalOptions()
    func fetchAdditionalOptionsByTag(tagID: Int)
    func storeSelectOptionList(optionNumbers: [Int])
    func storeSelectPackageOptionList(optionNumbers: [Int])
}
