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
    
    func fetchTrimColorInquery(with trimID: Int) -> Endpoint<TrimColorInqueryDTO> {
        return Endpoint(
            method: .get,
            responseType: .trimColor,
            queryParams: TrimID(trimId: trimID))
    }
    
    func fetchInteriorColor(
        with exteriorColor: ColorSelectModel
    ) -> Endpoint<TrimColorDTO> {
        return Endpoint(
            method: .get,
            responseType: .interiorColor,
            queryParams: TrimIdWithExteriorColorID(
                trimID: exteriorColor.trimID,
                colorID: exteriorColor.colorID))
    }
    
    func fetchExteriorColor(
        with interiorColor: ColorSelectModel
    ) -> Endpoint<TrimColorDTO> {
        return Endpoint(
            method: .get,
            responseType: .exteriorColor,
            queryParams: TrimIdWithInteriorColorID(
                trimID: interiorColor.trimID,
                colorID: interiorColor.colorID))
    }
}
