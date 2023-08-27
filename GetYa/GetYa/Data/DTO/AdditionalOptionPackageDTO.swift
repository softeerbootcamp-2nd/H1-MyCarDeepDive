//
//  AdditionalOptionPackageDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

struct AdditionalOptionPackageDTO: Codable {
    let optionID: Int
    let optionImageURL: String
    let selectRate: Int
    let optionName: String
    let optionSummary: String
    let tagList: [TagDTO]
    let badgeName: String
    let price: Int
    let additionalOptionIDList: [Int]
    
    enum CodingKeys: String, CodingKey {
        case optionID = "package_option_id"
        case optionImageURL = "option_img_url"
        case selectRate = "option_select_rate"
        case optionName = "option_name"
        case optionSummary = "option_summary"
        case tagList = "tag_list"
        case badgeName = "badge_name"
        case price = "price"
        case additionalOptionIDList = "additional_option_id_list"
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
            price: price,
            additionalOptionIDList: additionalOptionIDList)
    }
}
