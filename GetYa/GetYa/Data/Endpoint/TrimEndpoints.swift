//
//  TrimEndpoints.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct TrimEndpoints {
    private init() {}
    static let shared = TrimEndpoints()
    
    func fetchCarSpec(with requestDTO: TrimCarSpecRequestDTO) -> Endpoint<TrimCarSpecResponseDTO> {
        return Endpoint<TrimCarSpecResponseDTO>.init(
            method: .get,
            responseType: .carSpec,
            queryParams: requestDTO)
    }
}
