//
//  LifeStyleCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/05.
//

import UIKit

protocol LifeStyleCellDelegate: AnyObject {
    func touchUpButton(cell: UICollectionViewCell)
}

class LifeStyleCell: UICollectionViewCell {
    typealias Palette = UIColor.GetYaPalette
    
    enum Constants {
        enum TitleImageView {
            static let height: CGFloat = .toScaledHeight(value: 128)
        }
        enum TagStackView {
            static let topMargin: CGFloat = .toScaledHeight(value: 24)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 20)
            static let height: CGFloat = .toScaledHeight(value: 30)
        }
        enum DescriptionLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 12)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 20)
        }
        enum SelectImageView {
            static let topMargin: CGFloat = .toScaledHeight(value: 22)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -20)
            static let height: CGFloat = .toScaledHeight(value: 28)
        }
        enum LineView {
            static let topMargin: CGFloat = .toScaledHeight(value: 29)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 20)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -20)
        }
        enum Button {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
        }
    }
    
    // MARK: - UI Properties
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = Palette.primary.cgColor
        
        return imageView
    }()
    
    private let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = CGFloat(16).scaledWidth
        view.layer.borderColor = Palette.primary.cgColor
        view.layer.backgroundColor = Palette.lightPrimary.cgColor
        
        return view
    }()
    
    private let tagStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = CGFloat(8).scaledWidth
        
        return stackView
    }()
    
    private let descriptionLabel = CommonLabel(
        fontType: GetYaFont.mediumBody2,
        color: Palette.gray0
    )
    
    private let selectImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "Gray-Check-Circle"),
            highlightedImage: UIImage(named: "Blue-Check-Circle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Palette.gray900
        
        return view
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("라이프스타일 엿보기", for: .normal)
        button.setTitleColor(Palette.gray200, for: .normal)
        button.titleLabel?.font = GetYaFont.mediumBody4.uiFont
        
        return button
    }()
    
    // MARK: - Properties
    static let identifier: String = "LifeStyleCell"
    weak var delegate: LifeStyleCellDelegate?
    private(set) var tagTexts: [String] = [] {
        didSet {
            tagTexts.forEach {
                let tagView = CommonPaddingLabel(
                    padding: UIEdgeInsets(
                        top: 6,
                        left: 10,
                        bottom: 6,
                        right: 10),
                    fontType: .mediumCaption1,
                    color: .GetYaPalette.acriveBlue,
                    text: $0
                ).set {
                    $0.textAlignment = .center
                    $0.layer.backgroundColor = Palette.lightAcriveBlue.cgColor
                    $0.layer.cornerRadius = 15
                }
                tagStackView.addArrangedSubview(tagView)
            }
        }
    }
    private(set) var descriptionText: String = "" {
        didSet {
            self.descriptionLabel.text = descriptionText
        }
    }
    private(set) var titleImage: UIImage? {
        didSet {
            self.titleImageView.image = titleImage
        }
    }
    override var isSelected: Bool {
        didSet {
            configureByIsSelected(isSelected: isSelected)
        }
    }
    
    // MARK: - LifeCycles
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
        delegate = nil
        tagStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    // MARK: - Functions
    private func setupViews() {
        addSubviews([
            baseView,
            titleImageView
        ])
        
        baseView.addSubviews([
            tagStackView,
            descriptionLabel,
            selectImageView,
            lineView,
            button
        ])
    }
    
    private func configureUI() {
        configureTitleImageView()
        configureBaseView()
        configureTagStackView()
        configureDescriptionLabel()
        configureSelectImageView()
        configureLineView()
        configureButton()
    }
    
    private func configureTitleImageView() {
        typealias Const = Constants.TitleImageView
        titleImageView.layer.cornerRadius = Const.height / 2
        
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: self.topAnchor),
            titleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleImageView.widthAnchor.constraint(
                equalToConstant: Const.height),
            titleImageView.heightAnchor.constraint(
                equalToConstant: Const.height)
        ])
    }
    
    private func configureBaseView() {
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: titleImageView.centerYAnchor),
            baseView.leadingAnchor.constraint(equalTo: leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureTagStackView() {
        typealias Const = Constants.TagStackView
        
        NSLayoutConstraint.activate([
            tagStackView.topAnchor.constraint(
                equalTo: titleImageView.bottomAnchor,
                constant: Const.topMargin),
            tagStackView.leadingAnchor.constraint(
                equalTo: baseView.leadingAnchor,
                constant: Const.leadingMargin),
            tagStackView.heightAnchor.constraint(
                equalToConstant: Const.height)
        ])
    }
    
    private func configureDescriptionLabel() {
        typealias Const = Constants.DescriptionLabel
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: self.tagStackView.bottomAnchor,
                constant: Const.topMargin),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Const.leadingMargin)
        ])
    }
    
    private func configureSelectImageView() {
        typealias Const = Constants.SelectImageView
        
        NSLayoutConstraint.activate([
            selectImageView.topAnchor.constraint(
                equalTo: self.tagStackView.bottomAnchor,
                constant: Const.topMargin),
            selectImageView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: Const.trailingMargin),
            selectImageView.heightAnchor.constraint(
                equalToConstant: Const.height),
            selectImageView.widthAnchor.constraint(
                equalToConstant: Const.height)
        ])
    }
    
    private func configureLineView() {
        typealias Const = Constants.LineView
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(
                equalTo: self.descriptionLabel.bottomAnchor,
                constant: Const.topMargin),
            lineView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Const.leadingMargin),
            lineView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: Const.trailingMargin),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func configureButton() {
        typealias Const = Constants.Button
        button.addTarget(self, action: #selector(touchUpButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(
                equalTo: lineView.bottomAnchor,
                constant: Const.topMargin),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureByIsSelected(isSelected: Bool) {
        lineView.backgroundColor = isSelected ? Palette.gray700 : Palette.gray900
        selectImageView.isHighlighted = isSelected
        descriptionLabel.textColor = isSelected ? Palette.primary : Palette.gray0
        tagStackView.arrangedSubviews.forEach {
            $0.layer.backgroundColor = isSelected ? Palette.lightAcriveBlue.cgColor : Palette.gray1000.cgColor
        }
        baseView.layer.backgroundColor = isSelected ?  UIColor.clear.cgColor : Palette.lightPrimary.cgColor
        baseView.layer.borderWidth = isSelected ? 1.5 : 0
        titleImageView.layer.borderWidth = isSelected ? 1.5 : 0
    }
    
    func setTagViews(texts: [String]) {
        tagTexts = texts
    }
    
    func setDescriptionText(text: String) {
        descriptionText = text
    }
    
    func setTitleImage(image: UIImage?) {
        titleImage = image
    }
    
    @objc private func touchUpButton() {
        delegate?.touchUpButton(cell: self)
    }
}
