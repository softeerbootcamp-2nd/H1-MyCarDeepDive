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
    let packages: [OptionInfoDTO]
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
    
    func toDomain() -> Quotation {
        Quotation(
            trimName: trimName,
            carImgUrl: carImgUrl,
            comment1: comment1,
            comment2: comment2,
            keyword: keyword,
            engineName: engineName,
            drivingSystemName: drivingSystemName,
            bodyName: bodyName,
            carSpecId: carSpecId,
            trimId: trimId,
            exteriorColor: exteriorColor.toDomain(),
            interiorColor: interiorColor.toDomain(),
            options: options.map { $0.toDomain() },
            packages: packages.map { $0.toDomain() },
            totalPrice: totalPrice)
    }
}
