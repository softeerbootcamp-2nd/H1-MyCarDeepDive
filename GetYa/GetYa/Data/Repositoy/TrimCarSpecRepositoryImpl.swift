//
//  TrimCarSpecImpl.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import Foundation

struct TrimCarSpecRepositoryImpl: TrimRepository {
    typealias Endpoints = TrimEndpoints
    let provider = SessionProvider()
    
    func fetchTrimCarSpec(
        with requestDTO: TrimCarSpecRequestDTO
    ) async throws -> [TrimCarSpec] {
        let endpoint = Endpoints.shared.fetchCarSpec(with: requestDTO)
        let response = try await provider.request(endpoint: endpoint)
        return response.data
    }
}
