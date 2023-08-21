//
//  EndpointProvider.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import Foundation

protocol EndpointProvider: AnyObject {
    func request<R: Decodable, E: NetworkInteractionable>(
        endpoint: E
    ) async throws -> R where E.ResponseDTO == R
    
    func request(with url: URL) async throws -> Data 
}
