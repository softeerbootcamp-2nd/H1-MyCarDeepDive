//
//  LoadingUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation
import Combine

protocol LoadingUseCase {
    var pdfID: PassthroughSubject<String, Never> { get set }
    func fetchPdfID(contrationQuotation: ContractionQuotation)
}
