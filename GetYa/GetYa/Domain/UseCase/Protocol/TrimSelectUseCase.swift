//
//  TrimSelectUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation
import Combine

protocol TrimSelectUseCase {
    var trimSelect: CurrentValueSubject<TrimSelectModel?, Never> { get set }
    var trimInquery: CurrentValueSubject<TrimInquery?, Never> { get set }
    var trimSelectResult: PassthroughSubject<String, Never> { get set }
    
    func fetchTrimInqeury(trimSubOptionSelect: TrimSubOptionSelect)
    func fetchTrimSelectLog(trimSelectModel: TrimSelectModel)
}
