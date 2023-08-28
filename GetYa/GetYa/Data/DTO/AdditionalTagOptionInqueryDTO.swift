//
//  AdditionalTagOptionInqueryDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

struct AdditionalTagOptionInqueryDTO: Codable {
    let tagImageURL: String
    let options: [AdditionalTagOptionDTO]
    
    enum CodingKeys: String, CodingKey {
        case tagImageURL = "tag_img_url"
        case options
    }
    
    func toDomain() -> AdditionalTagOptionInquery {
        AdditionalTagOptionInquery(
            tagImageURL: tagImageURL,
            options: options.map { $0.toDomain() })
    }
}
