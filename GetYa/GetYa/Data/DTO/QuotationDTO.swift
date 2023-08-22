//
//  CustomRecommendationDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct QuotationDTO: Decodable {
    let trimName: String
    let carImgUrl: String
    let comment1: String
    let comment2: String
    let keyword: String
    let engineName: String
    let drivingSystemName: String
    let bodyName: String
    let carSpecId: Int
    let trimId: Int
    let exteriorColor: ColorInfoDTO
    let interiorColor: ColorInfoDTO
    let options: [OptionInfoDTO]
    let packages: [PackageInfoDTO]
    let totalPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case trimName = "trim_name"
        case carImgUrl = "car_img_url"
        case comment1
        case comment2
        case keyword
        case engineName = "engine_name"
        case drivingSystemName = "driving_system_name"
        case bodyName = "body_name"
        case carSpecId = "car_spec_id"
        case trimId = "trim_id"
        case exteriorColor = "exterior_color"
        case interiorColor = "interior_color"
        case options
        case packages
        case totalPrice
    }
}

struct ColorInfoDTO: Decodable {
    let colorId: Int
    let colorName: String
    let colorPrice: Int
    let colorComment: String
    let colorIconUrl: String
    
    enum CodingKeys: String, CodingKey {
        case colorId = "color_id"
        case colorName = "color_name"
        case colorPrice = "color_price"
        case colorComment = "color_comment"
        case colorIconUrl = "color_icon_url"
    }
}

struct OptionInfoDTO: Decodable {
    let optionId: Int
    let optionName: String
    let optionImgUrl: String
    let price: Int
    let comment: String
    
    enum CodingKeys: String, CodingKey {
        case optionId = "option_id"
        case optionName = "option_name"
        case optionImgUrl = "option_img_url"
        case price
        case comment
    }
}

struct PackageInfoDTO: Decodable {
    let optionId: Int
    let optionName: String
    let optionImgUrl: String
    let price: Int
    let comment: String
    
    enum CodingKeys: String, CodingKey {
        case optionId = "option_id"
        case optionName = "option_name"
        case optionImgUrl = "option_img_url"
        case price
        case comment
    }
}
