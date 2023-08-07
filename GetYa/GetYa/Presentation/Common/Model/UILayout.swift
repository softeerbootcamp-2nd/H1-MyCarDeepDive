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
  let topMargin: CGFloat
  let leadingMargin: CGFloat
  let trailingMargin: CGFloat
  let bottomMargin: CGFloat
    let height: CGFloat
    let width: CGFloat
  
  init(
    leadingMargin: CGFloat = 0,
    topMargin: CGFloat = 0,
    trailingMargin: CGFloat = 0,
    bottomMargin: CGFloat = 0,
    height: CGFloat = 0,
    width: CGFloat = 0
  ) {
      self.topMargin = topMargin.scaledHeight
      self.leadingMargin = leadingMargin.scaledWidth
      self.trailingMargin = trailingMargin.scaledWidth
      self.bottomMargin = bottomMargin.scaledHeight
      self.height = height.scaledHeight
      self.width = width.scaledWidth
  }
}
