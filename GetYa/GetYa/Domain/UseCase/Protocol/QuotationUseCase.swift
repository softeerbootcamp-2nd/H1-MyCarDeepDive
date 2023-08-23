//
//  Quotation.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/23.
//

import Foundation
import Combine

protocol QuotationUseCase {
    var carQuotation: PassthroughSubject<QuotationModel, Never> { get set }
    
    func fetchCarQuotation()
}
