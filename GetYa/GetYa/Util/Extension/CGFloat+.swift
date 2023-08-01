//
//  CGFloat.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/01.
//

import UIKit

extension CGFloat {
    static func scaledWidth(value: CGFloat) -> CGFloat {
        let width: CGFloat = 375
        let screenSize = UIScreen.main.bounds.size
        
        let scale = screenSize.width / width
        return value * scale
    }
    
    static func scaledHeight(value: CGFloat) -> CGFloat {
        let height: CGFloat = 812
        let screenSize = UIScreen.main.bounds.size
        
        let scale = screenSize.height / height
        return value * scale
    }
}
