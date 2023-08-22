//
//  TrimCarSpecResponseDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct TrimCarSpecResponseDTO: Decodable {
    enum CodingKeys: String, CodingKey {
        case status
        case data
    }
    
    let status: Status
    let data: [TrimCarSpec]
}

struct TrimCarSpec: Decodable {
    let trimName: String
    let price: Int
    let summary: String
    let carSpecID: Int
    let trimID: Int
    let basicOptionNames: [String]
    let basicOptionIDs: [Int]
    
    enum CodingKeys: String, CodingKey {
        case trimName = "trim_name"
        case price
        case summary
        case carSpecID = "car_spec_id"
        case trimID = "trim_id"
        case basicOptionNames = "basic_option_names"
        case basicOptionIDs = "basic_option_ids"
    }
}
