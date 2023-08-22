//
//  TrimColor.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct TrimColor: Codable {
    let availableColors: [Color]
    let unAvailableColors: [Color]
    let otherTrimColors: [Color]
}
