//
//  ContractionQuotationDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation

struct ContractionQuotationDTO: Codable {
    let carSpecID: Int
    let trimID: Int
    let exteriorColorID: Int
    let interiorColorID: Int
    let additionalOptionIDList: [Int]
    
    enum CodingKeys: String, CodingKey {
        case carSpecID = "car_spec_id"
        case trimID = "trim_id"
        case exteriorColorID = "exterior_color_id"
        case interiorColorID = "interior_color_id"
        case additionalOptionIDList = "additional_option_id_list"
    }
    
    init(contractionQuotation: ContractionQuotation) {
        self.carSpecID = contractionQuotation.carSpecID
        self.trimID = contractionQuotation.trimID
        self.exteriorColorID = contractionQuotation.exteriorColorID
        self.interiorColorID = contractionQuotation.interiorColorID
        self.additionalOptionIDList = contractionQuotation.additionalOptionIDList
    }
}
