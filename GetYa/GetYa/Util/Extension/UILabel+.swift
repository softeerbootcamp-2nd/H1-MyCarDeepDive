//
//  UILabel+.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import UIKit

extension UILabel {
  func setFont(type: GetYaFont) {
    attributedText = type.makeNSMutableAttributedString(
      with: text ?? "")
  }
}
