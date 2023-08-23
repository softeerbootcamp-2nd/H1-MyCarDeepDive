//
//  PdfUrlDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation

struct PdfUrlDTO: Codable {
    let pdfURL: String?
    
    enum CodingKeys: String, CodingKey {
        case pdfURL = "pdfUrl"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pdfURL = try? container.decode(String.self, forKey: .pdfURL)
    }
}
