//
//  DefaultQuotationPreviewThumbnailCardView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

import UIKit

final class DefaultQuotationPreviewThumbnailCardView: UIView {
    enum Constants {
        static let cornerRadius: CGFloat = .toScaledWidth(value: 16)
        enum LogoImageView {
            static let leadingMargin: CGFloat = .init(19).scaledWidth
            static let topMargin: CGFloat = .init(17).scaledHeight
            static let minimumHeight: CGFloat = .toScaledHeight(value: 214)
            static let size: CGSize = .init(
                width: CGFloat(25).scaledWidth,
                height: CGFloat(14).scaledHeight)
        }
        enum CarNameDescriptionRoundLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 29)
            static let height: CGFloat = .toScaledHeight(value: 28)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 84)
            static let trailingMargin: CGFloat = .toScaledWidth(value: 84)
            static let innerTextLeadingMargin: CGFloat = .toScaledWidth(value: 12)
            static let innerTextTrailingMargin: CGFloat = .toScaledWidth(value: 12)
            static let cornerRadius: CGFloat = .toScaledWidth(value: height/2)
        }
        enum FamouseSayingWithCarNameLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 42)
            static let trailingMargin: CGFloat = .toScaledWidth(value: 42)
            static let bottomMargin: CGFloat = .toScaledHeight(value: 298)
        }
        enum RecommendCarImageView {
            static let topMargin: CGFloat = .toScaledHeight(value: 20)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 30)
        }
        enum ReviewdTooltipView {
            static let bottomMargin: CGFloat = .toScaledHeight(value: 20)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 21)
            static let trailingMargin: CGFloat = .toScaledWidth(value: 21)
            static let reviewdText: String = "우리 아이들과 함께 타는 차는 항상 안전해야 한다고 생각해요"
            enum ReviewdLabel {
                static let leadingMargin: CGFloat = .toScaledWidth(value: 12)
                static let trailingMargin = leadingMargin
                static let topMargin: CGFloat = .toScaledHeight(value: 8)
                static let bottomMargin = topMargin
            }
        }
    }
    
    // MARK: - UI properties
    private let logoImageView: UIImageView = .init(image: UIImage(named: "Blue_Logo")).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
    }
    private let carNameDescriptionRoundLabel = TagView(text: "차량 준비중..").set {
        typealias Const = Constants.CarNameDescriptionRoundLabel
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.configureCornerRadius(with: Const.cornerRadius)
        $0.configureLabelFont(with: UIFont.systemFont(ofSize: 12, weight: .semibold))
        $0.configureTextColor(with: .white)
        $0.configureBackgroundColor(color: .GetYaPalette.primary)
        $0.configureTextLabelLeadingMargin(with: Const.innerTextLeadingMargin)
        $0.configureTextLabeltrailingMargin(with: Const.innerTextTrailingMargin)
        $0.sizeToFit()
    }
    
    private let famouseSayingWithCarNameLabel = CommonLabel(
        fontType: .regularHead2,
        color: .black,
        text: "가족을 생각하는 당신을 위한 펠리세이드"
    ).set {
        $0.configurePartTextFont(
            color: .GetYaPalette.primary,
            otherFontType: .regularHead2,
            partText: "가족")
        $0.textAlignment = .center
    }
    private let recommendCarImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = true
    }
    private let reviewdTooltipView: TooltipView = .init(
        backgroundColor: .white,
        tipStartX: 12,
        tipYType: .top,
        tipWidth: 8,
        tipHeight: 6
    ).set {
        let reviewdLabel = CommonLabel(
            fontType: .mediumBody4,
            color: .GetYaPalette.gray400,
            text: Constants.ReviewdTooltipView.reviewdText)
        $0.addSubview(reviewdLabel)
        let const = Constants.ReviewdTooltipView.ReviewdLabel.self
        NSLayoutConstraint.activate([
            reviewdLabel.leadingAnchor.constraint(
                equalTo: $0.leadingAnchor,
                constant: const.leadingMargin),
            reviewdLabel.topAnchor.constraint(
                equalTo: $0.topAnchor,
                constant: const.topMargin),
            reviewdLabel.trailingAnchor.constraint(
                equalTo: $0.trailingAnchor,
                constant: -const.trailingMargin),
            reviewdLabel.bottomAnchor.constraint(
                equalTo: $0.bottomAnchor,
                constant: -const.bottomMargin)])
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        // TODO: - 블러 넣자
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        backgroundColor = .systemPink.withAlphaComponent(0.4)
        layer.cornerRadius = Constants.cornerRadius
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        configureSubviewUI(
            with: logoImageView,
            carNameDescriptionRoundLabel,
            famouseSayingWithCarNameLabel,
            recommendCarImageView,
            reviewdTooltipView)
    }
    // MARK: - Functions
    
    func configure(carName: String, carImageUrl: String) {
        carNameDescriptionRoundLabel.configureLabelText(text: carName)
        recommendCarImageView.image = UIImage(named: carImageUrl)
    }
    // MARK: - Objc Functions
}

// MARK: - LayoutSupportable
extension DefaultQuotationPreviewThumbnailCardView: LayoutSupportable {
    func configureConstraints() {
        _=[logoImageViewConstraints,
           carNameDescriptionRoundLabelConstraints,
           famouseSayingWithCarNameLabelConstraints,
           recommendCarImageViewConstraints,
           reviewdTooltipViewConstraints
        ].map { NSLayoutConstraint.activate($0) }
    }
    
    // MARK: - LayoutSupportable private helper
    private var logoImageViewConstraints: [NSLayoutConstraint] {
        let const = Constants.LogoImageView.self
        return [
            logoImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin),
            logoImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: const.topMargin)]
    }
    
    private var carNameDescriptionRoundLabelConstraints: [NSLayoutConstraint] {
        let const = Constants.CarNameDescriptionRoundLabel.self
        return [
            carNameDescriptionRoundLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: const.topMargin),
            carNameDescriptionRoundLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            carNameDescriptionRoundLabel.heightAnchor.constraint(
                equalToConstant: const.height)]
    }
    
    private var famouseSayingWithCarNameLabelConstraints: [NSLayoutConstraint] {
        let const = Constants.FamouseSayingWithCarNameLabel.self
        return [
            famouseSayingWithCarNameLabel.topAnchor.constraint(
                equalTo: carNameDescriptionRoundLabel.bottomAnchor,
                constant: const.topMargin),
            famouseSayingWithCarNameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin),
            famouseSayingWithCarNameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -const.trailingMargin)]
    }
    
    private var recommendCarImageViewConstraints: [NSLayoutConstraint] {
        let const = Constants.RecommendCarImageView.self
        return [
            recommendCarImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin),
            recommendCarImageView.topAnchor.constraint(
                equalTo: famouseSayingWithCarNameLabel.bottomAnchor,
                constant: const.topMargin),
            recommendCarImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor)]
    }
    
    private var reviewdTooltipViewConstraints: [NSLayoutConstraint] {
        let const = Constants.ReviewdTooltipView.self
        return [
            reviewdTooltipView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin),
            reviewdTooltipView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -const.trailingMargin),
            reviewdTooltipView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -const.bottomMargin)]
    }
}