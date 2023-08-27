//
//  AdditionalOptionInqueryDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

struct AdditionalOptionInqueryDTO: Codable {
    let optionPackageList: [AdditionalOptionPackageDTO]
    let additionalOptionList: [AdditionalOptionDTO]
    
    enum CodingKeys: String, CodingKey {
        case optionPackageList
        case additionalOptionList
    }
    
    func toDomain() -> AdditionalOptionInquery {
        AdditionalOptionInquery(
            optionPackageList: optionPackageList.map { $0.toDomain() },
            additionalOptionList: additionalOptionList.map { $0.toDomain() })
    }
}
