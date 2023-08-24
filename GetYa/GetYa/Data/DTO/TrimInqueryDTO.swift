//
//  TrimCarSpec.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct TrimInqueryDTO: Codable {
    let carSpecs: [TrimCarSpecDTO]
    let recommendTrimID: Int
    
    enum CodingKeys: String, CodingKey {
        case carSpecs = "car_specs"
        case recommendTrimID = "recommend_trim_id"
    }
    
    func toDomain() -> TrimInquery {
        return TrimInquery(
            carSpecs: carSpecs.map { $0.toDomain() },
            recommendTrimID: recommendTrimID)
    }
}
