//
//  ColorChangeType.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

enum ColorChangeType {
    case needChangeTrim(trimChangeModel: TrimChangeModel)
    case needChangeExteriorColor(
        trimChangeModel: TrimChangeModel,
        colorSelectModel: ColorSelectModel)
    case needChangeExteriorColorWithTrim(
        trimChangeModel: TrimChangeModel,
        colorSelectModel: ColorSelectModel)
    case needChangeInteriorColor(
        trimChangeModel: TrimChangeModel,
        colorSelectModel: ColorSelectModel)
    case needChangeInteriorColorWithTrim(
        trimChangeModel: TrimChangeModel,
        colorSelectModel: ColorSelectModel)
}
