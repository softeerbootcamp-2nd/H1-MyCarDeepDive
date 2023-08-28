//
//  TrimSelectEndpoint.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation

struct TrimSelectEndpoint {
    private init() {}
    static let shared = TrimSelectEndpoint()
    
    func fetchTrimInquery(
        with request: TrimSubOptionSelect
    ) -> Endpoint<TrimInqueryDTO> {
        return Endpoint<TrimInqueryDTO>(
            method: .get,
            responseType: .carSpec,
            queryParams: request.toDTO())
    }
    func fetchTrimSelectLog(
        with request: Int
    ) -> Endpoint<Bool> {
        return Endpoint<Bool>(
            method: .post,
            responseType: .carSpecActivityLog(tirmID: request))
    }
}
