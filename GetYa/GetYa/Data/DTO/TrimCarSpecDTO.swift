//
//  TrimCarSpec.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation

struct TrimCarSpecDTO: Codable {
    let trimName: String
    let price: Int
    let summary: String
    let carSpecID: Int
    let trimID: Int
    let trimImageURL: String
    let exteriorColorImageURLs: [String]
    let interiorColorImageURLs: [String]
    let basicOptionNames: [String]
    let basicOptionID: [Int]
    let basicOptionImageURLs: [String]
    
    enum CodingKeys: String, CodingKey {
        case trimName = "trim_name"
        case price = "price"
        case summary = "summary"
        case carSpecID = "car_spec_id"
        case trimID = "trim_id"
        case trimImageURL = "trim_img_url"
        case exteriorColorImageURLs = "exterior_color_img_urls"
        case interiorColorImageURLs = "interior_color_img_urls"
        case basicOptionNames = "basic_option_names"
        case basicOptionID = "basic_option_ids"
        case basicOptionImageURLs = "basic_option_urls"
    }
    
    func toDomain() -> TrimCarSpec {
        return TrimCarSpec(
            trimName: trimName,
            price: price,
            summary: summary,
            carSpecID: carSpecID,
            trimID: trimID,
            trimImageURL: trimImageURL,
            exteriorColorImageURLArray: exteriorColorImageURLs,
            interiorColorImageURLArray: interiorColorImageURLs,
            basicOptionNames: basicOptionNames,
            basicOptionID: basicOptionID,
            basicOptionImageURLArray: basicOptionImageURLs)
    }
}
