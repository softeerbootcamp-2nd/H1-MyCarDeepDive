//
//  CustomRecommendationDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct QuotationDTO: Decodable {
    struct Data: Decodable {
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
        let exteriorColorComment: String
        let exteriorColorIconURL: URL
        let interiorColorID: Int
        let interiorColorName: String
        let interiorColorPrice: Int
        let interiorColorComment: String
        let interiorColorIconURL: URL
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
            case exteriorColorComment = "exterior_color_comment"
            case exteriorColorIconURL = "exterior_color_icon_url"
            case interiorColorID = "interior_color_id"
            case interiorColorName = "interior_color_name"
            case interiorColorPrice = "interior_color_price"
            case interiorColorComment = "interior_color_comment"
            case interiorColorIconURL = "interior_color_icon_url"
            case options, packages, totalPrice
        }
    }
    
    struct Option: Decodable {
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
    
    struct Package: Decodable {
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

    let status: Status
    let data: Data
}
