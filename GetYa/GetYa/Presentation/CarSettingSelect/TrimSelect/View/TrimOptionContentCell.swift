//
//  TrimOptionContentCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/11.
//

import UIKit

protocol TrimOptionContentCellDelegate: AnyObject {
    func touchUpLearnMoreViewButton(sender: UICollectionViewCell)
    func touchUpSelectButton(sender: UICollectionViewCell)
}

class TrimOptionContentCell: UICollectionViewCell {
    enum Constants {
        enum NameLabel {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(12).scaledHeight
        }
        enum TagLabel {
            static let leadingMargin = CGFloat(8).scaledWidth
            static let topMargin = CGFloat(2).scaledHeight
            static let bottomMargin = CGFloat(-2).scaledHeight
        }
        enum DescriptionLabel {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(4).scaledHeight
        }
        enum PriceLabel {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(8).scaledHeight
        }
        enum SelectButton {
            static let trailingMargin = CGFloat(-16).scaledWidth
            static let topMargin = CGFloat(12).scaledHeight
            static let width = CGFloat(28).scaledHeight
            static let height = CGFloat(28).scaledHeight
        }
        enum LearnMoreView {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(14).scaledHeight
            static let trailingMargin = CGFloat(-16).scaledWidth
            static let bottomMargin = CGFloat(-16).scaledWidth
        }
    }
    
    // MARK: - UI properties
    private let nameLabel = CommonLabel(
        fontType: .mediumBody4,
        color: .GetYaPalette.gray300)
    private let descriptionLabel = CommonLabel(
        fontType: .regularBody3,
        color: .GetYaPalette.gray100)
    private let priceLabel = CommonLabel(
        fontType: .mediumHead3,
        color: .GetYaPalette.gray0)
    private let tagLabel = CommonLabel(
        fontType: .regularCaption1,
        color: .GetYaPalette.gray500)
    private(set) lazy var selectButton: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "Gray-Check-Circle"), for: .normal)
        $0.setImage(UIImage(named: "Blue-Check-Circle"), for: .selected)
        $0.addTarget(self, action: #selector(touchUpSelectButton), for: .touchUpInside)
    }
    private(set) lazy var learnMoreView = TrimLearnMoreView(
        textColor: .GetYaPalette.primary,
        text: "더 알아보기"
    ).set {
        $0.delegate = self
    }
    
    // MARK: - Properties
    static let identifier = "TrimOptionContentCell"
    weak var delegate: TrimOptionContentCellDelegate?
    
    // MARK: - Lifecycles
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        learnMoreView.subviews.forEach {
            if $0 is TrimOptionDetailView {
                $0.removeFromSuperview()
            }
        }
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            nameLabel,
            descriptionLabel,
            priceLabel,
            tagLabel,
            selectButton,
            learnMoreView
        ])
    }
    
    private func configureUI() {
        backgroundColor = .white
        
        configureNameLabel()
        configureDescriptionLabel()
        configureTagLabel()
        configurePriceLabel()
        configureSelectButton()
        configureLearnMoreView()
    }
    
    private func configureNameLabel() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.NameLabel.leadingMargin),
            nameLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.NameLabel.topMargin)
        ])
    }
    
    private func configureTagLabel() {
        NSLayoutConstraint.activate([
            tagLabel.leadingAnchor.constraint(
                equalTo: nameLabel.trailingAnchor,
                constant: Constants.TagLabel.leadingMargin),
            tagLabel.topAnchor.constraint(
                equalTo: nameLabel.topAnchor,
                constant: Constants.TagLabel.topMargin),
            tagLabel.bottomAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: Constants.TagLabel.bottomMargin)
        ])
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: Constants.DescriptionLabel.topMargin),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.DescriptionLabel.leadingMargin)
        ])
    }
    
    private func configurePriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Constants.PriceLabel.topMargin),
            priceLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.PriceLabel.leadingMargin)
        ])
    }
    
    private func configureSelectButton() {
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.SelectButton.topMargin),
            selectButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.SelectButton.trailingMargin),
            selectButton.widthAnchor.constraint(equalToConstant: Constants.SelectButton.width),
            selectButton.heightAnchor.constraint(equalToConstant: Constants.SelectButton.height)
        ])
    }
    
    private func configureLearnMoreView() {
        NSLayoutConstraint.activate([
            learnMoreView.topAnchor.constraint(
                equalTo: priceLabel.bottomAnchor,
                constant: Constants.LearnMoreView.topMargin),
            learnMoreView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.LearnMoreView.leadingMargin),
            learnMoreView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.LearnMoreView.trailingMargin),
            learnMoreView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.LearnMoreView.bottomMargin)
        ])
    }
    
    // MARK: - Functions
    func configureNameText(text: String) {
        nameLabel.text = text
    }
    func configureTagTexts(texts: [String]) {
        tagLabel.text = texts.joined(separator: "・")
    }
    
    func configureDescriptionText(text: String) {
        descriptionLabel.text = text
    }
    
    func configurePriceText(price: Int) {
        priceLabel.text = price.toPriceFormat
    }
    
    func setSelectButtonIsSelected(isSelected: Bool) {
        selectButton.isSelected = isSelected
    }
    
    // MARK: - Objc Functions
    @objc private func touchUpSelectButton(sender: UIButton) {
        delegate?.touchUpSelectButton(sender: self)
    }
}

// MARK: - LearnMoreView Delegate
extension TrimOptionContentCell: LearnMoreViewDelegate {
    func touchUpExpandButtonByIsSelected(sender: LearnMoreView, isSelected: Bool) {
        delegate?.touchUpLearnMoreViewButton(sender: self)
    }
}
