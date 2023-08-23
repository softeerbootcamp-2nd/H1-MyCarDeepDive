//
//  DefaultLoadingRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation
import Combine

class DefaultLoadingRepository: LoadingRepository {
    typealias Endpoint = LoadingEndpoint
    private let provider: EndpointProvider
    
    init(provider: EndpointProvider) {
        self.provider = provider
    }
    
    func fetchCarInquery(
        with request: String
    ) async throws -> QuotationFinish {
        let endpoint = Endpoint.shared.fetchCarInquery(with: request)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data.toDomain()
    }
    
    func fetchPdfEmail(with request: PdfEmail) async throws -> Bool {
        let endpoint = Endpoint.shared.fetchPdfEmail(with: request)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data
    }
}
