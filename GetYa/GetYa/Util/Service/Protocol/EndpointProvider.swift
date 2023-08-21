//
//  EndpointProvider.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import Foundation

protocol EndpointProvider: AnyObject {
    var endPoint: Endpoint { get set }
    func request<R>(with path: String) async throws -> R where R: Decodable
    
}
