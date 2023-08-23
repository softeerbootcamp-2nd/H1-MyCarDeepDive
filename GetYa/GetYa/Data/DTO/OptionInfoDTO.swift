//
//  OptionInfoDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/22.
//

struct OptionInfoDTO: Codable {
    let optionID: Int?
    let optionName: String
    let optionImageURL: String
    let price: Int
    let comment: String?
    
    enum CodingKeys: String, CodingKey {
        case optionID = "option_id"
        case optionName = "option_name"
        case optionImageURL = "option_img_url"
        case price
        case comment
    }
    
    func toDomain() -> OptionInfo {
        return OptionInfo(
            optionID: optionID,
            optionName: optionName,
            optionImageURL: optionImageURL,
            price: price,
            comment: comment)
    }
}
