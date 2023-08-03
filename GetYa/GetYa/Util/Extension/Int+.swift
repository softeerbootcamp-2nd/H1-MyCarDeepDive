//
//  Int+.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/02.
//

import Foundation

extension Int {
    var toPriceFormat: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return "\(numberFormatter.string(for: self)!)원"
    }
}
