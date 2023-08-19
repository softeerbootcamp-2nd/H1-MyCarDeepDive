//
//  CommonQuotationPreviewCarInfoView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/13.
//

import UIKit

class CommonQuotationPreviewCarInfoView: UIView {
    enum Constants {
        static var intrinsicContentHeight: CGFloat {
            return CGFloat(73).scaledHeight
        }
        enum CarKrNameLabel {
            static let leadingMargin: CGFloat = CGFloat(16).scaledWidth
            static let topMargin: CGFloat = CGFloat(20).scaledHeight
            static let fontColor: UIColor = .GetYaPalette.gray50
            static let font: GetYaFont = .mediumHead2
        }
        enum CarEnTrimLabel {
            static let leadingMargin: CGFloat = CGFloat(7.5).scaledWidth
            static let fontColor: UIColor = .GetYaPalette.gray300
            static let font: GetYaFont = .mediumBody2
        }
        enum CarPriceLabel {
            static let trailingMargin: CGFloat = CGFloat(-16).scaledWidth
            static let fontColor: UIColor = .GetYaPalette.gray100
            static let font: GetYaFont = .mediumHead4
        }
        enum CarOptionsLabel {
            static let leadingMargin: CGFloat = CGFloat(16).scaledWidth
            static let topMargin: CGFloat = CGFloat(5).scaledWidth
            static let bottomMargin: CGFloat = CGFloat(-16).scaledHeight
            static let size: CGFloat = 0
            static let fontColor: UIColor = .GetYaPalette.gray400
            static let font: GetYaFont = .regularCaption1
        }
    }
    
    // MARK: - UI properties
    private let carKrNameLabel: CommonLabel = .init(
        fontType: Constants.CarKrNameLabel.font,
        color: Constants.CarKrNameLabel.fontColor)
    private let carEnTrimLabel: CommonLabel = .init(
        fontType: Constants.CarEnTrimLabel.font,
        color: Constants.CarEnTrimLabel.fontColor)
    private let carPriceLabel: CommonLabel = .init(
        fontType: Constants.CarPriceLabel.font,
        color: Constants.CarPriceLabel.fontColor)
    private let carOptionsLabel: CommonLabel = .init(
        fontType: Constants.CarOptionsLabel.font,
        color: Constants.CarOptionsLabel.fontColor)
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Helper
    func configure(with recommendCarInfo: QuotationPreviewCarInfoModel) {
        _=carKrNameLabel.set {
            $0.text = recommendCarInfo.carKrName
        }
        _=carEnTrimLabel.set {
            $0.text = recommendCarInfo.carEnTrimName
        }
        _=carPriceLabel.set {
            $0.text = recommendCarInfo.carPrice
        }
        _=carOptionsLabel.set {
            $0.text = recommendCarInfo.carOptions
        }
    }
}

// MARK: - LayoutSupportable
extension CommonQuotationPreviewCarInfoView: LayoutSupportable {
    func setupViews() {
        addSubviews([
            carKrNameLabel,
            carEnTrimLabel,
            carPriceLabel,
            carOptionsLabel])
    }
    
    func setupConstriants() {
        configureCarKrNameLabel()
        configureCarEnNameLabel()
        configureCarPriceLabel()
        configureCarOptionsLabel()
    }
}

// MARK: - Private layout supportable
private extension CommonQuotationPreviewCarInfoView {
    func configureCarKrNameLabel() {
        typealias Const = Constants.CarKrNameLabel
        NSLayoutConstraint.activate([
            carKrNameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            carKrNameLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin)])
    }
    
    func configureCarEnNameLabel() {
        typealias Const = Constants.CarEnTrimLabel
        NSLayoutConstraint.activate([
            carEnTrimLabel.leadingAnchor.constraint(
                equalTo: carKrNameLabel.trailingAnchor,
                constant: Const.leadingMargin),
            carEnTrimLabel.centerYAnchor.constraint(equalTo: carKrNameLabel.centerYAnchor)])
    }
    
    func configureCarPriceLabel() {
        typealias Const = Constants.CarPriceLabel
        NSLayoutConstraint.activate([
            carPriceLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            carPriceLabel.centerYAnchor.constraint(equalTo: carKrNameLabel.centerYAnchor)])
    }
    
    func configureCarOptionsLabel() {
        typealias Const = Constants.CarOptionsLabel
        NSLayoutConstraint.activate([
            carOptionsLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            carOptionsLabel.topAnchor.constraint(
                equalTo: carKrNameLabel.bottomAnchor,
                constant: Const.topMargin)])
    }
}
