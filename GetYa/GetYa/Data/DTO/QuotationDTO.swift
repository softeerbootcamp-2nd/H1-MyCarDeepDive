//
//  CustomRecommendationDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct QuotationDTO: Decodable {
    let trimName: String
    let trimPrice: Int
    let carImgUrl: String
    let comment1: String
    let comment2: String
    let keyword: String
    let engineName: String
    let engineId: Int
    let drivingSystemName: String
    let drivingSystemId: Int
    let bodyName: String
    let bodyId: Int
    let carSpecId: Int
    let trimId: Int
    let exteriorColor: ColorInfoDTO
    let interiorColor: ColorInfoDTO
    let options: [OptionInfoDTO]
    let packages: [OptionInfoDTO]
    let totalPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case trimName = "trim_name"
        case trimPrice = "trim_price"
        case carImgUrl = "car_img_url"
        case comment1
        case comment2
        case keyword
        case engineName = "engine_name"
        case engineId = "engine_id"
        case drivingSystemName = "driving_system_name"
        case drivingSystemId = "driving_system_id"
        case bodyName = "body_name"
        case bodyId = "body_id"
        case carSpecId = "car_spec_id"
        case trimId = "trim_id"
        case exteriorColor = "exterior_color"
        case interiorColor = "interior_color"
        case options
        case packages
        case totalPrice = "total_price"
    }
    
    func toDomain() -> QuotationModel {
        QuotationModel(
            trimName: trimName,
            trimPrice: trimPrice,
            carImgUrl: carImgUrl,
            comment1: comment1,
            comment2: comment2,
            keyword: keyword,
            engineName: engineName,
            engineId: engineId,
            drivingSystemName: drivingSystemName,
            drivingSystemId: drivingSystemId,
            bodyName: bodyName,
            bodyId: bodyId,
            carSpecId: carSpecId,
            trimId: trimId,
            exteriorColor: exteriorColor.toDomain(),
            interiorColor: interiorColor.toDomain(),
            options: options.map { $0.toDomain() },
            packages: packages.map { $0.toDomain() },
            totalPrice: totalPrice)
    }
}
