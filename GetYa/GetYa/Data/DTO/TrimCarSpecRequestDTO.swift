//
//  TrimCarSpecRequestDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct TrimCarSpecRequestDTO: Encodable {
    let engineId: Int
    let bodyId: Int
    let drivingSystemId: Int
}
