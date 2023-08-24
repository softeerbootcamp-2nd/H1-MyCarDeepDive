//
//  ColorChangeType.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

enum ColorChangeType {
    case needChangeTrim(trimChangeModel: TrimChangeModel) // 색상 선택 가능하지만 트림 변경
    case needChangeExteriorColor(trimChangeModel: TrimChangeModel) // 외장 색상의 변경이 필요함 (채택률 높은걸로)
    case needChangeExteriorColorWithTrim(trimChangeModel: TrimChangeModel) // 트림과 외장 색상의 변경이 필요함
    case needChangeInteriorColor(trimChangeModel: TrimChangeModel) // 내장 색상의 변경이 필요함 (채택률 높은걸로)
    case needChangeInteriorColorWithTrim(trimChangeModel: TrimChangeModel) // 트림과 내장 색상의 변경이 필요함
}
