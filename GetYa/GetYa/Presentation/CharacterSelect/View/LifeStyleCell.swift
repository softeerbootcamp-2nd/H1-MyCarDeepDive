//
//  LifeStyleCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/05.
//

import UIKit

class LifeStyleCell: UICollectionViewCell {
    // MARK: - UI Properties
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.GetYaPalette.primary.cgColor
        
        return imageView
    }()
    
    private let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = CGFloat(16).scaledWidth
        view.layer.borderColor = UIColor.GetYaPalette.primary.cgColor
        view.layer.backgroundColor = UIColor.GetYaPalette.lightPrimary.cgColor
        
        return view
    }()
    
    private let tagStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = CGFloat(8).scaledWidth
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let descriptionLabel = CommonLabel(
        font: GetYaFont.mediumBody2.uiFont,
        color: .GetYaPalette.gray0
    )
    
    private let selectImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "Gray-Check-Circle"),
            highlightedImage: UIImage(named: "Blue-Check-Circle")
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .GetYaPalette.gray900
        
        return view
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("라이프스타일 엿보기", for: .normal)
        button.setTitleColor(.GetYaPalette.gray200, for: .normal)
        button.titleLabel?.font = GetYaFont.mediumBody4.uiFont
        
        return button
    }()
    
    // MARK: - Properties
    static let identifier: String = "LifeStyleCell"
    override var isSelected: Bool {
        didSet {
            lineView.backgroundColor = isSelected ? .GetYaPalette.gray700 : .GetYaPalette.gray900
            selectImageView.isHighlighted = isSelected
            descriptionLabel.textColor = isSelected ? .GetYaPalette.primary : .GetYaPalette.gray0
            tagStackView.arrangedSubviews.map { $0 as? TagView }.forEach {
                $0?.configureBackgroundColor(color: isSelected ? .GetYaPalette.lightAcriveBlue : .GetYaPalette.gray1000)
            }
            baseView.layer.backgroundColor = isSelected ?  UIColor.clear.cgColor : UIColor.GetYaPalette.lightPrimary.cgColor
            baseView.layer.borderWidth = isSelected ? 1.5 : 0
            titleImageView.layer.borderWidth = isSelected ? 1.5 : 0
        }
    }
    private let titleImageViewLayoutConstant = UILayout(height: 128)
    private let tagStackViewLayoutConstant = UILayout(
        leadingMargin: 20,
        topMargin: 24,
        height: 30,
        width: 146
    )
    private let descriptionLabelLayoutConstant = UILayout(
        leadingMargin: 20,
        topMargin: 12
    )
    private let selectImageViewLayoutConstant = UILayout(
        topMargin: 22,
        trailingMargin: -20,
        height: 28
    )
    private let lineViewLayoutConstant = UILayout(
        leadingMargin: 20,
        topMargin: 29,
        trailingMargin: -20
    )
    private let buttonLayoutConstant = UILayout(
        topMargin: 8
    )
    
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
        titleImageView.layer.cornerRadius = titleImageViewLayoutConstant.height / 2
        
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: self.topAnchor),
            titleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleImageView.widthAnchor.constraint(
                equalToConstant: titleImageViewLayoutConstant.height
            ),
            titleImageView.heightAnchor.constraint(
                equalToConstant: titleImageViewLayoutConstant.height
            )
        ])
    }
    
    private func configureBaseView() {
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: titleImageView.centerYAnchor),
            baseView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureTagStackView() {
        NSLayoutConstraint.activate([
            tagStackView.topAnchor.constraint(
                equalTo: titleImageView.bottomAnchor,
                constant: tagStackViewLayoutConstant.topMargin
            ),
            tagStackView.leadingAnchor.constraint(
                equalTo: baseView.leadingAnchor,
                constant: tagStackViewLayoutConstant.leadingMargin
            ),
            tagStackView.widthAnchor.constraint(
                equalToConstant: tagStackViewLayoutConstant.width
            ),
            tagStackView.heightAnchor.constraint(
                equalToConstant: tagStackViewLayoutConstant.height
            )
        ])
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: self.tagStackView.bottomAnchor,
                constant: descriptionLabelLayoutConstant.topMargin
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: descriptionLabelLayoutConstant.leadingMargin
            )
        ])
    }
    
    private func configureSelectImageView() {
        NSLayoutConstraint.activate([
            selectImageView.topAnchor.constraint(
                equalTo: self.tagStackView.bottomAnchor,
                constant: selectImageViewLayoutConstant.topMargin
            ),
            selectImageView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: selectImageViewLayoutConstant.trailingMargin
            ),
            selectImageView.heightAnchor.constraint(
                equalToConstant: selectImageViewLayoutConstant.height
            ),
            selectImageView.widthAnchor.constraint(
                equalToConstant: selectImageViewLayoutConstant.height
            )
        ])
    }
    
    private func configureLineView() {
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(
                equalTo: self.descriptionLabel.bottomAnchor,
                constant: lineViewLayoutConstant.topMargin
            ),
            lineView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: lineViewLayoutConstant.leadingMargin
            ),
            lineView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: lineViewLayoutConstant.trailingMargin
            ),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func configureButton() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(
                equalTo: lineView.bottomAnchor,
                constant: buttonLayoutConstant.topMargin
            ),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setTagViews(texts: [String]) {
        texts.forEach {
            tagStackView.addArrangedSubview(TagView(text: $0))
        }
    }
    
    func setDescriptionText(text: String) {
        self.descriptionLabel.text = text
    }
    
    func setTitleImage(image: UIImage) {
        self.titleImageView.image = image
    }
}
