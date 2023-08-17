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
            static let height: CGFloat = UILayout.init(height: 28).height
            static let innerTextLeadingMargin: CGFloat = .toScaledWidth(value: 12)
            static let innerTextTrailingMargin: CGFloat = .toScaledWidth(value: 12)
        }
    }
    
    // MARK: - UI properties
    private let tagView = TagView(text: "키워드").set {
        typealias Const = Constants.TagView
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.configureCornerRadius(with: CGFloat.toScaledWidth(value: 14))
        $0.configureBorderWidth(with: CGFloat.toScaledWidth(value: 1))
        $0.configureBorderColor(with: .GetYaPalette.gray600)
        $0.configureLabelFont(with: UIFont.systemFont(ofSize: 12, weight: .semibold))
        $0.configureTextColor(with: .GetYaPalette.gray300)
        $0.configureBackgroundColor(color: .none)
        $0.configureTextLabelLeadingMargin(with: Const.innerTextLeadingMargin)
        $0.configureTextLabeltrailingMargin(with: Const.innerTextTrailingMargin)
        $0.sizeToFit()
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
        tagView.configureLabelText(text: keyword)
    }
}

// MARK: - LayoutSupportable
extension TagViewCell: LayoutSupportable {
    func setupViews() {
        contentView.addSubview(tagView)
    }
    
    func setupConstriants() {
        configureTagView()
    }
    
    private func configureTagView() {
        typealias Const = Constants.TagView
        NSLayoutConstraint.activate([
            tagView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            tagView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            tagView.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            tagView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor),
            tagView.heightAnchor.constraint(
                greaterThanOrEqualToConstant: Const.height)])
    }
}
