//
//  AdditionalOption.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import Foundation

struct AdditionalOption: Hashable {
    let optionID: Int
    let optionImageURL: String
    let selectRate: CGFloat
    let optionName: String
    let optionSummary: String
    let tagList: [Tag]
    let badgeName: String
    let price: Int
}
