//
//  QuotationFinishDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct QuotationFinishDTO: Codable {
    let carName: String
    let engineName: String
    let drvingSystemName: String
    let trimName: String
    let bodyName: String
    let exteriorColorName: String
    let exteriorColorImageURL: String
    let exteriorColorPrice: Int
    let interiorColorName: String
    let interiorColorImageURL: String
    let interiorColorPrice: Int
    let optionList: [OptionInfoDTO]
    let basicPrice: Int
    let pdfURL: String
    let totalPrice: Int
    
    enum CodinKeys: String, CodingKey {
        case carName = "car_name"
        case engineName = "engine_name"
        case drivingSystemName = "driving_system_name"
        case trimName = "trim_name"
        case bodyName = "body_name"
        case exteriorColorName = "exterior_color_name"
        case exteriorColorImageURL = "exterior_color_img_url"
        case exteriorColorPrice = "exterior_color_price"
        case interiorColorName = "interior_color_name"
        case interiorColorImageURL = "interior_color_img_url"
        case interiorColorPrice = "interior_color_price"
        case optionList = "option_list"
        case basicPrice = "basic_price"
        case pdfURL = "pdf_url"
        case totalPrice = "total_price"
    }
}
