//
//  OptionInfo.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct OptionInfo: Codable {
    let optionID: Int?
    let optionName: String
    let optionImageURL: String
    let optionPrice: Int
    let optionComment: String?
    
    func toDTO() -> OptionInfoDTO {
        return OptionInfoDTO(optionInfo: self)
    }
}
