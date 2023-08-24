//
//  AlertType.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/16.
//

import Foundation

enum AlertType {
    case title(title: String)
    case message(title: String, description: String)
    case share(pdfID: String)
    case mail
    case settingChange(
        trimName: String? = nil, trimPirce: Int? = nil,
        otherTrimName: String? = nil, otherTrimPrice: Int? = nil,
        exteriorColorName: String? = nil, exteriorColorPrice: Int? = nil,
        interiorColorName: String? = nil, interiorColorPirce: Int? = nil,
        optionNames: [String]? = nil, optionPrices: [Int]? = nil)
}

enum AlertButtonType {
    case oneButton
    case twoButton
}
