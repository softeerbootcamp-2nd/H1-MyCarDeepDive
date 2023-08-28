//
//  AdditionalOptionDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

struct AdditionalOptionDTO: Codable {
    let optionID: Int
    let optionImageURL: String
    let selectRate: Int
    let optionName: String
    let optionSummary: String
    let tagList: [TagDTO]
    let badgeName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case optionID = "additional_option_id"
        case optionImageURL = "option_img_url"
        case selectRate = "select_rate"
        case optionName = "option_name"
        case optionSummary = "option_summary"
        case tagList = "tag_list"
        case badgeName = "badge_name"
        case price = "price"
    }
    
    func toDomain() -> AdditionalOption {
        AdditionalOption(
            optionID: optionID,
            optionImageURL: optionImageURL,
            selectRate: selectRate,
            optionName: optionName,
            optionSummary: optionSummary,
            tagList: tagList.map { $0.toDomain() },
            badgeName: badgeName,
            price: price)
    }
}
