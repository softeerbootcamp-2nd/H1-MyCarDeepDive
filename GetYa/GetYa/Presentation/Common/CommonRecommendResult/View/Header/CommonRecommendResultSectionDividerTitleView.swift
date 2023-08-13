//
//  CommonRecommendResultSectionDividerTitleView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

class CommonRecommendResultSectionDividerTitleView: UIView {
    enum Constants {
        static var intrinsicContentHeight: CGFloat {
            let onePixelDividerHeight = OnePixelDivider.intrinsicContentHeight
            let sectionTitleHeight = SectionTitle.intrinsicContentHeight
            
           return onePixelDividerHeight + sectionTitleHeight
        }
        enum OnePixelDivider {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(16).scaledHeight
            static let trailingMargin = CGFloat(16).scaledWidth
            static let height = CGFloat(1).scaledWidth
            static let bgColor: UIColor = .GetYaPalette.gray700
            static var intrinsicContentHeight: CGFloat {
                height + topMargin
            }
        }
        enum SectionTitle {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(20).scaledHeight
            static let fontColor: UIColor = .GetYaPalette.gray300
            static let font: GetYaFont = .regularBody4
            static let intrinsicContentHeight: CGFloat = topMargin + font.lineHeight
        }
    }
    
    // MARK: - UI properties
    private let onePixelDivider: UIView = UIView(frame: .zero).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = Constants.OnePixelDivider.bgColor
    }
    
    private let sectionTitle = CommonLabel(
        fontType: .regularBody4,
        color: .GetYaPalette.gray300,
        text: "준비중...")
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviewUI(
            with: onePixelDivider, sectionTitle)
    }
    
    convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviewUI(
            with: onePixelDivider, sectionTitle)
    }
    
    // MARK: - Helper
    func configureSectionTitle(with text: String) {
        sectionTitle.text = text
    }
}

// MARK: - LayoutSupportable
extension CommonRecommendResultSectionDividerTitleView: LayoutSupportable {
    func configureConstraints() {
        _=[onePixelDividerConstraints,
           sectionTitleConstraints].map {
            NSLayoutConstraint.activate($0)
        }
    }
    
    // MARK: - Private layout supportable helper
    private var onePixelDividerConstraints: [NSLayoutConstraint] {
        typealias Const = Constants.OnePixelDivider
        return [
            onePixelDivider.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            onePixelDivider.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            onePixelDivider.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -Const.trailingMargin),
            onePixelDivider.heightAnchor.constraint(equalToConstant: Const.height)]
    }

    private var sectionTitleConstraints: [NSLayoutConstraint] {
        typealias Const = Constants.SectionTitle
        return [
            sectionTitle.topAnchor.constraint(
                equalTo: onePixelDivider.bottomAnchor,
                constant: Const.topMargin),
            sectionTitle.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            sectionTitle.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
    }
}
