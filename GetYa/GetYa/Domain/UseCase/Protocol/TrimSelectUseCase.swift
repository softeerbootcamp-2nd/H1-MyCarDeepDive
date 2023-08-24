//
//  TrimSelectUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

protocol TrimSelectUseCase {
    var trimSelect: PassthroughSubject<TrimSelectModel, Never> { get set }
    var trimInquery: PassthroughSubject<TrimInquery, Never> { get set }
    
    func fetchTrimInqeury(trimSubOptionSelect: TrimSubOptionSelect)
}
