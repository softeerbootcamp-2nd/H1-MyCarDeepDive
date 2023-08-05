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
    static let darkPrimary = UIColor(
      red: 0, green: 66, blue: 142, alpha: 1)
    
    /// Blue/blue-500(Primary) 10%
    /// #00428E
    static let lightPrimary = UIColor(
      red: 0, green: 66, blue: 142, alpha: 0.1)
    
    // MARK: - Secondary
    /// active blue
    /// #2197C9
    static let acriveBlue = UIColor(
      red: 33, green: 151, blue: 201, alpha: 1)
    
    // MARK: - Gray Scale
    /// Grey Scale/grey-1000
    /// #FFFFFF
    static let gray1000 = UIColor(
      red: 255, green: 255, blue: 255, alpha: 1)
    
    /// Grey Scale/grey-900
    /// #FBFBFB
    static let gray900 = UIColor(
      red: 251, green: 251, blue: 251, alpha: 1)
    
    /// Grey Scale/grey-800
    /// #F0F0F0
    static let gray800 = UIColor(
      red: 240, green: 240, blue: 240, alpha: 1)
    
    /// Grey Scale/grey-700
    /// #EBEBEB
    static let gray700 = UIColor(
      red: 235, green: 235, blue: 235, alpha: 1)
    
    /// Grey Scale/grey-600
    /// #BEBEBE
    static let gray600 = UIColor(
      red: 190, green: 190, blue: 190, alpha: 1)
    
    /// Grey Scale/grey-500
    /// #A4A4A4
    static let gray500 = UIColor(
      red: 164, green: 164, blue: 164, alpha: 1)
    
    /// Grey Scale/grey-400
    /// #777777
    static let gray400 = UIColor(
      red: 119, green: 119, blue: 119, alpha: 1)
    
    /// Grey Scale/grey-300
    /// #696969
    static let gray300 = UIColor(
      red: 105, green: 105, blue: 105, alpha: 1)
    
    /// Grey Scale/grey-200
    /// #404040
    static let gray200 = UIColor(
      red: 64, green: 64, blue: 64, alpha: 1)
    
    /// Grey Scale/grey-100
    /// #303030
    static let gray100 = UIColor(
      red: 48, green: 48, blue: 48, alpha: 1)
    
    /// Grey Scale/grey-50
    /// #1A1A1A
    static let gray50 = UIColor(
      red: 26, green: 26, blue: 26, alpha: 1)
    
    /// Grey Scale/grey-0
    /// #111111
    static let gray0 = UIColor(
      red: 17, green: 17, blue: 17, alpha: 1)
  }
}
