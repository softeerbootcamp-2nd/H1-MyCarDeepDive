//
//  UIView+.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import UIKit

extension UIView {
  func addSubviews(_ views: [UIView]) {
    _=views.map { addSubview($0) }
  }
}
