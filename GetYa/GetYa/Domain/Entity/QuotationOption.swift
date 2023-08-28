//
//  OptionInfo.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct QuotationOption: Codable {
    let optionID: Int?
    let optionName: String
    let optionImageURL: String
    let price: Int
    let comment: String?
    
    func toDTO() -> QuotationOptionDTO {
        return QuotationOptionDTO(optionInfo: self)
    }
}
