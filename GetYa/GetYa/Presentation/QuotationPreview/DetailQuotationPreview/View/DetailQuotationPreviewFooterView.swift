//
//  DetailQuotationPreviewFooterView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/10.
//

import UIKit

final class DetailQuotationPreviewFooterView: UITableViewHeaderFooterView {
    static let identifier = "DetailRecommendCarResultFooter"
    enum Constants {
        static let intrinsicContentHeight: CGFloat = OnePixelDivider.topMargin + TotalMoneyDescriptionLabel.topMargin + GetYaFont.mediumBody3.lineHeight
        enum OnePixelDivider {
            static let topMargin: CGFloat = .toScaledHeight(value: 20)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let bgColor: UIColor = .GetYaPalette.gray700
            static let intrinsicContentHeight: CGFloat = {
                return topMargin + 1
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
    
    // MARK: - Constant
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Functions
    func configure(with paymentAmount: String) {
        paymentAmountLabel.text = paymentAmount
    }
}

// MARK: - LayoutSupportable
extension DetailQuotationPreviewFooterView: LayoutSupportable {
    func setupViews() {
        addSubviews([
            onePixelDivider,
            totalMoneyDescriptionLabel,
            paymentAmountLabel])
    }
    
    func setupConstriants() {
        configureOnePixelDivider()
        configureTotalMoneyDescriptionLabel()
        configurePaymentAmountLabel()
    }
    
    // MARK: - LayoutSupportable private functions
    private func configureOnePixelDivider() {
        typealias Const = Constants.OnePixelDivider
        
        NSLayoutConstraint.activate([
            onePixelDivider.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            onePixelDivider.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            onePixelDivider.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            onePixelDivider.heightAnchor.constraint(
                equalToConstant: 1)
        ])
    }
    
    private func configureTotalMoneyDescriptionLabel() {
        let const = Constants.TotalMoneyDescriptionLabel.self
        NSLayoutConstraint.activate([
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
                equalTo: bottomAnchor)])
    }
    
    private func configurePaymentAmountLabel() {
        let const = Constants.PaymentAmountLabel.self
        NSLayoutConstraint.activate([
            paymentAmountLabel.centerYAnchor.constraint(
                equalTo: totalMoneyDescriptionLabel.centerYAnchor),
            paymentAmountLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -const.trailingMargin)])
    }
}
