//
//  TagViewCell.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/17.
//

import UIKit

final class TagViewCell: UICollectionViewCell {
    static let identifier: String = "TagViewCell"
    enum Constants {
        enum TagView {
            static let height: CGFloat = .toScaledHeight(value: 28)
            static let innerTextLeadingMargin: CGFloat = .toScaledWidth(value: 12)
            static let innerTextTrailingMargin: CGFloat = .toScaledWidth(value: 12)
        }
    }
    
    // MARK: - UI properties
    private let tagLabel = CommonPaddingLabel(
        padding: UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10),
        fontType: .custom(
            size: 12,
            kern: -0.5,
            lineHeight: 16,
            nameType: .boldText),
        color: .GetYaPalette.gray300
    ).set {
        $0.layer.cornerRadius = .toScaledWidth(value: 14)
        $0.layer.borderWidth = .toScaledWidth(value: 1)
        $0.layer.borderColor = UIColor.GetYaPalette.gray600.cgColor
    }
      
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure(with: "")
    }
    
    // MARK: - Functions
    func configure(with keyword: String) {
        tagLabel.text = keyword
    }
}

// MARK: - LayoutSupportable
extension TagViewCell: LayoutSupportable {
    func setupViews() {
        contentView.addSubview(tagLabel)
    }
    
    func setupConstriants() {
        configureTagView()
    }
    
    private func configureTagView() {
        typealias Const = Constants.TagView
        NSLayoutConstraint.activate([
            tagLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            tagLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            tagLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            tagLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor),
            tagLabel.heightAnchor.constraint(
                greaterThanOrEqualToConstant: Const.height)])
    }
}
