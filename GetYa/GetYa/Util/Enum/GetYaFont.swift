//
//  GetYaFont.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import UIKit

enum GetYaFont: CaseIterable {
  case boldHead1
  case mediumHead2
  case mediumHead3
  case mediumHead4
  case boldBody1
  case mediumBody1
  case boldBody2
  case mediumBody2
  case regularBody2
  case mediumBody3
  case regularBody3
  case mediumBody4
  case regularBody4
  case mediumCaption1
  case regularCaption1
  
  var size: CGFloat {
    switch self {
    case .boldHead1:
      return 22
    case .mediumHead2:
      return 20
    case .mediumHead3:
      return 18
    case .mediumHead4:
      return 16
    case .boldBody1, .mediumBody1:
      return 20
    case .boldBody2, .mediumBody2, .regularBody2:
      return 18
    case .mediumBody3, .regularBody3:
      return 16
    case .mediumBody4, .regularBody4:
      return 14
    case .mediumCaption1, .regularCaption1:
      return 12
    }
  }
  
  var kern: CGFloat {
    switch self {
    case .boldHead1:
      return -0.4
    case .mediumHead2, .mediumHead3, .mediumHead4:
      return -0.3
    case .boldBody1, .mediumBody1, .boldBody2,
        .mediumBody2, .regularBody2,
        .mediumBody3, .regularBody3,
        .mediumBody4, .regularBody4:
      return -0.2
    case .mediumCaption1, .regularCaption1:
      return 0.0
    }
  }
  
  var lineHeight: CGFloat {
    switch self {
    case .boldHead1:
      return 28
    case .mediumHead2:
      return 26
    case .mediumHead3:
      return 24
    case .mediumHead4:
      return 22
    case .boldBody1, .mediumBody1:
      return 28
    case .boldBody2, .mediumBody2, .regularBody2:
      return 26
    case .mediumBody3, .regularBody3:
      return 24
    case .mediumBody4, .regularBody4:
      return 22
    case .mediumCaption1, .regularCaption1:
      return 18
    }
  }
  
  var name: String {
    switch self {
    case .boldHead1:
      return "HyundaiSansHeadKRBold"
    case .mediumHead2, .mediumHead3, .mediumHead4:
      return "HyundaiSansHeadKRMedium"
    case .boldBody1, .boldBody2:
      return "HyundaiSansTextKRBold"
    case .mediumBody1, .mediumBody2, .mediumBody3, .mediumBody4:
      return "HyundaiSansTextKRMedium"
    case .regularBody2, .regularBody3, .regularBody4:
      return "HyundaiSansTextKRRegular"
    case .mediumCaption1:
      return "HyundaiSansTextKRMedium"
    case .regularCaption1:
      return "HyundaiSansTextKRRegular"
    }
  }
  
  func makeNSMutableAttributedString(with text: String) -> NSMutableAttributedString {
    return NSMutableAttributedString(string: text).set {
      $0.configureHyundaiSans(with: self)
    }
  }
}
