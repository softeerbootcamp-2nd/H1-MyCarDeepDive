//
//  ColorInfoDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/22.
//

struct QuotationColorDTO: Decodable {
    let colorID: Int
    let colorName: String
    let price: Int
    let comment: String
    let colorImageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case colorID = "color_id"
        case colorName = "color_name"
        case price = "color_price"
        case comment = "color_comment"
        case colorImageUrl = "color_icon_url"
    }
    
    func toDomain() -> QuotationColor {
        QuotationColor(
            colorID: colorID,
            colorName: colorName,
            price: price,
            comment: comment,
            colorImageURL: colorImageUrl)
    }
}
