//
//  BasicOptionDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

struct BasicOptionDTO: Codable {
    let optionID: Int
    let optionImageURL: String
    let optionName: String
    let tagList: [TagDTO]
    
    enum CodingKeys: String, CodingKey {
        case optionID = "basic_option_id"
        case optionImageURL = "option_img_url"
        case optionName = "option_name"
        case tagList = "tag_list"
    }
    
    func toDomain() -> BasicOption {
        BasicOption(
            optionID: optionID,
            optionImageURL: optionImageURL,
            optionName: optionName,
            tagList: tagList.map { $0.toDomain() })
    }
}
