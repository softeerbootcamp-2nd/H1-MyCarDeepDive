//
//  ColorDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct ColorDTO: Codable {
    let colorID: Int
    let trimID: Int
    let trimName: String
    let name: String
    let imageURL: String
    let carImageURLArray: [String]
    let price: Int
    let selectRate: Int
    
    enum CodingKeys: String, CodingKey {
        case colorID = "color_id"
        case trimID = "trim_id"
        case trimName = "trim_name"
        case name
        case imageURL = "img_url"
        case carImageURLArray = "car_img_urls"
        case price
        case selectRate = "choose_rate"
    }
    
    func toDomain() -> Color {
        return Color(
            colorID: colorID,
            trimID: trimID,
            trimName: trimName,
            name: name,
            imageURL: imageURL,
            carImageURLArray: carImageURLArray,
            price: price,
            selectRate: selectRate)
    }
}
