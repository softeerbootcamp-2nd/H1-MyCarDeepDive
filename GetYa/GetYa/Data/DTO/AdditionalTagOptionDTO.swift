//
//  AdditionalTagOptionDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

struct AdditionalTagOptionDTO: Codable {
    let additionalOptionID: Int
    let optionName: String
    let optionDescription: String
    let optionImageURL: String
    let price: Int
    let xPosition: CGFloat
    let yPosition: CGFloat
    
    enum CodingKeys: String, CodingKey {
        case additionalOptionID = "additional_option_id"
        case optionName = "option_name"
        case optionDescription = "option_description"
        case optionImageURL = "option_img_url"
        case price
        case xPosition = "position_x"
        case yPosition = "position_y"
    }
    
    func toDomain() -> AdditionalTagOption {
        AdditionalTagOption(
            additionalOptionID: additionalOptionID,
            optionName: optionName,
            optionDescription: optionDescription,
            optionImageURL: optionImageURL,
            price: price,
            xPosition: xPosition,
            yPosition: yPosition)
    }
}
