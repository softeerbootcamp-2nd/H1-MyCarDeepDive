//
//  OptionEndpoints.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct OptionEndpoints {
    private init() {}
    static let shared = OptionEndpoints()
    
    func fetchCarAdditionalOption(carSpecId: Int) -> Endpoint<AdditionalOptionsResponseDTO> {
        return Endpoint(
            method: .post,
            responseType: .carSpecAdditionalOption(carSpecId: carSpecId))
    }
}
