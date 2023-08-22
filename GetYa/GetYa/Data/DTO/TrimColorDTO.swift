//
//  TrimColorDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct TrimColorDTO: Codable {
    let availableColors: [ColorDTO]
    let unAvailableColors: [ColorDTO]
    let otherTrimColors: [ColorDTO]
    
    enum CodingKeys: String, CodingKey {
        case availableColors = "available_colors"
        case unAvailableColors = "unavailable_colors"
        case otherTrimColors = "other_trim_colors"
    }
}
