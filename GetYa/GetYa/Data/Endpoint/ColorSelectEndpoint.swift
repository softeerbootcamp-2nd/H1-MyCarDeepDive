//
//  ColorSelectEndpoint.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct ColorSelectEndpoint {
    private init() {}
    static let shared = ColorSelectEndpoint()
    
    func fetchColorInquery(with trimID: Int) -> Endpoint<TrimColorInqueryDTO> {
        return Endpoint(
            method: .get,
            responseType: .trimColor,
            queryParams: TrimID(trimId: trimID))
    }
}
