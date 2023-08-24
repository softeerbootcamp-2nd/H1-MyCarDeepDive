//
//  TrimSubOptionType.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation

enum Engine: String, CaseIterable {
    case diesel = "디젤 2.2"
    case gasoline = "가솔린 3.8"
}

enum Body: String, CaseIterable {
    case seven = "7인승"
    case eight = "8인승"
}

enum DrivingSystem: String, CaseIterable {
    case twoWD = "2WD"
    case fourWD = "4WD"
}
