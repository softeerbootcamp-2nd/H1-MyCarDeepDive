//
//  PackageInfoDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/22.
//

struct PackageInfoDTO: Decodable {
    let optionId: Int
    let optionName: String
    let optionImgUrl: String
    let price: Int
    let comment: String
    
    enum CodingKeys: String, CodingKey {
        case optionId = "option_id"
        case optionName = "option_name"
        case optionImgUrl = "option_img_url"
        case price
        case comment
    }
}
