//
//  TagOption.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import Foundation

struct TagOption: Hashable {
    let optionID: Int
    let optionName: String
    let optionDescription: String
    let optionImageURL: String
    let price: Int
    let positionX: CGFloat
    let positionY: CGFloat
}
