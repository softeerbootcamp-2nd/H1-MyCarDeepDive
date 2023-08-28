//
//  PdfID.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation

struct PdfIdDTO: Codable {
    let pdfID: String?
    
    enum CodingKeys: String, CodingKey {
        case pdfID = "pdfId"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pdfID = try? container.decode(String.self, forKey: .pdfID)
    }
}
