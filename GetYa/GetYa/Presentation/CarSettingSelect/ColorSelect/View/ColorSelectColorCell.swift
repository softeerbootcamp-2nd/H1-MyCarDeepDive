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
        enum SelectedImageView {
            static let height: CGFloat = .toScaledHeight(value: 24)
            static let width: CGFloat = .toScaledHeight(value: 24)
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
    }
    private let selectedView: UIView = UIView().set {
        $0.isHidden = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .GetYaPalette.primary.withAlphaComponent(0.5)
    }
    private lazy var selectedImageView: UIImageView = UIImageView(
        image: UIImage(named: "White-Check-Circle")
    ).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        selectedView.addSubview($0)
    }
    
    // MARK: - Properties
    static let identifier = "ColorSelectColorCell"
    override var isSelected: Bool {
        didSet {
            selectedView.isHidden = !isSelected
        }
    }
    
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
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            contentImageView,
            tagView,
            selectedView
        ])
    }
    
    private func configureUI() {
        clipsToBounds = true
        layer.cornerRadius = CGFloat(4).scaledHeight
        
        configureTagView()
        configureContentImageView()
        configureSelectedView()
        configureSelectedImageView()
    }
    
    private func configureTagView() {
        NSLayoutConstraint.activate([
            tagView.topAnchor.constraint(equalTo: topAnchor),
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagView.heightAnchor.constraint(equalToConstant: Constatns.TagView.height),
            tagView.widthAnchor.constraint(equalToConstant: Constatns.TagView.width)
        ])
    }
    
    private func configureContentImageView() {
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(equalTo: topAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureSelectedView() {
        NSLayoutConstraint.activate([
            selectedView.topAnchor.constraint(equalTo: topAnchor),
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
    
    // MARK: - Functions
    func setImage(image: UIImage?) {
        contentImageView.image = image
    }
    
    func setExteriorTagViewIsHidden(number: Int, isHidden: Bool) {
        tagView.text = "Top \(number)"
        tagView.isHidden = isHidden
    }
    
    func setInteriorTagViewIsHidden(isHidden: Bool) {
        tagView.text = "Best"
        tagView.isHidden = isHidden
    }
    
    // MARK: - Objc Functions
}
