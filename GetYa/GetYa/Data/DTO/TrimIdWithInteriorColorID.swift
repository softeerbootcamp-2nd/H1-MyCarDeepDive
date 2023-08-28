//
//  TrimIdWithInteriorColorID.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/25.
//

import Foundation

struct TrimIdWithInteriorColorID: Codable {
    var trimID: Int
    var colorID: Int
    
    enum CodingKeys: String, CodingKey {
        case trimID = "trimId"
        case colorID = "interiorColorId"
    }
}
