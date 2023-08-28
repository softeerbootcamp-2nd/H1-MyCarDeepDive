//
//  RecommendQuotationUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import Foundation
import Combine

protocol RecommendQuotationUseCase {
    var quotation: PassthroughSubject<Quotation, Never> { get set }
    
    func fetchQuotationInquery(characterSelectModel: CharacterSelectModel)
}
