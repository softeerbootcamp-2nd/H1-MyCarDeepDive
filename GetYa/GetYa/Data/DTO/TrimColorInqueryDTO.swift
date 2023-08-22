//
//  ColorInquery.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct TrimColorInqueryDTO: Codable {
    let exteriorColor: [TrimColorDTO]
    let interiorColor: [TrimColorDTO]
    
    enum CodingKeys: String, CodingKey {
        case exteriorColor = "exterior_color_response"
        case interiorColor = "interior_color_response"
    }
}
