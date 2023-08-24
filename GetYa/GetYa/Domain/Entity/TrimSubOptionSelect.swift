//
//  TrimSubOption.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import Foundation

struct TrimSubOptionSelect {
    var engineID: Int
    var bodyID: Int
    var drivingSystemID: Int
    
    func toDTO() -> TrimSubOptionSelectDTO {
        return .init(trimSubOptionSelect: self)
    }
}
