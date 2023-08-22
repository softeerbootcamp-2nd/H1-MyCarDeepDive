//
//  AdditionalOptionsResponseDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct AdditionalOptionsResponseDTO: Decodable {
    struct OptionPackage: Decodable {
        let packageOptionId: Int
        let optionImgUrl: String
        let optionSelectRate: Float
        let optionName: String
        let optionSummary: String
        let tagList: [OptionTag]
        let badgeName: String
        let price: Int
        let additionalOptionIdList: [Int]
        
        enum CodingKeys: String, CodingKey {
            case packageOptionId = "package_option_id"
            case optionImgUrl = "option_img_url"
            case optionSelectRate = "option_select_rate"
            case optionName = "option_name"
            case optionSummary = "option_summary"
            case tagList = "tag_list"
            case badgeName = "badge_name"
            case price
            case additionalOptionIdList = "additional_option_id_list"
        }
    }
    
    struct AdditionalOption: Decodable {
        let additionalOptionId: Int
        let optionImageUrl: String
        let selectRate: Float
        let optionName: String
        let optionSummary: String
        let tagList: [OptionTag]
        let badgeName: String
        let price: Int
        
        enum CodingKeys: String, CodingKey {
            case additionalOptionId = "additional_option_id"
            case optionImageUrl = "option_img_url"
            case selectRate = "select_rate"
            case optionName = "option_name"
            case optionSummary = "option_summary"
            case tagList = "tag_list"
            case badgeName = "badge_name"
            case price
        }
    }
    
    struct OptionTag: Decodable {
        let id: Int
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case id = "tag_id"
            case name = "tag_name"
        }
    }
    
    struct Data: Decodable {
        let optionPackageList: [OptionPackage]
        let additionalOptionList: [AdditionalOption]
    }
    
    let status: Status
    let data: Data
}
