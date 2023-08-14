//
//  BottomSheetLargeContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/13.
//

import UIKit

protocol BottomSheetLargeContentDelegate: AnyObject {
    func touchUpChevronDownButton()
}

class BottomSheetLargeContentView: UIView {
    enum Constants {
        enum ChevronButton {
            static let width: CGFloat = CGFloat(48).scaledWidth
            static let height: CGFloat = CGFloat(28).scaledHeight
        }
        enum TitleLabel {
            static let topMargin: CGFloat = CGFloat(12).scaledHeight
        }
        enum OptionSummaryStackView {
            static let topMargin: CGFloat = CGFloat(12).scaledHeight
            static let height: CGFloat = CGFloat(320).scaledHeight
        }
        enum TrimNamelabel {
            static let bottomMargin: CGFloat = CGFloat(-14).scaledHeight
        }
        enum TotalPriceLabel {
            static let bottomMargin: CGFloat = CGFloat(-14).scaledHeight
        }
        enum QuoteButton {
            static let height: CGFloat = CGFloat(52).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private lazy var chevronButton: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(
            UIImage(systemName: "chevron.down")?.withTintColor(
                .black,
                renderingMode: .alwaysOriginal),
            for: .normal)
        $0.addTarget(self, action: #selector(touchUpButton), for: .touchUpInside)
    }
    private let titleLabel = CommonLabel(
        fontType: .boldBody2,
        color: .black,
        text: "요약보기")
    private let optionSummaryStackView: UIStackView = UIStackView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .GetYaPalette.gray700
        $0.axis = .vertical
        $0.spacing = 1
        $0.layoutMargins = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        $0.isLayoutMarginsRelativeArrangement = true
    }
    private let trimNameLabel = CommonLabel(
        fontType: .custom(size: 14, kern: -0.2, lineHeight: 14, nameType: .regularHead),
        color: .GetYaPalette.gray500)
    private let totalPriceLabel = CommonLabel(
        fontType: .custom(size: 18, kern: -0.3, lineHeight: 18, nameType: .mediumHead),
        color: .GetYaPalette.gray0)
    private let quoteButton = CommonButton(
        font: GetYaFont.mediumBody3.uiFont,
        buttonBackgroundColorType: .primary
    ).set {
        $0.setTitle("견적내기", for: .normal)
    }
    
    // MARK: - Properties
    weak var delegate: BottomSheetLargeContentDelegate?
    
    // MARK: - Lifecycles
    init(
        modelName: String,
        modelPrice: Int,
        colorNames: [String],
        colorPrices: [Int],
        optionNames: [String],
        optionPrices: [Int],
        trimName: String
    ) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
        setReceipt(
            modelName: modelName,
            modelPrice: modelPrice,
            colorNames: colorNames,
            colorPrices: colorPrices,
            optionNames: optionNames,
            optionPrices: optionPrices)
        let totalPrice = modelPrice + colorPrices.reduce(0, +) + optionPrices.reduce(0, +)
        setTrimReceipt(name: trimName, pirce: totalPrice)
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
            chevronButton,
            titleLabel,
            optionSummaryStackView,
            trimNameLabel,
            totalPriceLabel,
            quoteButton
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        configureChevronButton()
        configureTitleLabel()
        configureOptionSummaryStackView()
        configureTrimNameLabel()
        configureTotalPriceLabel()
        configureQuoteButton()
    }
    
    private func configureChevronButton() {
        NSLayoutConstraint.activate([
            chevronButton.topAnchor.constraint(equalTo: topAnchor),
            chevronButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            chevronButton.heightAnchor.constraint(
                equalToConstant: Constants.ChevronButton.height),
            chevronButton.widthAnchor.constraint(
                equalToConstant: Constants.ChevronButton.width)
        ])
    }
    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: chevronButton.bottomAnchor,
                constant: Constants.TitleLabel.topMargin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    private func configureOptionSummaryStackView() {
        NSLayoutConstraint.activate([
            optionSummaryStackView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Constants.OptionSummaryStackView.topMargin),
            optionSummaryStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionSummaryStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor)
        ])
    }
    private func configureTrimNameLabel() {
        NSLayoutConstraint.activate([
            trimNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            trimNameLabel.bottomAnchor.constraint(
                equalTo: quoteButton.topAnchor,
                constant: Constants.TrimNamelabel.bottomMargin)
        ])
    }
    private func configureTotalPriceLabel() {
        NSLayoutConstraint.activate([
            totalPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalPriceLabel.bottomAnchor.constraint(
                equalTo: quoteButton.topAnchor,
                constant: Constants.TotalPriceLabel.bottomMargin)
        ])
    }
    private func configureQuoteButton() {
        NSLayoutConstraint.activate([
            quoteButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            quoteButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            quoteButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            quoteButton.heightAnchor.constraint(
                equalToConstant: Constants.QuoteButton.height)
        ])
    }
    
    // MARK: - Functions
    
    // TODO: 이 밑에 로직들은 데이터 들어오는거에 달라질 예정 (임시인 것임)
    func setReceipt(
        modelName: String,
        modelPrice: Int,
        colorNames: [String],
        colorPrices: [Int],
        optionNames: [String],
        optionPrices: [Int]
    ) {
        setModelReceipt(name: modelName, price: modelPrice)
        setColorReceipt(names: colorNames, prices: colorPrices)
        setOptionReceipt(names: optionNames, prices: optionPrices)
    }
    
    private func setModelReceipt(name: String, price: Int) {
        let newView = OptionSummaryContentView(
            titleText: "모델",
            optionNames: [name],
            optionPrices: [price])
        optionSummaryStackView.addArrangedSubview(newView)
    }
    
    private func setColorReceipt(names: [String], prices: [Int]) {
        let newView = OptionSummaryContentView(
            titleText: "색상",
            optionNames: names,
            optionPrices: prices)
        optionSummaryStackView.addArrangedSubview(newView)
    }
    
    private func setOptionReceipt(names: [String], prices: [Int]) {
        let newView = OptionSummaryContentView(
            titleText: "옵션",
            optionNames: names,
            optionPrices: prices)
        optionSummaryStackView.addArrangedSubview(newView)
    }
    
    func setTrimReceipt(name: String, pirce: Int) {
        trimNameLabel.text = name
        totalPriceLabel.text = pirce.toPriceFormat
    }
    
    // MARK: - Objc Functions
    @objc private func touchUpButton(sender: UIButton) {
        delegate?.touchUpChevronDownButton()
        isHidden = true
    }
}
