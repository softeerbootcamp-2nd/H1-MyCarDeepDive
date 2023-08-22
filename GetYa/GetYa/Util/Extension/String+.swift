//
//  String+.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation

extension String {
    var toInt: Int {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.number(from: self)?.intValue ?? 0
    }
}
