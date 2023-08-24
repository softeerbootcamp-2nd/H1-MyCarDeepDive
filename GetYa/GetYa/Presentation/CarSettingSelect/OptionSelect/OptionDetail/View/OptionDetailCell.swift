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
        get {
            optionPackageView.isSelectedOptinoSelectButton
        } set {
            optionPackageView.isSelectedOptinoSelectButton = newValue
        }
    }
    private lazy var optionTitles: [String?] = []
    private var currentIndexPath: IndexPath?
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        optionPackageView.isSelectedOptinoSelectButton = false
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        setupUI()
    }
    
    // MARK: - Functions
    
    func configure(
        baseOptionContainerViewDelegate: BaseOptionDetailRoundViewDelegate?,
        optionSelectedDelegate: OptionPackageDescriptionViewDelegate?
    ) {
        baseOptionContainerView.delegate = baseOptionContainerViewDelegate
        optionPackageView.delegate = optionSelectedDelegate
    }
    
    func configure(
        optionPackageKeywordDelegate: UICollectionViewDelegate?
    ) {
        optionPackageView.optionKeywordDelegate(
            delegate: optionPackageKeywordDelegate)
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
        description: String?,
        indexPath: IndexPath?
    ) {
        optionPackageView.configure(
            pages: pages,
            packageTitle: packageTitle,
            title: title,
            price: price,
            description: description,
            indexPath: indexPath)
    }
    
    func configureKeywordCollectionView(
        _ titles: [String],
        currentIndexPath: IndexPath?
    ) {
        optionTitles = titles
        self.currentIndexPath = currentIndexPath
        optionPackageView.optionKeywordDataSource(dataSource: self)
        optionPackageView.reloadData()
    }
    
    func configureFirstSetting() {
        optionPackageView.configureFirstSetting()
    }
    
    func setPageControlSelectedPage(currentPage: Int) {
        optionPackageView.setPageControlSelectedPage(currentPage: currentPage)
    }
    
    func setKeywordCellSelected(indexPath: IndexPath) {
        optionPackageView.setKeywordCollectionViewSelected(indexPath)
    }
}

extension OptionDetailCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return optionTitles.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OptionDetailKeywordCell.identifier,
            for: indexPath
        ) as? OptionDetailKeywordCell,
              let currentIndexPath = currentIndexPath
        else { return .init(frame: .zero) }
        cell.configure(optionTitles[indexPath.row])
        if currentIndexPath == indexPath {
            cell.setLabelColor()
        }
        return cell
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
