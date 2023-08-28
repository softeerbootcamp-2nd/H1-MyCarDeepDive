//
//  QuotationFinish.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct QuotationFinish: Codable {
    let carName: String
    let engineName: String
    let drivingSystemName: String
    let trimName: String
    let bodyName: String
    let exteriorColorName: String
    let exteriorColorImageURL: String
    let exteriorColorPrice: Int
    let interiorColorName: String
    let interiorColorImageURL: String
    let interiorColorPrice: Int
    let optionList: [QuotationOption]
    let basicPrice: Int
    let pdfURL: String
    let totalPrice: Int
    
    func toDTO() -> QuotationFinishDTO {
        return QuotationFinishDTO(
            carName: carName,
            engineName: engineName,
            drivingSystemName: drivingSystemName,
            trimName: trimName,
            bodyName: bodyName,
            exteriorColorName: exteriorColorName,
            exteriorColorImageURL: exteriorColorImageURL,
            exteriorColorPrice: exteriorColorPrice,
            interiorColorName: interiorColorName,
            interiorColorImageURL: interiorColorImageURL,
            interiorColorPrice: interiorColorPrice,
            optionList: optionList.map { $0.toDTO() },
            basicPrice: basicPrice,
            pdfURL: pdfURL,
            totalPrice: totalPrice)
    }
}
