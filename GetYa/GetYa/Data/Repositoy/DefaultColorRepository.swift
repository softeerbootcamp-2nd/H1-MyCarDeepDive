//
//  DefaultColorRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

class DefaultColorRepository: ColorRepository {
    typealias Endpoint = ColorSelectEndpoint
    
    private let provider: EndpointProvider
    
    init(provider: EndpointProvider) {
        self.provider = provider
    }
}
