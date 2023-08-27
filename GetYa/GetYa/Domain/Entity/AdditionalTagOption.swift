//
//  AdditionalTagOption.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

struct AdditionalTagOption: Hashable {
    let additionalOptionID: Int
    let optionName: String
    let optionDescription: String
    let optionImageURL: String
    let price: Int
    let xPosition: CGFloat
    let yPosition: CGFloat
}
