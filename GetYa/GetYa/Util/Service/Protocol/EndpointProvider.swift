//
//  EndpointProvider.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import Foundation

protocol EndpointProvider: AnyObject {
    func request<R: Decodable, E: NetworkInteractionable>(
        with endpoint: E
    ) async throws -> R where E.ResponseDTO == R
    
    /// 사진의 경우
    func request(with url: URL) async throws -> Data
}
