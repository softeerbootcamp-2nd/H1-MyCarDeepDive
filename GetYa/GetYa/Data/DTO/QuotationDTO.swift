//
//  CustomRecommendationDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct CarData: Codable {
    struct Status: Codable {
        let code: String
        let message: String
    }
    
    struct CarDetails: Codable {
        let trimName: String
        let carImgURL: URL
        let comment1: String
        let comment2: String
        let keyword: String
        let engineName: String
        let drivingSystemName: String
        let bodyName: String
        let carSpecID: Int
        let trimID: Int
        let exteriorColorID: Int
        let exteriorColorName: String
        let exteriorColorPrice: Int
        let exteriorColorIconURL: URL
        let interiorColorID: Int
        let interiorColorName: String
        let interiorColorPrice: Int
        let options: [Option]
        let packages: [Package]
        let totalPrice: Int
        
        enum CodingKeys: String, CodingKey {
            case trimName = "trim_name"
            case carImgURL = "car_img_url"
            case comment1, comment2, keyword, engineName, drivingSystemName, bodyName
            case carSpecID = "car_spec_id"
            case trimID = "trim_id"
            case exteriorColorID = "exterior_color_id"
            case exteriorColorName = "exterior_color_name"
            case exteriorColorPrice = "exterior_color_price"
            case exteriorColorIconURL = "exterior_color_icon_url"
            case interiorColorID = "interior_color_id"
            case interiorColorName = "interior_color_name"
            case interiorColorPrice = "interior_color_price"
            case options, packages, totalPrice
        }
    }
    
    let status: Status
    let data: CarDetails
}

struct Option: Codable {
    let optionID: Int
    let optionName: String
    let optionImgURL: URL
    let price: Int
    let comment: String
    
    enum CodingKeys: String, CodingKey {
        case optionID = "option_id"
        case optionName = "option_name"
        case optionImgURL = "option_img_url"
        case price, comment
    }
}

struct Package: Codable {
    let optionID: Int
    let optionName: String
    let optionImgURL: URL
    let price: Int
    let comment: String
    
    enum CodingKeys: String, CodingKey {
        case optionID = "option_id"
        case optionName = "option_name"
        case optionImgURL = "option_img_url"
        case price, comment
    }
}
