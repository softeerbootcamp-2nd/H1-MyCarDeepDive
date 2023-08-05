//
//  UIColor+GetYaPalette.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import UIKit

/// GetYa app에서 사용되는 palette!!
/// Examples:
/// ```
/// let view = UIView()
/// view.backgroundColor = UIColor.GetYaPalette.darkPrimary
/// ```
///
extension UIColor {
    enum GetYaPalette {
        // MARK: - Primary
        /// Blue/blue-500(Primary)
        /// #00428E
        /// red: 0, green: 66, blue: 142
        static let darkPrimary = UIColor(hexString: "00428E")
        
        /// Blue/blue-500(Primary) 10%
        /// #00428E
        /// red: 0, green: 66, blue: 142
        static let lightPrimary = UIColor(hexString: "00428E").withAlphaComponent(0.1)
        
        // MARK: - Secondary
        /// active blue
        /// #2197C9
        /// red: 33, green: 151, blue: 202
        static let acriveBlue = UIColor(hexString: "2197C9")
        
        // MARK: - Gray Scale
        /// Grey Scale/grey-1000
        /// #FFFFFF
        /// red: 255, green: 255, blue: 255
        static let gray1000 = UIColor(hexString: "FFFFFF")
        
        /// Grey Scale/grey-900
        /// #FBFBFB
        /// red: 251, green: 251, blue: 251
        static let gray900 = UIColor(hexString: "FBFBFB")
        
        /// Grey Scale/grey-800
        /// #F0F0F0
        /// red: 240, green: 240, blue: 240
        static let gray800 = UIColor(hexString: "F0F0F0")
        
        /// Grey Scale/grey-700
        /// #EBEBEB
        /// red: 235, green: 235, blue: 235
        static let gray700 = UIColor(hexString: "EBEBEB")
        
        /// Grey Scale/grey-600
        /// #BEBEBE
        /// red: 190, green: 190, blue: 190
        static let gray600 = UIColor(hexString: "BEBEBE")
        
        /// Grey Scale/grey-500
        /// #A4A4A4
        /// red: 164, green: 164, blue: 164
        static let gray500 = UIColor(hexString: "A4A4A4")
        
        /// Grey Scale/grey-400
        /// #777777
        /// red: 119, green: 119, blue: 119
        static let gray400 = UIColor(hexString: "777777")
        
        /// Grey Scale/grey-300
        /// #696969
        /// red: 105, green: 105, blue: 105
        static let gray300 = UIColor(hexString: "696969")
        
        /// Grey Scale/grey-200
        /// #404040
        /// red: 64, green: 64, blue: 64
        static let gray200 = UIColor(hexString: "404040")
        
        /// Grey Scale/grey-100
        /// #303030
        /// red: 48, green: 48, blue: 48
        static let gray100 = UIColor(hexString: "303030")
        
        /// Grey Scale/grey-50
        /// #1A1A1A
        /// red: 26, green: 26, blue: 26
        static let gray50 = UIColor(hexString: "1A1A1A")
        
        /// Grey Scale/grey-0
        /// #111111
        /// red: 17, green: 17, blue: 17
        static let gray0 = UIColor(hexString: "111111")
    }
}
