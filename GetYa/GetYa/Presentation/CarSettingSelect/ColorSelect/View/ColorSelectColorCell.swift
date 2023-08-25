//
//  ColorSelectColorCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/15.
//

import UIKit

class ColorSelectColorCell: UICollectionViewCell {
    enum Constatns {
        enum TagView {
            static let inset = UIEdgeInsets(
                top: .toScaledHeight(value: 1),
                left: .toScaledWidth(value: 7),
                bottom: .toScaledHeight(value: 1),
                right: .toScaledWidth(value: 4))
            static let height: CGFloat = .toScaledHeight(value: 20)
            static let width: CGFloat = .toScaledHeight(value: 40)
        }
        enum ContentImageView {
            static let topMargin: CGFloat = .toScaledHeight(value: 12.5)
        }
        enum SelectedImageView {
            static let height: CGFloat = .toScaledHeight(value: 24)
            static let width: CGFloat = .toScaledHeight(value: 24)
        }
        enum ExclamationmarkImageView {
            static let height: CGFloat = .toScaledHeight(value: 25)
            static let width: CGFloat = .toScaledHeight(value: 25)
        }
    }
    
    // MARK: - UI properties
    private let tagView = CommonPaddingLabel(
        padding: Constatns.TagView.inset,
        fontType: .mediumCaption1,
        color: .GetYaPalette.gray1000
    ).set {
        $0.layer.backgroundColor = UIColor.GetYaPalette.gray300.cgColor
        $0.layer.cornerRadius = CGFloat(4).scaledHeight
        $0.layer.maskedCorners = [.layerMaxXMaxYCorner]
        $0.isHidden = true
    }
    private let contentImageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = CGFloat(4).scaledHeight
        $0.clipsToBounds = true
    }
    private let selectedView: UIView = UIView().set {
        $0.isHidden = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .GetYaPalette.primary.withAlphaComponent(0.5)
        $0.layer.cornerRadius = CGFloat(4).scaledHeight
        $0.clipsToBounds = true
    }
    private lazy var selectedImageView: UIImageView = UIImageView(
        image: UIImage(named: "White-Check-Circle")
    ).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        selectedView.addSubview($0)
    }
    private let exclamationmarkImageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        let config = UIImage.SymbolConfiguration(paletteColors: [
            .white,
            .GetYaPalette.gray500
        ])
        $0.image = UIImage(systemName: "exclamationmark.circle.fill")?
            .applyingSymbolConfiguration(config)
        $0.isHidden = true
    }
    
    // MARK: - Properties
    static let identifier = "ColorSelectColorCell"
    
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
        
        isSelected = false
        contentImageView.image = nil
        tagView.isHidden = true
        selectedView.isHidden = true
        exclamationmarkImageView.isHidden = true
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            contentImageView,
            tagView,
            selectedView,
            exclamationmarkImageView
        ])
    }
    
    private func configureUI() {
        configureTagView()
        configureContentImageView()
        configureSelectedView()
        configureSelectedImageView()
        configureExclamationmarkImageView()
    }
    
    private func configureTagView() {
        NSLayoutConstraint.activate([
            tagView.topAnchor.constraint(equalTo: contentImageView.topAnchor),
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagView.heightAnchor.constraint(equalToConstant: Constatns.TagView.height),
            tagView.widthAnchor.constraint(equalToConstant: Constatns.TagView.width)
        ])
    }
    
    private func configureContentImageView() {
        typealias Const = Constatns.ContentImageView
        
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            contentImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureSelectedView() {
        NSLayoutConstraint.activate([
            selectedView.topAnchor.constraint(equalTo: contentImageView.topAnchor),
            selectedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectedView.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectedView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureSelectedImageView() {
        NSLayoutConstraint.activate([
            selectedImageView.centerYAnchor.constraint(equalTo: selectedView.centerYAnchor),
            selectedImageView.centerXAnchor.constraint(equalTo: selectedView.centerXAnchor),
            selectedImageView.heightAnchor.constraint(
                equalToConstant: Constatns.SelectedImageView.height),
            selectedImageView.widthAnchor.constraint(
                equalToConstant: Constatns.SelectedImageView.width)
        ])
    }
    
    private func configureExclamationmarkImageView() {
        typealias Const = Constatns.ExclamationmarkImageView
        
        NSLayoutConstraint.activate([
            exclamationmarkImageView.centerYAnchor.constraint(equalTo: contentImageView.topAnchor),
            exclamationmarkImageView.centerXAnchor.constraint(equalTo: contentImageView.trailingAnchor),
            exclamationmarkImageView.heightAnchor.constraint(equalToConstant: Const.height),
            exclamationmarkImageView.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    // MARK: - Functions
    func setImageURL(imageURL: String, isAvailable: Bool) {
        contentImageView.setImage(urlString: imageURL)
        exclamationmarkImageView.isHidden = isAvailable
    }
    
    func setExteriorTagViewIsHidden(number: Int, isHidden: Bool) {
        tagView.text = "Top \(number)"
        tagView.isHidden = isHidden
    }
    
    func setInteriorTagViewIsHidden(isHidden: Bool) {
        tagView.text = "Best"
        tagView.isHidden = isHidden
    }
    
    func setSelectedImageViewIsHidden(isHidden: Bool) {
        selectedView.isHidden = isHidden
    }
    
    // MARK: - Objc Functions
}
