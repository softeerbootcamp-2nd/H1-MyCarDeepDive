//
//  CharacterSelectSuccessThumbnailView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class CharacterSelectSuccessThumbnailView: UIView {
    // MARK: - Constant
    enum Constant {
        static let layerColors: [UIColor] = [
            UIColor(red: 0.9, green: 0.92, blue: 0.94, alpha: 1),
            UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1)]
        enum RecommendKeywordStackView {
            static let uiConstant: UILayout = .init(
             leadingMargin: 16, topMargin: 41)
            static let interItemSpacing: CGFloat = 6
            static let height: CGFloat = UILayout.init(height: 28).height
        }

        enum TagView {
            static let textColor: UIColor = .GetYaPalette.gray300
            static let height: CGFloat = UILayout.init(height: 28).height
            static let cornerRadius: CGFloat = height/2
            static let font: GetYaFont = GetYaFont.regularCaption1
        }
        
        enum RecommendDiscriptionView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 16)
            static let font: GetYaFont = .boldHead1
            static let fontColor: UIColor = .GetYaPalette.gray0
        }
        
        enum RecommendSubDiscriptionView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 4)
            static let font: GetYaFont = .mediumHead2
            static let fontColor: UIColor = .GetYaPalette.gray200
        }
        
        enum RecommendCarImageView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 62, topMargin: 145, bottomMargin: 11)
        }
        
        enum RecommendCarBackgroundView {
            static let height: CGFloat = UILayout.init(height: 131).height
            static let bgColor: UIColor = .GetYaPalette.gray300
        }
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    // MARK: - Helper
    func configureUI() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = Constant.layerColors
        layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - Private helper

// MARK: - LayoutSupportable

// MARK: - Layout supportable private helper
