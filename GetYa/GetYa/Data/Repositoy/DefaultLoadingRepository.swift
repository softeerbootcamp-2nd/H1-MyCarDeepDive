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
    
    func fetchPdfID(with request: ContractionQuotation) async throws -> String {
        let endpoint = Endpoint.shared.fetchPdfID(with: request)
        let commonDTO = try await provider.request(endpoint: endpoint)
        return commonDTO.data
    }
}
