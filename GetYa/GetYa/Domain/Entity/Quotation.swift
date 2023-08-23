//
//  Quotation.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/23.
//

import Foundation

struct Quotation {
    let trimName: String
    let carImgUrl: String
    let comment1: String
    let comment2: String
    let keyword: String
    let engineName: String
    let drivingSystemName: String
    let bodyName: String
    let carSpecId: Int
    let trimId: Int
    let exteriorColor: ColorInfo
    let interiorColor: ColorInfo
    let options: [OptionInfo]
    let packages: [OptionInfo]
    let totalPrice: Int
}
