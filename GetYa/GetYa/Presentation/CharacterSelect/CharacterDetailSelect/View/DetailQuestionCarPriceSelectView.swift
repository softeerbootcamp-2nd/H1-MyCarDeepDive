//
//  DetailQuestionCarPriceSelectView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/17.
//

import UIKit
import Combine

final class DetailQuestionCarPriceSelectView: UIView {
    enum Constants {
        enum PriceRangeDescriptionLabel {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
        }
        enum PriceSlider {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let topMargin: CGFloat = .toScaledHeight(value: 24)
            static let height: CGFloat = .toScaledHeight(value: 24)
        }
        enum PriceMinimumLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
        }
        enum PriceMaximumLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
        }
    }
    
    // MARK: - UI properties
    private let priceRangeDescriptionLabel = CommonLabel(
        fontType: .custom(size: 24, kern: -0.2, lineHeight: 26, nameType: .mediumHead),
        color: .GetYaPalette.gray50,
        text: "가격대 준비중입니다.")
    private let priceSlider = TwoWaySlider()
    private let priceMinimumLabel = CommonLabel(
        fontType: .regularBody4,
        color: .GetYaPalette.gray400,
        text: "최소 가격 준비중입니다")
    private let priceMaximumLabel = CommonLabel(
        fontType: .regularBody4,
        color: .GetYaPalette.gray400,
        text: "최대 가격 준비중입니다")
    
    // MARK: - Properties
    private var curPrice: Int = 0
    private var priceSliderSubscription: AnyCancellable?
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupUI()
        configurePrice(minPrice: 4200, maxPrice: 6900, priceUnit: 300)
        bind()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        configurePrice(minPrice: 4200, maxPrice: 6900, priceUnit: 300)
        bind()
    }
    
    // MARK: - Private Functions
    func bind() {
        priceSliderSubscription = priceSlider.valueChanged.sink { [weak self] in
            guard let self else { return }
            let newText = priceRangeDescriptionLabel
                .text?
                .replacingOccurrences(of: curPrice.insertCommas, with: $0.insertCommas)
            priceRangeDescriptionLabel.text = newText
            curPrice = $0
        }
    }
    // MARK: - Functions
    
    func configurePrice(minPrice: Int, maxPrice: Int, priceUnit: Int) {
        priceSlider.configure(minValue: Float(minPrice), maxValue: Float(maxPrice))
        priceSlider.configure(priceUnit: Float(priceUnit))
        priceMinimumLabel.text = "\(minPrice) 만원"
        priceMaximumLabel.text = "\(maxPrice) 만원"
        curPrice = maxPrice
        priceSlider.setValue(Float(curPrice), animated: false)
        priceRangeDescriptionLabel.text = "\(minPrice.insertCommas)만원 ~ \(curPrice.insertCommas)만원"
    }
}

// MARK: - QuestionViewSendable
extension DetailQuestionCarPriceSelectView: QuestionViewSendable {
    func sendCarMinimumAndMaximumPrice() -> (minimumValue: Int?, maximumValue: Int?) {
        return (Int(priceSlider.minimumValue), curPrice)
    }
}

// MARK: - LayoutSupportable
extension DetailQuestionCarPriceSelectView: LayoutSupportable {
    func setupViews() {
        addSubviews([
            priceRangeDescriptionLabel,
            priceSlider,
            priceMinimumLabel,
            priceMaximumLabel])
    }
    
    func setupConstriants() {
        configurePriceRangeDescriptionLabel()
        configurePriceSlider()
        configurePriceMinimumLabel()
        configurePriceMaximumLabel()
    }
    
    private func configurePriceRangeDescriptionLabel() {
        typealias Const = Constants.PriceRangeDescriptionLabel
        NSLayoutConstraint.activate([
            priceRangeDescriptionLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            priceRangeDescriptionLabel.topAnchor.constraint(
                equalTo: topAnchor)])
    }
    
    private func configurePriceSlider() {
        typealias Const = Constants.PriceSlider
        NSLayoutConstraint.activate([
            priceSlider.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            priceSlider.topAnchor.constraint(
                equalTo: priceRangeDescriptionLabel.bottomAnchor,
                constant: Const.topMargin),
            priceSlider.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            priceSlider.heightAnchor.constraint(
                equalToConstant: Const.height)])
    }
    
    private func configurePriceMinimumLabel() {
        typealias Const = Constants.PriceMinimumLabel
        NSLayoutConstraint.activate([
            priceMinimumLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            priceMinimumLabel.topAnchor.constraint(
                equalTo: priceSlider.bottomAnchor,
                constant: Const.topMargin)])
    }
    
    private func configurePriceMaximumLabel() {
        typealias Const = Constants.PriceMaximumLabel
        NSLayoutConstraint.activate([
            priceMaximumLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            priceMaximumLabel.topAnchor.constraint(
                equalTo: priceSlider.bottomAnchor,
                constant: Const.topMargin)])
    }
}
