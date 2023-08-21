//
//  OptionRepositoryImpl.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct OptionRepositoryImpl: OptionRepository {
    typealias Endpoints = OptionEndpoints
    let provider = SessionProvider()
    
    func fetchCarAdditionalOption(
        carSpecId: Int
    ) async throws -> AdditionalOptionsResponseDTO.Data {
        let optionEndpoint = Endpoints.shared.fetchCarAdditionalOption(carSpecId: carSpecId)
        let responseData = try await provider.request(endpoint: optionEndpoint)
        return responseData.data
    }
}
