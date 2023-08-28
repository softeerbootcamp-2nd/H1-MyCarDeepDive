//
//  Quotation.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import Foundation

struct Quotation: Codable {
    let trimName: String
    let trimPrice: Int
    let carImageURL: String
    let comment1: String
    let comment2: String
    let keyword: String
    let engineName: String
    let engineID: Int
    let drivingSystemName: String
    let drivingSystemID: Int
    let bodyName: String
    let bodyID: Int
    let carSpecID: Int
    let trimID: Int
    let exteriorColor: QuotationColor
    let interiorColor: QuotationColor
    let options: [QuotationOption]
    let packages: [QuotationOption]
    let totalPrice: Int
}
