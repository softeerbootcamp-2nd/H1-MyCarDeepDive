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
        enum ScrollView {
            static let topMargin: CGFloat = CGFloat(12).scaledHeight
            static let height: CGFloat = CGFloat(355).scaledHeight
        }
        enum OptionSummaryStackView {
            static let topMargin: CGFloat = CGFloat(12).scaledHeight
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
    private let scrollView: UIScrollView = UIScrollView().set {
        $0.showsVerticalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
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
        $0.addAction(
            UIAction(handler: { _ in
                NotificationCenter.default.post(name: NSNotification.Name("touchUpQuoteButton"), object: nil)
            }),
            for: .touchUpInside)
        $0.setTitle("견적내기", for: .normal)
    }
    
    // MARK: - Properties
    weak var delegate: BottomSheetLargeContentDelegate?
    
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
        addSubviews([
            chevronButton,
            titleLabel,
            scrollView,
            trimNameLabel,
            totalPriceLabel,
            quoteButton
        ])
        scrollView.addSubview(optionSummaryStackView)
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        configureChevronButton()
        configureTitleLabel()
        configureScrollView()
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
    private func configureScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: Constants.ScrollView.height)
        ])
    }
    private func configureOptionSummaryStackView() {
        NSLayoutConstraint.activate([
            optionSummaryStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            optionSummaryStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            optionSummaryStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            optionSummaryStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            optionSummaryStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
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
    func setModelInfo(info: (String, Int)) {
        if let view = optionSummaryStackView.arrangedSubviews
            .map({ $0 as? OptionSummaryContentView })
            .filter({ $0?.titleLabel.text == "모델" }).first {
            view?.removeFromSuperview()
        }
        
        let newSummaryView = OptionSummaryContentView(titleText: "모델")
        newSummaryView.setOptionDatum(text: info.0, price: info.1)
        optionSummaryStackView.addArrangedSubview(newSummaryView)
    }
    
    func setColorInfo(info: (String, Int, String, Int)) {
        if let view = optionSummaryStackView.arrangedSubviews
            .map({ $0 as? OptionSummaryContentView })
            .filter({ $0?.titleLabel.text == "색상" }).first {
            view?.removeFromSuperview()
        }
        
        let newSummaryView = OptionSummaryContentView(titleText: "색상")
        newSummaryView.setOptionDatum(text: "외장 - " + info.0, price: info.1)
        newSummaryView.setOptionDatum(text: "내장 - " + info.2, price: info.3)
        optionSummaryStackView.addArrangedSubview(newSummaryView)
    }
    
    func setOptionInfoArray(texts: [String], prices: [Int]) {
        if let view = optionSummaryStackView.arrangedSubviews
            .map({ $0 as? OptionSummaryContentView })
            .filter({ $0?.titleLabel.text == "옵션" }).first {
            view?.removeFromSuperview()
        }
        
        let newSummaryView = OptionSummaryContentView(titleText: "옵션")
        newSummaryView.setOptionData(texts: texts, prices: prices)
        optionSummaryStackView.addArrangedSubview(newSummaryView)
    }
    
    func setTrimName(text: String) {
        trimNameLabel.text = text
    }
    
    func setTotalPrice(price: Int) {
        totalPriceLabel.text = price.toPriceFormat + "원"
    }
    
    // MARK: - Objc Functions
    @objc private func touchUpButton(sender: UIButton) {
        delegate?.touchUpChevronDownButton()
        isHidden = true
    }
}
