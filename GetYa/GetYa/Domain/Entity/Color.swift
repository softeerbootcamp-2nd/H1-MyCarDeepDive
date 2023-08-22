//
//  Color.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct Color: Codable {
    let colorID: Int
    let trimID: Int
    let trimName: String
    let name: String
    let imageURL: String
    let carImageURLArray: [String]
    let price: Int
    let selectRate: Int
}
