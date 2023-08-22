//
//  BasicOption.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import Foundation

struct BasicOption: Hashable {
    let optionID: Int
    let optionImageURL: String
    let optionName: String
    let tagList: [Tag]
}
