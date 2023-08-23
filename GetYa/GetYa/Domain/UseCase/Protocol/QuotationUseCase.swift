//
//  Quotation.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/23.
//

import Foundation

protocol QuotationUseCase {
    func fetchCarQuotation(customRecomendationModel: CustomRecomendationModel) -> Quotation
}
