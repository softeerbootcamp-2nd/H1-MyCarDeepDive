//
//  QuotationFinishUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation
import Combine

protocol QuotationFinishUseCase {
    var pdfID: CurrentValueSubject<String, Never> { get set }
    var carInquery: PassthroughSubject<QuotationFinish, Never> { get set }
    var emailResult: PassthroughSubject<Bool, Never> { get set }
    
    func fetchCarInquery()
    func fetchEmail(email: String)
}
