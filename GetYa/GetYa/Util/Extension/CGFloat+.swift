//
//  CGFloat.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/01.
//

import UIKit

extension CGFloat {
    var scaledWidth: CGFloat {
        let width: CGFloat = 375
        let screenSize = UIScreen.main.bounds.size
        
        let scale = screenSize.width / width
        return floor(self * scale)
    }
    
    var scaledHeight: CGFloat {
        let height: CGFloat = 812
        let screenSize = UIScreen.main.bounds.size
        
        let scale = screenSize.height / height
        return floor(self * scale)
    }
}
