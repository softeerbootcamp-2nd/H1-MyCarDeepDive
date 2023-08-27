//
//  OptionSummaryView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/13.
//

import UIKit

class OptionSummaryContentView: UIView {
    enum Constants {
        enum TitleLabel {
            static let topMargin = CGFloat(12).scaledHeight
        }
        enum NameAndPriceStackView {
            static let spacing = CGFloat(4).scaledHeight
            static let topMargin = CGFloat(8).scaledHeight
            static let bottomMargin = CGFloat(-12).scaledHeight
        }
    }
    
    // MARK: - UI properties
    let titleLabel = CommonLabel(
        fontType: .mediumBody3,
        color: .GetYaPalette.gray100)
    private let nameAndPriceStackView: UIStackView = UIStackView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = Constants.NameAndPriceStackView.spacing
        $0.axis = .vertical
        $0.layoutMargins = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
    }
    
    // MARK: - Lifecycles
    init(titleText: String) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
        setTitle(text: titleText)
    }
    
    init(titleText: String, optionNames: [String], optionPrices: [Int]) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
        setTitle(text: titleText)
        setOptionData(texts: optionNames, prices: optionPrices)
    }
    
    init(titleText: String, optionName: String, optionPrice: Int) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
        setTitle(text: titleText)
        setOptionDatum(text: optionName, price: optionPrice)
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
        addSubviews([
            titleLabel,
            nameAndPriceStackView
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        configureTitleLabel()
        configureNameAndPriceStackView()
    }
    
    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.TitleLabel.topMargin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func configureNameAndPriceStackView() {
        NSLayoutConstraint.activate([
            nameAndPriceStackView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Constants.NameAndPriceStackView.topMargin),
            nameAndPriceStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            nameAndPriceStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            nameAndPriceStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.NameAndPriceStackView.bottomMargin)
        ])
    }
    
    // MARK: - Functions
    func setTitleFont(fontType: GetYaFont) {
        titleLabel.configureFontType(fontType: fontType)
    }
    
    func setTitleTextColor(color: UIColor) {
        titleLabel.textColor = color
    }
    
    func setTitle(text: String) {
        titleLabel.text = text
    }
    
    func setOptionData(texts: [String], prices: [Int]) {
        texts.enumerated().forEach { (idx, text) in
            let view = OptionNameAndPriceView(
                nameText: text,
                priceValue: prices[idx])
            nameAndPriceStackView.addArrangedSubview(view)
        }
    }
    
    func setOptionDatum(text: String, price: Int) {
        let view = OptionNameAndPriceView(
            nameText: text,
            priceValue: price)
        nameAndPriceStackView.addArrangedSubview(view)
    }
    
    func setSpacing(value: CGFloat) {
        self.nameAndPriceStackView.spacing = .toScaledHeight(value: value)
    }
}
