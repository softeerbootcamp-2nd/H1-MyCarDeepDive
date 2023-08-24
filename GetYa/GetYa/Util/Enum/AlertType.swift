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
    case settingChange(trimChangeModel: TrimChangeModel)
}

enum AlertButtonType {
    case oneButton
    case twoButton
}
