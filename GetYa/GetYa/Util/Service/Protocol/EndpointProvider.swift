//
//  EndpointProvider.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import Foundation

protocol EndpointProvider: AnyObject {
    func request<R: Decodable, E: Endpoint<R>>(with path: String, with endpoint: E) async throws -> R
    func request(with url: URL) async throws -> Data 
}
