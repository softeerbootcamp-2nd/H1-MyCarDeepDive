//
//  CategoryType.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import Foundation

enum TagCategoryType: String, CaseIterable {
    case main
    case all
    case safeDrive
    case convenience
    case temperature
    case parking
    case performance
    case style
    
    var title: String {
        switch self {
        case .main:
            return "대표"
        case .all:
            return "전체"
        case .safeDrive:
            return "주행안전"
        case .convenience:
            return "사용편의"
        case .temperature:
            return "추위/더위"
        case .parking:
            return "주차/출차"
        case .performance:
            return "퍼포먼스"
        case .style:
            return "스타일"
        }
    }
}
