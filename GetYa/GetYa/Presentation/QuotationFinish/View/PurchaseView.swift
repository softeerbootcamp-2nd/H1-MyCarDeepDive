//
//  PurchaseView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit

class PurchaseView: UIView {
    enum Constatns {
        enum StackView {
            static let topMargin: CGFloat = .toScaledHeight(value: 12)
        }
    }
    
    // MARK: - UI properties
    private let titleLabel = CommonLabel(
        fontType: .mediumHead3,
        color: .GetYaPalette.gray100,
        text: "차량 구매")
    private let stackView: UIStackView = UIStackView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 1
        $0.backgroundColor = .GetYaPalette.gray700
    }
    private let totalNameAndPriceLabel: OptionNameAndPriceView = OptionNameAndPriceView().set {
        $0.backgroundColor = .white
        $0.setName(text: "차량 총 견적 금액")
        $0.setNameLabelFont(fontType: .mediumBody3)
        $0.setNameLabelColor(color: .GetYaPalette.gray400)
        $0.setPriceLabelFont(fontType: .mediumHead3)
        $0.setPriceLabelColor(color: .GetYaPalette.acriveBlue)
    }
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    convenience init(totalPrice: Int) {
        self.init(frame: .zero)
        totalNameAndPriceLabel.setPrice(value: totalPrice)
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
            stackView,
            totalNameAndPriceLabel
        ])
        ["탁송", "할인/포인트", "결제방법", "면제 구분 및 등록비"].forEach {
            let learnMoreView = PurchaseLearnMoreView(textColor: .GetYaPalette.gray300, text: $0)
            learnMoreView.heightAnchor.constraint(equalToConstant: 48).isActive = true
            stackView.addArrangedSubview(learnMoreView)
        }
        totalNameAndPriceLabel.heightAnchor.constraint(equalToConstant: CGFloat(50).scaledHeight).isActive = true
        stackView.addArrangedSubview(totalNameAndPriceLabel)
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureTitleLabel()
        configureStackView()
    }
    
    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func configureStackView() {
        typealias Const = Constatns.StackView
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Const.topMargin),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func setTotalPrice(totalPrice: Int) {
        totalNameAndPriceLabel.setPrice(value: totalPrice)
    }
}
