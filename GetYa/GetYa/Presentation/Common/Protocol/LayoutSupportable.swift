//
//  LayoutSupportable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import UIKit

protocol LayoutSupportable {
  /// Set subviews constraints in root view
  func configureConstraints()
}

extension LayoutSupportable where Self: UIView {
  // 함수 호출시 superView에 포함될 subviews 포함
  func configureSubviewUI(with subviews: UIView...) {
    addSubviews(subviews)
    configureConstraints()
  }
  
  /// Add subviews in root view
  func addSubviews(_ views: UIView...) {
    self.addSubviews(views)
  }
}

extension LayoutSupportable where Self: UIViewController {
    func configureSubviewUI(with subviews: UIView...) {
        view.addSubviews(subviews)
        configureConstraints()
    }
}

extension LayoutSupportable where Self: UICollectionViewCell {
  // 함수 호출시 superView에 포함될 subviews 포함
  func configureSubviewUI(with subviews: UIView...) {
    addSubviewsInContentView(subviews)
    configureConstraints()
  }
  
  func addSubviewsInContentView(_ views: [UIView]) {
    contentView.addSubviews(views)
  }
}

extension LayoutSupportable where Self: UITableViewCell {
  func configureSubviewUI(with subviews: UIView...) {
    addSubviewsInContentView(subviews)
    configureConstraints()
  }
  
  func addSubviewsInContentView(_ views: [UIView]) {
    contentView.addSubviews(views)
  }
}
