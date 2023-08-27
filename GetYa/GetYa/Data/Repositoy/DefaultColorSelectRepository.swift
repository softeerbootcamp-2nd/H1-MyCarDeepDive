//
//  DefaultColorRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

class DefaultColorSelectRepository: ColorSelectRepository {
    typealias Endpoint = ColorSelectEndpoint
    
    private let provider: EndpointProvider
    
    init(provider: EndpointProvider) {
        self.provider = provider
    }
    
    func fetchTrimColorInquery(with trimID: Int) async throws -> TrimColorInquery {
        let endpoint = Endpoint.shared.fetchTrimColorInquery(with: trimID)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data.toDomain()
    }
    
    func fetchInteriorColor(
        with exteriorColor: ColorSelectModel
    ) async throws -> TrimColor {
        let endpoint = Endpoint.shared.fetchInteriorColor(with: exteriorColor)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data.toDomain()
    }
    
    func fetchExteriorColor(
        with interiorColor: ColorSelectModel
    ) async throws -> TrimColor {
        let endpoint = Endpoint.shared.fetchExteriorColor(with: interiorColor)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data.toDomain()
    }
}
