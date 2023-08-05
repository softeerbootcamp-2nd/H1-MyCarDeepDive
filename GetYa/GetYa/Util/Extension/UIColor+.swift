//
//  UIColor+.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/02.
//

import UIKit

// TODO: Color Set 만들기
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }
    
    convenience init(hexString: String) {
        let arr = Array(hexString)
        var rgb: [Int] = []
        for index in stride(from: 0, to: 5, by: 2) {
            rgb.append(Int(String(arr[index...(index+1)]), radix: 16)!)
        }
        self.init(red: rgb[0], green: rgb[1], blue: rgb[2])
    }
}
