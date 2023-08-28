//
//  AdditionalOptionList.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import Foundation

struct AdditionalOptionInquery: Codable, Hashable {
    let optionPackageList: [AdditionalOption]
    let additionalOptionList: [AdditionalOption]
}
