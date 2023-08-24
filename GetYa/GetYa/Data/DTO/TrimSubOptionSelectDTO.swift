//
//  TrimSumOptionSelectDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation

struct TrimSubOptionSelectDTO: Codable {
    var engineId: Int
    var bodyId: Int
    var drivingSystemId: Int
    
    init(trimSubOptionSelect: TrimSubOptionSelect) {
        self.init(
            engineId: trimSubOptionSelect.engineID,
            bodyId: trimSubOptionSelect.bodyID,
            drivingSystemId: trimSubOptionSelect.drivingSystemID)
    }
    
    init(engineId: Int, bodyId: Int, drivingSystemId: Int) {
        self.engineId = engineId
        self.bodyId = bodyId
        self.drivingSystemId = drivingSystemId
    }
}
