//
//  OptionPackageDescriptionView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import UIKit

final class OptionPackageDescriptionView: UIView {
    enum Constants {
        enum OptionDetailDescriptionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 4)
            static let maximumHeight: CGFloat = OptionDetailDescriptionAreaView
                .Constants
                .maximumHeight
        }
        enum OptionTitleCollectionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 28)
            static let height: CGFloat = .toScaledHeight(value: 94)
        }
        
        enum PageSegmentView {
            static let topMargin: CGFloat = .toScaledHeight(value: 28)
            static let height: CGFloat = .toScaledWidth(value: 8)
            static let width = height
        }
        
    }
    // MARK: - UI properties
    // MARK: - Properties
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
