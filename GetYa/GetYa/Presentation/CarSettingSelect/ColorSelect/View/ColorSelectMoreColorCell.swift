//
//  ColorSelectMoreColorCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/16.
//

import UIKit

class ColorSelectMoreColorCell: UICollectionViewCell {
    enum Constants {
        enum NameLabel {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 7)
            static let height: CGFloat = .toScaledHeight(value: 14)
        }
        enum ImageView {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
        }
    }
    
    // MARK: - UI properties
    private let nameLabel = CommonLabel(
        fontType: .custom(size: 11,
                          kern: -0.24,
                          lineHeight: 14,
                          nameType: .mediumText),
        color: .GetYaPalette.acriveBlue
    ).set {
        $0.textAlignment = .center
    }
    private let imageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = CGFloat(4).scaledHeight
        $0.clipsToBounds = true
    }
    
    // MARK: - Properties
    static let identifier = "ColorSelectMoreColorCell"
    
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
            nameLabel,
            imageView
        ])
    }
    
    private func configureUI() {
        configureNameLabel()
        configureImageView()
    }
    
    private func configureNameLabel() {
        let const = Constants.NameLabel.self
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin),
            nameLabel.heightAnchor.constraint(equalToConstant: const.height)
        ])
    }
    
    private func configureImageView() {
        let const = Constants.ImageView.self
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: const.topMargin),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func setImageAndName(name: String, imageURL: String) {
        nameLabel.text = name
        imageView.setImage(urlString: imageURL)
    }
}
