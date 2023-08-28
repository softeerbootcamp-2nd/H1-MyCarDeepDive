//
//  UIMargin.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import Foundation

/// UI margin 정할 때 CGFloat를 쉽게 선언하기 위한 구조체
/// Examples:
/// ```
/// class MyView: UIView {
///   // MARK: - Constant
///   enum Constant {
///     enum ImageView {
///       static let margin = UIMargin(
///         top: 0, leading: 20, trailing: -10, bottom: -10)
///     }
///
///     enum Title {
///       static let margin = UIMargin(leading: 20)
///     }
///   }
///   ...
/// }
/// ```
struct UILayout {
  let top: CGFloat
  let leading: CGFloat
  let trailing: CGFloat
  let bottom: CGFloat
  
  init(
    leading: CGFloat = 0,
    top: CGFloat = 0,
    trailing: CGFloat = 0,
    bottom: CGFloat = 0
  ) {
      self.top = top.scaledHeight
      self.leading = leading.scaledWidth
      self.trailing = trailing.scaledWidth
      self.bottom = bottom.scaledHeight
  }
}
