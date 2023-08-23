//
//  OptionDetailKeywordCell.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/23.
//

import UIKit

final class OptionDetailKeywordCell: UICollectionViewCell {
    static let identifier = "OptionDetailKeywordCell"
    
    // MARK: - UI properties
    private let keywordLabel = CommonLabel(
        fontType: .custom(size: 14, kern: -0.2, lineHeight: 22, nameType: .mediumText),
        color: .GetYaPalette.gray400,
        text: "준비중입니다..")
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    // MARK: - Private functions
    private func configureUI() {
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        keywordLabel.textColor = .GetYaPalette.gray400
    }
    
    // MARK: - Functions
    func configure(_ text: String?) {
        keywordLabel.text = text
    }
    
    func setLabelColor() {
        keywordLabel.textColor = .GetYaPalette.acriveBlue
    }
}

// MARK: - LayoutSupportable
extension OptionDetailKeywordCell: LayoutSupportable {
    func setupViews() {
        contentView.addSubview(keywordLabel)
    }
    
    func setupConstriants() {
        NSLayoutConstraint.activate([
            keywordLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            keywordLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: contentView.trailingAnchor),
            keywordLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            keywordLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
}
