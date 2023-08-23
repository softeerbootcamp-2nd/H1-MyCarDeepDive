//
//  OptionDetailCell.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import UIKit

final class OptionDetailCell: UICollectionViewCell {
    static let identifier: String = "OptionDetailCell"
    // MARK: - UI properties
    private var optionPackageView: OptionPackageDescriptionView!
    private lazy var baseOptionContainerView: BaseOptionDetailRoundView = {
        let contentView = OptionPackageDescriptionView(frame: .zero)
        optionPackageView = contentView
        let baseView = BaseOptionDetailRoundView(contentView: contentView)
        return baseView
    }()
    
    // MARK: - Properties
    var isSelectedOkButton: Bool {
        optionPackageView.isSelectedOptinoSelectButton
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        setupUI()
    }
    
    // MARK: - Functions
    func configure(
        baseOptionContainerViewDelegate: BaseOptionDetailRoundViewDelegate?,
        optionPackageKeywordDelegator: (
            UICollectionViewDataSource & UICollectionViewDelegate)?
    ) {
        baseOptionContainerView.delegate = baseOptionContainerViewDelegate
        optionPackageView.configureOptionKeyordCollectionView(from: optionPackageKeywordDelegator)
    }
    
    func configureBaseOptionView(
        image: UIImage?,
        closeButtonAlpha: CGFloat?
    ) {
        baseOptionContainerView.configure(
            image: image,
            closeButtonAlpha: closeButtonAlpha)
    }
    
    func configure(
        pages: Int?,
        packageTitle: String?,
        title: String?,
        price: String?,
        description: String?
    ) {
        optionPackageView.configure(
            pages: pages,
            packageTitle: packageTitle,
            title: title,
            price: price,
            description: description)
    }
    
    func configureFirstSetting() {
        optionPackageView.configureFirstSetting()
    }
}

// MARK: - LayoutSupportable
extension OptionDetailCell: LayoutSupportable {
    func setupViews() {
        contentView.addSubview(baseOptionContainerView)
    }
    
    func setupConstriants() {
        NSLayoutConstraint.activate([
            baseOptionContainerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            baseOptionContainerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            baseOptionContainerView.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            baseOptionContainerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor)])
    }
}
