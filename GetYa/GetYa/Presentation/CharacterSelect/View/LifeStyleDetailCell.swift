//
//  LifeStyleLastCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/07.
//

import UIKit

class LifeStyleDetailCell: UICollectionViewCell {
    typealias Palette = UIColor.GetYaPalette
    
    enum Constants {
        enum BaseView {
            static let topMargin: CGFloat = .toScaledHeight(value: 64)
        }
        enum DescriptionLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 26)
        }
        enum ImageView {
            static let topMargin: CGFloat = .toScaledHeight(value: 15)
            static let height: CGFloat = .toScaledHeight(value: 108)
            static let width: CGFloat = .toScaledWidth(value: 156)
        }
        enum Button {
            static let topMargin: CGFloat = .toScaledHeight(value: 17)
            static let height: CGFloat = .toScaledHeight(value: 40)
            static let width: CGFloat = .toScaledWidth(value: 192)
        }
    }
    
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
        typealias Const = Constants.BaseView
        
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: Const.topMargin),
            baseView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureDescriptionLabel() {
        typealias Const = Constants.DescriptionLabel
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: baseView.topAnchor,
                constant: Const.topMargin),
            descriptionLabel.centerXAnchor.constraint(equalTo: baseView.centerXAnchor)
        ])
    }
    
    private func configureImageView() {
        typealias Const = Constants.ImageView
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Const.topMargin),
            imageView.heightAnchor.constraint(
                equalToConstant: Const.height),
            imageView.widthAnchor.constraint(
                equalToConstant: Const.width),
            imageView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor)
        ])
    }
    
    private func configureButton() {
        typealias Const = Constants.Button
        
        button.addTarget(self, action: #selector(touchUpButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Const.topMargin),
            button.heightAnchor.constraint(
                equalToConstant: Const.height),
            button.widthAnchor.constraint(
                equalToConstant: Const.width),
            button.centerXAnchor.constraint(equalTo: baseView.centerXAnchor)
        ])
    }
    
    @objc private func touchUpButton() {
        delegate?.touchUpButton(cell: self)
    }
}
