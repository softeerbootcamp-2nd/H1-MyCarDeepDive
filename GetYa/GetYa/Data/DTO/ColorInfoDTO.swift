//
//  ColorInfoDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/22.
//

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
    
    func toDomain() -> ColorInfoModel {
        return ColorInfoModel(
            colorId: colorId,
            colorName: colorName,
            colorPrice: colorPrice,
            colorComment: colorComment,
            colorIconUrl: colorIconUrl)
    }
}
