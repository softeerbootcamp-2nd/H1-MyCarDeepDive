//
//  OptionSelectTooltipView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import UIKit

class OptionSelectTooltipView: UIView {
    enum Constants {
        enum TooltipView {
            static let tipWidth = CGFloat(14).scaledWidth
            static let tipheight = CGFloat(10).scaledWidth
        }
        enum ImageView {
            static let leadingMargin = CGFloat(12).scaledWidth
            static let width = CGFloat(72).scaledHeight
            static let height = CGFloat(72).scaledHeight
        }
        enum TagLabel {
            static let leadingMargin = CGFloat(8).scaledWidth
            static let topMargin = CGFloat(12).scaledWidth
        }
        enum OptionNameLabel {
            static let leadingMargin = CGFloat(8).scaledWidth
            static let width: CGFloat = .toScaledWidth(value: 140)
        }
        enum OptionPriceLabel {
            static let leadingMargin = CGFloat(8).scaledWidth
            static let topMargin = CGFloat(8).scaledWidth
        }
        enum Button {
            static let trailingMargin: CGFloat = .toScaledWidth(value: -8)
            static let height: CGFloat = .toScaledHeight(value: 24)
            static let width: CGFloat = .toScaledHeight(value: 24)
        }
    }
    
    // MARK: - UI properties
    private let tooltipView = TooltipView(
        backgroundColor: .white,
        tipStartX: 0,
        tipStartY: 0,
        tipYType: .top,
        tipWidth: Constants.TooltipView.tipWidth,
        tipHeight: Constants.TooltipView.tipheight)
    private let imageView: UIImageView = UIImageView().set {
        $0.image = UIImage(systemName: "house")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let tagLabel = CommonLabel(
        fontType: .regularCaption1,
        color: .GetYaPalette.gray400)
    private let optionNameLabel = CommonLabel(
        fontType: .mediumBody3,
        color: .GetYaPalette.gray50).set {
            $0.numberOfLines = 1
        }
    private let optionPriceLabel = CommonLabel(
        fontType: .mediumHead4,
        color: .GetYaPalette.gray200).set {
            $0.text = 790000.toPriceFormat + "원"
        }
    private let button: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(
            UIImage(systemName: "chevron.right")?.withTintColor(
                .GetYaPalette.gray100,
                renderingMode: .alwaysOriginal),
            for: .normal)
    }
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
        configureUI()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubview(tooltipView)
        
        tooltipView.addSubviews([
            imageView,
            tagLabel,
            optionNameLabel,
            optionPriceLabel,
            button
        ])
    }
    
    private func configureUI() {
        alpha = 0
        
        configureShadow()
        configureTooltipView()
        configureImageView()
        configureTagLabel()
        configureOptionNameLabel()
        configureOptionPriceLabel()
        configureButton()
    }
    
    private func configureShadow() {
        layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
    
    private func configureTooltipView() {
        NSLayoutConstraint.activate([
            tooltipView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tooltipView.topAnchor.constraint(equalTo: topAnchor),
            tooltipView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tooltipView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureImageView() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(
                equalTo: tooltipView.leadingAnchor,
                constant: Constants.ImageView.leadingMargin),
            imageView.centerYAnchor.constraint(equalTo: tooltipView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Constants.ImageView.width),
            imageView.heightAnchor.constraint(equalToConstant: Constants.ImageView.height)
        ])
    }
    
    private func configureTagLabel() {
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(
                equalTo: imageView.topAnchor),
            tagLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: Constants.TagLabel.leadingMargin)
        ])
    }
    
    private func configureOptionNameLabel() {
        typealias Const = Constants.OptionNameLabel
        
        NSLayoutConstraint.activate([
            optionNameLabel.topAnchor.constraint(
                equalTo: tagLabel.bottomAnchor),
            optionNameLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: Const.leadingMargin),
            optionNameLabel.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    private func configureOptionPriceLabel() {
        typealias Const = Constants.OptionPriceLabel
        
        NSLayoutConstraint.activate([
//            optionPriceLabel.topAnchor.constraint(
//                equalTo: optionNameLabel.bottomAnchor,
//                constant: Const.topMargin),
            optionPriceLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: Const.leadingMargin),
            optionPriceLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
    
    private func configureButton() {
        typealias Const = Constants.Button
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: tooltipView.trailingAnchor, constant: Const.trailingMargin),
            button.centerYAnchor.constraint(equalTo: tooltipView.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: Const.height),
            button.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    // MARK: - Functions
    func setTooltipPosition(startX: CGFloat, startY: CGFloat, tipYType: TooltipView.TipYType) {
        tooltipView.configureTooltip(
            tipStartX: startX,
            tipStartY: startY,
            tipYType: tipYType,
            tipWidth: Constants.TooltipView.tipWidth,
            tipHeight: Constants.TooltipView.tipheight)
    }

    func setData(imageURL: String, tagName: String, optionName: String, optionPrice: Int) {
        imageView.image = UIImage(systemName: "house")
        tagLabel.text = tagName
        optionNameLabel.text = optionName
        optionPriceLabel.text = optionPrice.toPriceFormat + "원"
    }
}
