//
//  OptionDetailDescriptionAreaView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import UIKit

final class OptionDetailDescriptionAreaView: UIView {
    enum Constants {
        enum OptionTitleLabel {
        }
        enum OptionPriceLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 4)
        }
        enum OptionSelectButton {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 12)
        }
        enum OptionDescriptionLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 20)
            static let maximumBottomMargin: CGFloat = .toScaledHeight(value: -16)
        }
    }
    // MARK: - UI properties
    private let optionTitleLabel = CommonLabel(
        fontType: .mediumHead2,
        color: .GetYaPalette.gray0,
        text: "옵션 준비중...")
    private let optionPriceLabel = CommonLabel(
        fontType: .custom(size: 16, kern: -0.2, lineHeight: 24, nameType: .mediumText),
        color: .GetYaPalette.gray200,
        text: "옵션 가격 준비중...")
    private let optionSelectButton = CommonOptionSelectView(frame: .zero)
    private let optionDescriptionLabel = CommonLabel(
        fontType: .regularBody4,
        color: .GetYaPalette.gray200, text: "옵션 상세 설명이 준비중입니다...")
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: - Private Functions
    // MARK: - Functions
    // MARK: - Objc Functions
}
