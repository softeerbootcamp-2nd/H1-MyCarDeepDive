//
//  QuotaionFinishViewModel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

class QuotaionFinishViewModel {
    // MARK: - Input
    struct Input {
        
    }
    
    // MARK: - Output
    struct Output {
        
    }
    
    // MARK: - Dependency
    private let useCase: QuotationFinishUseCase
    private let pdfID: Int
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    init(pdfID: Int, useCase: QuotationFinishUseCase) {
        self.pdfID = pdfID
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func transform(input: Input) -> Output {
        let output = Output()
        
        return output
    }
}
