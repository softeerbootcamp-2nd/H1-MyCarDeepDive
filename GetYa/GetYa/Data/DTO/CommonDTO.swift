//
//  CommonDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/22.
//

import Foundation

struct CommonDTO<T: Decodable>: Decodable {
    let status: Status
    let data: T
}
