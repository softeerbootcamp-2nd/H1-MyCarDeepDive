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
    let carImageURL: String
    let comment1: String
    let comment2: String
    let keyword: String
    let engineName: String
    let engineID: Int
    let drivingSystemName: String
    let drivingSystemID: Int
    let bodyName: String
    let bodyID: Int
    let carSpecID: Int
    let trimID: Int
    let exteriorColor: QuotationColorDTO
    let interiorColor: QuotationColorDTO
    let options: [QuotationOptionDTO]
    let packages: [QuotationOptionDTO]
    let totalPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case trimName = "trim_name"
        case trimPrice = "trim_price"
        case carImageURL = "car_img_url"
        case comment1
        case comment2
        case keyword
        case engineName = "engine_name"
        case engineID = "engine_id"
        case drivingSystemName = "driving_system_name"
        case drivingSystemID = "driving_system_id"
        case bodyName = "body_name"
        case bodyID = "body_id"
        case carSpecID = "car_spec_id"
        case trimID = "trim_id"
        case exteriorColor = "exterior_color"
        case interiorColor = "interior_color"
        case options
        case packages
        case totalPrice = "total_price"
    }
    
    func toDomain() -> Quotation {
        Quotation(
            trimName: trimName,
            trimPrice: trimPrice,
            carImageURL: carImageURL,
            comment1: comment1,
            comment2: comment2,
            keyword: keyword,
            engineName: engineName,
            engineID: engineID,
            drivingSystemName: drivingSystemName,
            drivingSystemID: drivingSystemID,
            bodyName: bodyName,
            bodyID: bodyID,
            carSpecID: carSpecID,
            trimID: trimID,
            exteriorColor: exteriorColor.toDomain(),
            interiorColor: interiorColor.toDomain(),
            options: options.map { $0.toDomain() },
            packages: packages.map { $0.toDomain() },
            totalPrice: totalPrice
        )
    }
}
