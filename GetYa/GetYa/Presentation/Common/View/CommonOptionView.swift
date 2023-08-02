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
        font: .systemFont(ofSize: 14, weight: UIFont.Weight(400)),
        color: UIColor(hexString: "696969")
    )
    private let priceLabel = CommonLabel(
        font: .systemFont(ofSize: 16, weight: UIFont.Weight(500)),
        color: UIColor(hexString: "303030")
    )
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    init(image: UIImage, title: String, price: Int) {
        super.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Functions
    func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
    }
    
    func configureDetail(image: UIImage, title: String, price: Int) {
        self.imageView.image = image
        self.titleLabel.text = title
        self.priceLabel.text = price.toPriceFormat
    }
    
    func configureLayout() {
        configureImageViewLayout()
        configureTitleLabelLayout()
        configurePriceLabelLayout()
    }
    
    func configureImageViewLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    func configureTitleLabelLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: CGFloat.scaledWidth(value: 16)
            )
        ])
    }
    
    func configurePriceLabelLayout() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: CGFloat.scaledHeight(value: 4)
            ),
            priceLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: CGFloat.scaledWidth(value: 16)
            )
        ])
    }
}
