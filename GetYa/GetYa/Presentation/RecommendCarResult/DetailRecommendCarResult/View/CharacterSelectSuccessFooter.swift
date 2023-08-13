//
//  CharacterSelectSuccessFooter.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/10.
//

import UIKit

final class CharacterSelectSuccessFooter: UITableViewHeaderFooterView {
    static let identifier = "CharacterSelectSuccessFooter"
    enum Constants {
        static let intrinsicContentHeight: CGFloat = OnePixelDivider.uiConstant
            .topMargin + TotalMoneyDescriptionLabel.topMargin + GetYaFont.mediumBody3.lineHeight
        enum OnePixelDivider {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 20, trailingMargin: 16, height: 1)
            static let bgColor: UIColor = .GetYaPalette.gray700
            static let intrinsicContentHeight: CGFloat = {
                return uiConstant.height + uiConstant.topMargin
            }()
        }
        
        enum TotalMoneyDescriptionLabel {
            static let topMargin: CGFloat = .init(16).scaledHeight
            static let leadingMargin: CGFloat = .init(16).scaledWidth
            static let trailingMargin: CGFloat = .init(16).scaledWidth
        }
        
        enum PaymentAmountLabel {
            static let trailingMargin: CGFloat = .init(16).scaledWidth
        }
    }
    
    // MARK: - UIProperties
    private let onePixelDivider: UIView = UIView(frame: .zero).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = Constants.OnePixelDivider.bgColor
    }
    private let totalMoneyDescriptionLabel = CommonLabel(
        fontType: GetYaFont.mediumBody3, color: .GetYaPalette.gray400, text: "총 금액")
    private let paymentAmountLabel = CommonLabel(
        fontType: GetYaFont.mediumHead3, color: .black, text: "0원")
    private let emptySpacingView = UIView(frame: .zero).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Constant
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureSubviewUI(
            with: onePixelDivider, totalMoneyDescriptionLabel, paymentAmountLabel, emptySpacingView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviewUI(
            with: onePixelDivider, totalMoneyDescriptionLabel, paymentAmountLabel, emptySpacingView)
    }
    
    // MARK: - Functions
    func configure(with paymentAmount: String) {
        paymentAmountLabel.text = paymentAmount
    }
}

// MARK: - LayoutSupportable
extension CharacterSelectSuccessFooter: LayoutSupportable {
    func configureConstraints() {
        _=[onePixelDividerConstraints,
           totalMoneyDescriptionLabelConstraints,
           paymentAmountLabelConstriants
        ].map { NSLayoutConstraint.activate($0) }
    }
    
    // MARK: - LayoutSupportable private functions
    private var onePixelDividerConstraints: [NSLayoutConstraint] {
        let const = Constants.OnePixelDivider.self
        return [
            onePixelDivider.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.uiConstant.leadingMargin),
            onePixelDivider.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -const.uiConstant.trailingMargin),
            onePixelDivider.topAnchor.constraint(
                equalTo: topAnchor,
                constant: const.uiConstant.topMargin),
            onePixelDivider.heightAnchor.constraint(
                equalToConstant: const.uiConstant.height)]
    }
    
    private var totalMoneyDescriptionLabelConstraints: [NSLayoutConstraint] {
        let const = Constants.TotalMoneyDescriptionLabel.self
        return [
            totalMoneyDescriptionLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin),
            totalMoneyDescriptionLabel.topAnchor.constraint(
                equalTo: onePixelDivider.bottomAnchor,
                constant: const.topMargin),
            totalMoneyDescriptionLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -const.trailingMargin),
            totalMoneyDescriptionLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor)]
    }
    
    private var paymentAmountLabelConstriants: [NSLayoutConstraint] {
        let const = Constants.PaymentAmountLabel.self
        return [
            paymentAmountLabel.centerYAnchor.constraint(
                equalTo: totalMoneyDescriptionLabel.centerYAnchor),
            paymentAmountLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -const.trailingMargin)]
    }
}
