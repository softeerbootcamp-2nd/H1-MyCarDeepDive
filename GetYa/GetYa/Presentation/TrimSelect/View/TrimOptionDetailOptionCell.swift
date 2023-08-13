//
//  TrimOptionDetailOptionCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/12.
//

import UIKit

class TrimOptionDetailOptionCell: UICollectionViewCell {
    enum Constants {
        enum ImageView {
            static let height = CGFloat(80).scaledHeight
        }
        enum Label {
            static let topMargin = CGFloat(8).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let imageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = CGFloat(4).scaledHeight
    }
    private let label = CommonLabel(
        fontType: .regularCaption1,
        color: .GetYaPalette.gray100)
    
    // MARK: - Properties
    static let identifier = "TrimOptionDetailOptionCell"
    
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
            imageView,
            label
        ])
    }
    
    private func configureUI() {
        backgroundColor = .white
        
        configureImageView()
        configureLabel()
    }
    
    private func configureImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(
                equalToConstant: Constants.ImageView.height)
        ])
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Constants.Label.topMargin),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func setImage(image: UIImage?) {
        imageView.image = image
    }
    
    func setText(text: String) {
        label.text = text
    }
    
    // MARK: - Objc Functions
}
