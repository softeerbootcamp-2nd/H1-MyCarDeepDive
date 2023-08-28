//
//  QuotationPackage.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import Foundation

struct QuotationPackage: Decodable {
    let optionID: Int
    let optionName: String
    let optionImageURL: String
    let price: Int
    let comment: String
}
