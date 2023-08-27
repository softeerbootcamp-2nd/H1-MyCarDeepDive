//
//  DefaultOptionSelectRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

class DefaultOptionSelectRepository: OptionSelectRepository {
    typealias Endpoint = OptionSelectEndpoint
    
    private let provider: EndpointProvider
    
    init(provider: EndpointProvider) {
        self.provider = provider
    }
}
