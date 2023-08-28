//
//  OptionSummaryView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/13.
//

import UIKit

class OptionNameAndPriceView: UIView {
    enum Constants {
        enum NameLabel {
            static let width: CGFloat = CGFloat(199).scaledWidth
        }
    }
    
    // MARK: - UI properties
    private let nameLabel = CommonLabel(
        fontType: .regularBody4,
        color: .GetYaPalette.gray300)
    private let priceLabel = CommonLabel(
        fontType: .mediumBody3,
        color: .GetYaPalette.gray100)
    
    // MARK: - Lifecycles
    convenience init(nameText: String) {
        self.init(frame: .zero)
        
        setName(text: nameText)
    }
    
    convenience init(nameText: String, priceValue: Int) {
        self.init(frame: .zero)
        
        setName(text: nameText)
        setPrice(value: priceValue)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
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
        addSubviews([
            nameLabel,
            priceLabel
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureNameLabel()
        configurePriceLabel()
    }
    
    private func configureNameLabel() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLabel.widthAnchor.constraint(
                equalToConstant: Constants.NameLabel.width)
        ])
    }
    
    private func configurePriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func setName(text: String) {
        nameLabel.text = text
    }
    
    func setPrice(text: String) {
        priceLabel.text = text
    }
    
    func setPrice(value: Int) {
        priceLabel.text = value == 0 ? "-원" : value.toPriceFormat + "원"
    }
    
    func setNameLabelColor(color: UIColor) {
        nameLabel.textColor = color
    }
    
    func setPriceLabelColor(color: UIColor) {
        priceLabel.textColor = color
    }
    
    func setNameLabelFont(fontType: GetYaFont) {
        nameLabel.configureFontType(fontType: fontType)
    }
    
    func setPriceLabelFont(fontType: GetYaFont) {
        priceLabel.configureFontType(fontType: fontType)
    }
    
    // MARK: - Objc Functions 
}
