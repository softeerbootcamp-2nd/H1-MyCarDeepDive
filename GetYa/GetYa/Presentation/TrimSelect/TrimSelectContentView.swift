//
//  TrimSelectContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/13.
//

import UIKit

class TrimSelectContentView: UIScrollView {
    enum Constants {
        enum HeaderView {
            static let height = CGFloat(185).scaledHeight
        }
        enum DifficultSelectButton {
            static let topMargin = CGFloat(20).scaledHeight
            static let trailingMargin = CGFloat(-16).scaledWidth
            static let width = CGFloat(112).scaledWidth
        }
        enum TrimSubOptionContentView {
            static let topMarign = CGFloat(12).scaledHeight
            static let leadingMargin = CGFloat(16).scaledWidth
            static let trailingMargin = CGFloat(-16).scaledWidth
        }
        enum TrimOptionContentCollectionView {
            static let topInset = CGFloat(8).scaledHeight
            static let topMarign = CGFloat(25).scaledHeight
            static let bottomMargin = CGFloat(-145).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let contentView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let headerView = TrimHeaderView()
    private let difficultSelectButton: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(
            UIImage(systemName: "questionmark.circle")?.withTintColor(
                .GetYaPalette.acriveBlue,
                renderingMode: .alwaysOriginal),
            for: .normal)
        $0.titleLabel?.font = GetYaFont.mediumBody4.uiFont
        $0.setTitleColor(.GetYaPalette.acriveBlue, for: .normal)
        let text = "고르기 어렵다면?"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: text.count)
        )
        $0.setAttributedTitle(attributedString, for: .normal)
    }
    private let trimSubOptionContentStackView = TrimSubOptionContentStackView()
    private let trimOptionContentCollectionView = TrimOptionContentCollectionView().set {
        $0.contentInset = UIEdgeInsets(
            top: Constants.TrimOptionContentCollectionView.topInset,
            left: 0,
            bottom: 0,
            right: 0)
    }
    
    // MARK: - Properties
    private let titleTexts = ["Exclusive", "Le Blanc (르블랑)", "Prestige", "Caligraphy"]
    private let tagTexts = [
        ["디젤 2.2", "7인승", "2WD"],
        ["디젤 2.2", "7인승", "2WD"],
        ["디젤 2.2", "7인승", "2WD"],
        ["디젤 2.2", "7인승", "2WD"]]
    private let descriptionTexts = ["합리적인 가격의 인기 옵션", "필수적인 옵션만 모은", "가치있는 드라이빙 경험을 주는", "남들과 차별화된 경험"]
    private let priceValues = [43460000, 40440000, 47720000, 52540000]
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        configureUI()
        setOptionContentData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
        configureUI()
        setOptionContentData()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubview(contentView)
        
        contentView.addSubviews([
            headerView,
            difficultSelectButton,
            trimSubOptionContentStackView,
            trimOptionContentCollectionView
        ])
    }
    
    private func configureUI() {
        backgroundColor = .white
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        
        configureContentView()
        configureHeaderView()
        configureDifficultSelectButton()
        configureTrimSubOptionContentView()
        configureTrimOptionContentCollectionView()
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(
                equalTo: contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(
                equalTo: contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(
                equalTo: contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(
                equalTo: contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    private func configureHeaderView() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Constants.HeaderView.height)
        ])
    }
    
    private func configureDifficultSelectButton() {
        NSLayoutConstraint.activate([
            difficultSelectButton.topAnchor.constraint(
                equalTo: headerView.bottomAnchor,
                constant: Constants.DifficultSelectButton.topMargin),
            difficultSelectButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.DifficultSelectButton.trailingMargin),
            difficultSelectButton.widthAnchor.constraint(
                equalToConstant: Constants.DifficultSelectButton.width)
        ])
    }
    
    private func configureTrimSubOptionContentView() {
        NSLayoutConstraint.activate([
            trimSubOptionContentStackView.topAnchor.constraint(
                equalTo: difficultSelectButton.bottomAnchor,
                constant: Constants.TrimSubOptionContentView.topMarign),
            trimSubOptionContentStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.TrimSubOptionContentView.leadingMargin),
            trimSubOptionContentStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.TrimSubOptionContentView.trailingMargin)
        ])
    }
    
    private func configureTrimOptionContentCollectionView() {
        let const = Constants.TrimOptionContentCollectionView.self
        let height = TrimOptionContentCollectionView.Constants.HeaderView.height +
        TrimOptionContentCollectionView.Constants.Cell.height *
        CGFloat(titleTexts.count)
        
        NSLayoutConstraint.activate([
            trimOptionContentCollectionView.topAnchor.constraint(
                equalTo: trimSubOptionContentStackView.bottomAnchor,
                constant: const.topMarign),
            trimOptionContentCollectionView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            trimOptionContentCollectionView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            trimOptionContentCollectionView.heightAnchor.constraint(
                equalToConstant: height),
            trimOptionContentCollectionView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: const.bottomMargin)
        ])
    }
    
    private func setOptionContentData() {
        trimOptionContentCollectionView.setTitleTexts(texts: titleTexts)
        trimOptionContentCollectionView.setTagTexts(texts: tagTexts)
        trimOptionContentCollectionView.setDescriptionTexts(texts: descriptionTexts)
        trimOptionContentCollectionView.setPrice(values: priceValues)
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions

}
