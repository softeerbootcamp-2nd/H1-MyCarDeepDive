//
//  SettingAlertView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/17.
//

import UIKit

class SettingAlertView: UIView {
    enum Constants {
        enum LineView {
            static let topMargin: CGFloat = .toScaledHeight(value: 20)
            static let height: CGFloat = 1
        }
        enum TotalNameAndPriceView {
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
        }
    }
    
    // MARK: - UI properties
    private let stackView: UIStackView = UIStackView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    private let totalNameAndPriceView = OptionNameAndPriceView(nameText: "변경 금액").set {
        $0.setNameLabelColor(color: .GetYaPalette.acriveBlue)
        $0.setNameLabelFont(fontType: .mediumCaption1)
    }
    private let lineView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .GetYaPalette.gray700
    }
    
    // MARK: - Properties
    private var totalPrice: Int = 0 {
        didSet {
            totalNameAndPriceView.setPrice(value: totalPrice)
        }
    }
    
    // MARK: - Lifecycles
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
            stackView,
            totalNameAndPriceView,
            lineView
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .GetYaPalette.gray700
        
        configureStackView()
        configureLineView()
        configureTotalNameAndPriceView()
    }
    
    private func configureStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func configureLineView() {
        typealias Cosnt = Constants.LineView
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(
                equalTo: stackView.bottomAnchor,
                constant: Cosnt.topMargin),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: Cosnt.height)
        ])
    }
    
    private func configureTotalNameAndPriceView() {
        typealias Const = Constants.TotalNameAndPriceView
        
        NSLayoutConstraint.activate([
            totalNameAndPriceView.topAnchor.constraint(
                equalTo: lineView.bottomAnchor,
                constant: Const.topMargin),
            totalNameAndPriceView.leadingAnchor.constraint(equalTo: leadingAnchor),
            totalNameAndPriceView.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalNameAndPriceView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    // MARK: - Functions
    func setChangeOtherTrim(
        trimName: String,
        trimPrice: Int,
        otherTrim: String,
        otherTrimPirce: Int
    ) {
        let currentTrimView = OptionSummaryContentView(
            titleText: "현재 트림",
            optionName: trimName,
            optionPrice: trimPrice
        ).set {
            $0.setTitleTextColor(color: .GetYaPalette.acriveBlue)
            $0.setTitleFont(fontType: .mediumCaption1)
        }
        let otherTrimView = OptionSummaryContentView(
            titleText: "변경 트림",
            optionName: trimName,
            optionPrice: trimPrice
        ).set {
            $0.setTitleTextColor(color: .GetYaPalette.acriveBlue)
            $0.setTitleFont(fontType: .mediumCaption1)
        }
        stackView.addArrangedSubview(currentTrimView)
        stackView.addArrangedSubview(otherTrimView)
        totalPrice += otherTrimPirce - trimPrice
    }
    
    func setReleaseExteriorColor(colorName: String, colorPrice: Int) {
        let view = OptionSummaryContentView(
            titleText: "해제되는 외장 색상",
            optionName: colorName,
            optionPrice: colorPrice
        ).set {
            $0.setTitleTextColor(color: .GetYaPalette.acriveBlue)
            $0.setTitleFont(fontType: .mediumCaption1)
        }
        stackView.addArrangedSubview(view)
        totalPrice -= colorPrice
    }
    
    func setReleaseInteriorColor(colorName: String, colorPrice: Int) {
        let view = OptionSummaryContentView(
            titleText: "해제되는 내장 색상",
            optionName: colorName,
            optionPrice: colorPrice
        ).set {
            $0.setTitleTextColor(color: .GetYaPalette.acriveBlue)
            $0.setTitleFont(fontType: .mediumCaption1)
        }
        stackView.addArrangedSubview(view)
        totalPrice -= colorPrice
    }
    
    func setReleaseOption(optionNames: [String], optionPrices: [Int]) {
        let view = OptionSummaryContentView(
            titleText: "해제되는 옵션",
            optionNames: optionNames,
            optionPrices: optionPrices
        ).set {
            $0.setTitleTextColor(color: .GetYaPalette.acriveBlue)
            $0.setTitleFont(fontType: .mediumCaption1)
        }
        stackView.addArrangedSubview(view)
        totalPrice -= optionPrices.reduce(0, +)
    }
    
    // MARK: - Objc Functions
}
