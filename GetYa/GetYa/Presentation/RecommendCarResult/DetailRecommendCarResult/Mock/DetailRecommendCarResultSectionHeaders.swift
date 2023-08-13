//
//  DetailRecommendCarResultSectionHeaders.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/10.
//

import Foundation

enum DetailRecommendCarResultSectionHeaders: String, CaseIterable {
    case first = "색상"
    case second = "옵션"
    
    static var lists: [String] {
        Self.allCases.map { $0.rawValue }
    }
}
