//
//  OptionSelectAlITypeItemCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit

struct Tag: Hashable {
    let id: Int
    let name: String
}

struct AdditionalOptionItem: Hashable {
    let id: Int
    let imageURL: String
    let selectRate: CGFloat
    let optionName: String
    let optionPrice: Int
    let badgeName: String
    let tagList: [Tag]
}

class OptionSelectAdditionalItemCell: UICollectionViewCell {
    enum Constants {
        enum ImageView {
            static let height: CGFloat = .toScaledHeight(value: 112)
        }
        enum LearnMoreView {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
            static let height: CGFloat = .toScaledHeight(value: 22)
        }
        enum OptionNameLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
        }
        enum SelectButton {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
            static let height: CGFloat = .toScaledHeight(value: 28)
        }
    }
    
    // MARK: - UI properties
    private let imageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    private lazy var learnMoreView = OptionSelectItemLearnMoreView()
    private let optionNameLabel = CommonLabel(
        fontType: .mediumBody3,
        color: .GetYaPalette.gray0)
    private let optionPriceLabel = CommonLabel(
        fontType: .mediumBody4,
        color: .GetYaPalette.gray400)
    private let selectButton = CommonOptionSelectButton()
    private let badgeLabel = CommonPaddingLabel(
        padding: UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6),
        fontType: .custom(size: 12, kern: -0.5, lineHeight: 12, nameType: .boldText),
        color: .white
    ).set {
        $0.isHidden = true
    }
    private let rateBadgeLabel = CommonPaddingLabel(
        padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
        fontType: .regularCaption1,
        color: .white
    ).set {
        $0.layer.backgroundColor = UIColor(hexString: "0F1114").withAlphaComponent(0.5).cgColor
        $0.isHidden = true
    }
    
    // MARK: - Properties
    static let identifier = "OptionSelectAdditionalItemCell"
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        badgeLabel.isHidden = true
        selectButton.isSelected = false
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            imageView,
            learnMoreView,
            optionNameLabel,
            optionPriceLabel,
            selectButton,
            badgeLabel
        ])
    }
    
    private func configureUI() {
        configureImageView()
        configureLearnMoreView()
        configureOptionNameLabel()
        configureOptionPriceLabel()
        configureSelectButton()
        configureBadgeLabel()
    }
    
    private func configureImageView() {
        typealias Const = Constants.ImageView
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureLearnMoreView() {
        typealias Const = Constants.LearnMoreView
        
        NSLayoutConstraint.activate([
            learnMoreView.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Const.topMargin),
            learnMoreView.leadingAnchor.constraint(equalTo: leadingAnchor),
            learnMoreView.trailingAnchor.constraint(equalTo: trailingAnchor),
            learnMoreView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureOptionNameLabel() {
        typealias Const = Constants.OptionNameLabel
        
        NSLayoutConstraint.activate([
            optionNameLabel.topAnchor.constraint(
                equalTo: learnMoreView.bottomAnchor,
                constant: Const.topMargin),
            optionNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func configureOptionPriceLabel() {
        NSLayoutConstraint.activate([
            optionPriceLabel.topAnchor.constraint(equalTo: optionNameLabel.bottomAnchor),
            optionPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func configureSelectButton() {
        typealias Const = Constants.SelectButton
        
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(
                equalTo: optionPriceLabel.bottomAnchor,
                constant: Const.topMargin),
            selectButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectButton.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureBadgeLabel() {
        NSLayoutConstraint.activate([
            badgeLabel.topAnchor.constraint(equalTo: topAnchor),
            badgeLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func configureBadge(name: String) {
        if name == "N Performance" {
            badgeLabel.text = name
            badgeLabel.layer.backgroundColor = UIColor(hexString: "AE4747").cgColor
            badgeLabel.isHidden = false
        } else if name == "H Genuine Accessories" {
            badgeLabel.text = name
            badgeLabel.layer.backgroundColor = UIColor(hexString: "558AC7").cgColor
            badgeLabel.isHidden = false
        } else {
            badgeLabel.isHidden = true
        }
    }
    
    private func configureRateBadge(rate: CGFloat) {
        if rate >= 60 {
            rateBadgeLabel.isHidden = false
            rateBadgeLabel.text = "\(Int(rate))% 의 사용자가 선택"
        }
    }
    
    // MARK: - Functions
    func addActionLearnMoreViewButton(handler: @escaping () -> Void) {
        learnMoreView.addButtonAction(handler: handler)
    }
    
    func addActionSelectButton(handler: @escaping () -> Void) {
        selectButton.addAction(UIAction(handler: { _ in
            self.selectButton.isSelected.toggle()
            handler()
        }), for: .touchUpInside)
    }
    
    func setSelectButtonIsSelected(isSelected: Bool) {
        selectButton.isSelected = isSelected
    }
    
    func setData(datum: AdditionalOptionItem) {
        imageView.image = UIImage(named: "LifeStylePeekForYou") // data.imageURL
        optionNameLabel.text = datum.optionName
        optionPriceLabel.text = datum.optionPrice.toPriceFormat + "원"
        configureRateBadge(rate: datum.selectRate)
        configureBadge(name: datum.badgeName)
    }
    
    // MARK: - Objc Functions
}
