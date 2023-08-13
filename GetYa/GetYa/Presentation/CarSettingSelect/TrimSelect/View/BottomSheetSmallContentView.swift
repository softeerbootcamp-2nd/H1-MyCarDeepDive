//
//  BottomSheetSmallView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/13.
//

import UIKit

protocol BottomSheetSmallContentDelegate: AnyObject {
    func touchUpChevronUpButton()
    func touchUpNextButton()
}

class BottomSheetSmallContentView: UIView {
    enum Constants {
        enum ChevronButton {
            static let topMargin: CGFloat = CGFloat(10).scaledHeight
            static let height: CGFloat = CGFloat(18).scaledHeight
            static let width: CGFloat = CGFloat(18).scaledHeight
        }
        enum PriceLabel {
            static let topMargin: CGFloat = CGFloat(10).scaledHeight
            static let leadingMargin: CGFloat = CGFloat(4).scaledWidth
        }
        enum NextButton {
            static let leadingMargin: CGFloat = CGFloat(20).scaledWidth
            static let width: CGFloat = CGFloat(192).scaledWidth
        }
    }
    
    // MARK: - UI properties
    private let nameLabel = CommonLabel(
        fontType: .custom(size: 14, kern: -0.2, lineHeight: 14, nameType: .regularHead),
        color: .GetYaPalette.gray500)
    private lazy var chevronButton: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(
            UIImage(systemName: "chevron.up")?.withTintColor(
                .black,
                renderingMode: .alwaysOriginal),
            for: .normal)
        $0.addTarget(
            self,
            action: #selector(touchUpCenvronButton),
            for: .touchUpInside)
    }
    private let priceLabel = CommonLabel(
        fontType: .custom(size: 18, kern: -0.3, lineHeight: 18, nameType: .mediumHead),
        color: .GetYaPalette.gray0)
    private let nextButton = CommonButton(
        font: GetYaFont.mediumBody3.uiFont,
        buttonBackgroundColorType: .primary
    ).set {
        $0.setTitle("다음", for: .normal)
        $0.addTarget(
            self,
            action: #selector(touchUpNextButton),
            for: .touchUpInside)
    }
    
    // MARK: - Properties
    weak var delegate: BottomSheetSmallContentDelegate?
    
    // MARK: - Lifecycles
    convenience init(nameText: String, priceValue: Int) {
        self.init(frame: .zero)
        
        setNameText(text: nameText)
        setPriceValue(value: priceValue)
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
            nameLabel,
            chevronButton,
            priceLabel,
            nextButton
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureNameLabel()
        configureChevronButton()
        configurePriceLabel()
        configureNextButton()
    }
    
    private func configureNameLabel() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(3).scaledWidth)
        ])
    }
    
    private func configureChevronButton() {
        NSLayoutConstraint.activate([
            chevronButton.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: Constants.ChevronButton.topMargin),
            chevronButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            chevronButton.heightAnchor.constraint(
                equalToConstant: Constants.ChevronButton.height),
            chevronButton.widthAnchor.constraint(
                equalToConstant: Constants.ChevronButton.width)
        ])
    }
    
    private func configurePriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: Constants.PriceLabel.topMargin),
            priceLabel.leadingAnchor.constraint(
                equalTo: chevronButton.trailingAnchor,
                constant: Constants.PriceLabel.leadingMargin)
        ])
    }
    
    private func configureNextButton() {
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: topAnchor),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: Constants.NextButton.width)
        ])
    }
    
    // MARK: - Functions
    func setNameText(text: String) {
        self.nameLabel.text = text
    }
    
    func setPriceValue(value: Int) {
        self.priceLabel.text = value.toPriceFormat
    }
    
    // MARK: - Objc Functions
    @objc private func touchUpCenvronButton(sender: UIButton) {
        delegate?.touchUpChevronUpButton()
        isHidden = true
    }
    
    @objc private func touchUpNextButton(sender: UIButton) {
        delegate?.touchUpNextButton()
    }
}
