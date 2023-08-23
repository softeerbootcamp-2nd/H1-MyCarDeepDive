//
//  ContractionQuotation.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation

struct ContractionQuotation: Codable {
    let carSpecID: Int
    let trimID: Int
    let exteriorColorID: Int
    let interiorColorID: Int
    let additionalOptionIDList: [Int]
}
