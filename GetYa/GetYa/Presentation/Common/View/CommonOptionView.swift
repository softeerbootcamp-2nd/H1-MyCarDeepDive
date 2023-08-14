//
//  CommonOptionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/02.
//

import UIKit

class CommonOptionView: UIView {
    // MARK: - UI Properties
    private let imageView = CommonOptionImageView()
    private let titleLabel = CommonLabel(
        fontType: GetYaFont.regularBody4,
        color: .GetYaPalette.gray300)
    private let priceLabel = CommonLabel(
        fontType: GetYaFont.mediumHead4,
        color: .GetYaPalette.gray100)
    
    // MARK: - Properties
    private let titleLabelLayoutConstant = UILayout(leadingMargin: 16)
    private let priceLabelLayoutConstant = UILayout(leadingMargin: 16, topMargin: 4)
    
    // MARK: - LifeCycles
    init(image: UIImage, title: String, price: Int) {
        super.init(frame: .zero)
        configureSubViews()
        configureUI()
        configureDetail(image: image, title: title, price: price)
        configureLayout()
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
    
    func configureDetail(image: UIImage?, title: String?, price: Int?) {
        self.imageView.image = image
        self.titleLabel.text = title
        self.priceLabel.text = (price ?? 0).toPriceFormat
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
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: titleLabelLayoutConstant.leadingMargin)
        ])
    }
    
    private func configurePriceLabelLayout() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: priceLabelLayoutConstant.topMargin),
            priceLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: priceLabelLayoutConstant.leadingMargin),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
