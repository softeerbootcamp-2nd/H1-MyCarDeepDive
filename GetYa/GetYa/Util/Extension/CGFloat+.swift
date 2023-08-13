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
    
    static func toScaledWidth<Value: Numeric>(value: Value) -> CGFloat {
        return convertNumericToCGFloat(value).scaledWidth
    }
    
    static func toScaledHeight<Value: Numeric>(value: Value) -> CGFloat {
        return convertNumericToCGFloat(value).scaledHeight
    }
    
    private static func convertNumericToCGFloat(_ value: any Numeric) -> CGFloat {
        if let doubleValue = value as? Double {
            return CGFloat(doubleValue)
        } else if let floatValue = value as? Float {
            return CGFloat(floatValue)
        } else if let cgfloatValue = value as? CGFloat {
            return cgfloatValue
        } else if let intValue = value as? Int {
            return CGFloat(intValue)
        }
        return CGFloat(0)
    }
}
