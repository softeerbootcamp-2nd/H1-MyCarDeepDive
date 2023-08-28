//
//  UIFont+.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import UIKit

extension UIFont {
  convenience init?(hyundaiSans: GetYaFont) {
    self.init(name: hyundaiSans.name, size: hyundaiSans.size )
  }
}
