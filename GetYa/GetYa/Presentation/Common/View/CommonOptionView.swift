//
//  CommonOptionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/02.
//

import UIKit

class CommonOptionView: UIView {
    enum Constants {
        enum TitleLabel {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
        }
        enum PriceLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 4)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
        }
    }
    
    // MARK: - UI Properties
    private let imageView = CommonOptionImageView()
    private let titleLabel = CommonLabel(
        fontType: GetYaFont.regularBody4,
        color: .GetYaPalette.gray300)
    private let priceLabel = CommonLabel(
        fontType: GetYaFont.mediumHead4,
        color: .GetYaPalette.gray100)
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubViews()
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubViews()
        configureUI()
        configureLayout()
    }
    
    // MARK: - Functions
    private func configureSubViews() {
        [
            imageView,
            titleLabel,
            priceLabel
        ].forEach {
            self.addSubview($0)
        }
    }
    
    private func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
    }
    
    func prepareForReuse() {
        self.imageView.image = nil
    }
    
    func configureDetail(imageURL: String, title: String, price: Int) {
        self.imageView.setImage(urlString: imageURL)
        self.titleLabel.text = title
        if price == 0 {
            self.priceLabel.text = "- 원"
        } else {
            self.priceLabel.text = price.toPriceFormat + "원"
        }
    }
    
    private func configureLayout() {
        configureImageViewLayout()
        configureTitleLabelLayout()
        configurePriceLabelLayout()
    }
    
    private func configureImageViewLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    private func configureTitleLabelLayout() {
        typealias Const = Constants.TitleLabel
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: Const.leadingMargin)
        ])
    }
    
    private func configurePriceLabelLayout() {
        typealias Const = Constants.PriceLabel
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Const.topMargin),
            priceLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: Const.leadingMargin),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
