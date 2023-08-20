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
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
