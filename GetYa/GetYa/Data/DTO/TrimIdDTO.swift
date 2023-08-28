//
//  TrimIdDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct TrimIdDTO: Codable {
    let trimID: Int
    
    enum CodingKeys: String, CodingKey {
        case trimID = "trimId"
    }
}
