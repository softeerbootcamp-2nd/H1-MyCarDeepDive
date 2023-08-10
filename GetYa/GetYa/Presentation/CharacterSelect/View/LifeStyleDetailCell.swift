//
//  LifeStyleLastCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/07.
//

import UIKit

class LifeStyleDetailCell: UICollectionViewCell {
    typealias Palette = UIColor.GetYaPalette
    
    // MARK: - UI Properties
    private let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = CGFloat(16).scaledWidth
        view.layer.backgroundColor = Palette.gray800.cgColor
        
        return view
    }()
    
    private let descriptionLabel = CommonLabel(
        fontType: GetYaFont.mediumBody2,
        color: Palette.gray0,
        text: "원하는 라이프스타일이 없다면?"
    )
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LifeStyleDetailImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let button = CommonButton(
        font: GetYaFont.mediumBody4.uiFont,
        buttonBackgroundColorType: .primary
    ).set {
        $0.setTitle("라이프스타일 상세 선택", for: .normal)
    }
    
    // MARK: - Properties
    static let identifier: String = "LifeStyleDetailCell"
    weak var delegate: LifeStyleCellDelegate?
    private let baseViewLayoutConstant = UILayout(topMargin: 64)
    private let descriptionLabelLayoutConstant = UILayout(topMargin: 26)
    private let imageViewLayoutConstant = UILayout(
        topMargin: 15,
        height: 108,
        width: 156)
    private let buttonLayoutConstant = UILayout(
        topMargin: 17,
        height: 40,
        width: 192)
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
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
    
    override func prepareForReuse() {
        delegate = nil
    }
    
    // MARK: - Functions
    private func setupViews() {
        addSubviews([
            baseView
        ])
        
        baseView.addSubviews([
            descriptionLabel,
            imageView,
            button
        ])
    }
    
    private func configureUI() {
        configureBaseView()
        configureDescriptionLabel()
        configureImageView()
        configureButton()
    }
    
    private func configureBaseView() {
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: baseViewLayoutConstant.topMargin),
            baseView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: baseView.topAnchor,
                constant: descriptionLabelLayoutConstant.topMargin),
            descriptionLabel.centerXAnchor.constraint(equalTo: baseView.centerXAnchor)
        ])
    }
    
    private func configureImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: imageViewLayoutConstant.topMargin),
            imageView.heightAnchor.constraint(
                equalToConstant: imageViewLayoutConstant.height),
            imageView.widthAnchor.constraint(
                equalToConstant: imageViewLayoutConstant.width),
            imageView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor)
        ])
    }
    
    private func configureButton() {
        button.addTarget(self, action: #selector(touchUpButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: buttonLayoutConstant.topMargin),
            button.heightAnchor.constraint(
                equalToConstant: buttonLayoutConstant.height),
            button.widthAnchor.constraint(
                equalToConstant: buttonLayoutConstant.width),
            button.centerXAnchor.constraint(equalTo: baseView.centerXAnchor)
        ])
    }
    
    @objc private func touchUpButton() {
        delegate?.touchUpButton(cell: self)
    }
}
