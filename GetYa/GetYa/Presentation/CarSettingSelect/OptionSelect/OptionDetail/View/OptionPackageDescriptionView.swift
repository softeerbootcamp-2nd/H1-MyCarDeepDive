//
//  OptionPackageDescriptionView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import UIKit

protocol OptionPackageDescriptionViewDelegate: AnyObject {
    func touchUpOptionSelectButton(
        _ indexPath: IndexPath?,
        isSelected: Bool)
}

final class OptionPackageDescriptionView: UIView {
    enum Constants {
        enum OptionPackageLabel {
            static let trailingMargin: CGFloat = .toScaledWidth(value: -79)
        }
        enum OptionDetailDescriptionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 4)
            static let minimumBottomMargin: CGFloat = .toScaledHeight(value: -16)
        }
        enum OptionKeywordCollectionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 28)
            static let height: CGFloat = .toScaledHeight(value: 94)
            static let itemSize: CGSize = .init(
                width: .toScaledWidth(value: 138),
                height: .toScaledHeight(value: 22))
            static let bottomMargin: CGFloat = .toScaledHeight(value: -28)
        }
        enum BottomBackgroundView {
            static let height: CGFloat = .toScaledHeight(value: 190)
        }
        enum PageControl {
            static let height: CGFloat = .toScaledWidth(value: 8)
            static let width = height
            static let bottomMargin: CGFloat = .toScaledHeight(value: -10)
        }
    }
    
    // MARK: - UI properties
    private let optionPackageLabel = CommonLabel(
        fontType: .mediumCaption1,
        color: .GetYaPalette.gray400,
        text: "패키지 준비중입니다."
    ).set {
        $0.numberOfLines = 1
        $0.alpha = 0
    }
    private let optionDetailDescriptionView = OptionDetailDescriptionAreaView(frame: .zero)
    private let bottomBackgroundView = UIView(frame: .zero).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1).cgColor
        $0.alpha = 0
    }
    private let optionKeywordCollectionView = {
        typealias Const = Constants.OptionKeywordCollectionView
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().set {
            $0.scrollDirection = .horizontal
            $0.itemSize = Const.itemSize
            $0.minimumLineSpacing = 7
        }
        return OptionKeywordCollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private var pageControl = CommonPageControl(numberOfPages: 1)
    
    // MARK: - Properties
    var isSelectedOptinoSelectButton: Bool {
        get {
            optionDetailDescriptionView.isSelectedOptinoSelectButton
        } set {
            optionDetailDescriptionView.isSelectedOptinoSelectButton = newValue
        }
    }
    
    var delegate: OptionPackageDescriptionViewDelegate?
    var currentIndexPath: IndexPath?
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    func reloadData() {
        optionKeywordCollectionView.reloadData()
    }
    
    func optionKeywordDataSource(
        dataSource: UICollectionViewDataSource?
    ) {
        optionKeywordCollectionView.dataSource = dataSource
    }
    
    func optionKeywordDelegate(
        delegate: UICollectionViewDelegate?
    ) {
        optionKeywordCollectionView.delegate = delegate
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        optionDetailDescriptionView.setOptionSelect(UIAction { [weak self] _ in
            self?.optionDetailDescriptionView.setOptionSelectButtonSelectState()
            let isSelectedButton = self?.optionDetailDescriptionView.isSelectedOptinoSelectButton ?? false
            self?.delegate?.touchUpOptionSelectButton(
                self?.currentIndexPath,
                isSelected: isSelectedButton)
        })
        setupUI()
    }
    
    func setPageControlSelectedPage(currentPage: Int) {
        pageControl.currentPage = currentPage
    }
    
    func setKeywordCollectionViewSelected(_ indexPath: IndexPath) {
        guard let cell = optionKeywordCollectionView.cellForItem(
            at: indexPath
        ) as? OptionDetailKeywordCell else { return }
        cell.setLabelColor()
    }
    
    // MARK: - Functions
    func configure(
        pages: Int?,
        packageTitle: String?,
        title: String?,
        price: String?,
        description: String?,
        indexPath: IndexPath?
    ) {
        optionPackageLabel.alpha = 1
        optionPackageLabel.text = packageTitle
        setPageCount(with: pages)
        setOptionDetailDescriptionView(title: title, price: price, description: description)
        self.currentIndexPath = indexPath
    }
    
    private func setOptionDetailDescriptionView(
        title: String?,
        price: String?,
        description: String?
    ) {
        optionDetailDescriptionView.configure(
            optionTitle: title,
            optionPrice: price,
            optionDescription: description)
    }
    
    private func setPageCount(with pages: Int?) {
        pageControl.numberOfPages = pages ?? 0
    }
    
    func configureFirstSetting() {
        optionKeywordCollectionView.selectItem(
            at: IndexPath(item: 0, section: 0),
            animated: false,
            scrollPosition: .left)
        setPageControlSelectedPage(currentPage: 0)
        bottomBackgroundView.alpha = 1
    }
}

// MARK: - LayoutSupportable
extension OptionPackageDescriptionView: LayoutSupportable {
    func setupViews() {
        addSubviews([
            optionPackageLabel,
            optionDetailDescriptionView,
            bottomBackgroundView,
            optionKeywordCollectionView,
            pageControl])
    }
    
    func setupConstriants() {
        configureOptionPackageLabel()
        configureOptionDetailDescriptionView()
        configureBottomBackgroundView()
        configureOptionKeywordCollectionView()
        configurePageControl()
        configureSubviewsContentPriority()
    }
    
    // MARK: - LayoutSupport private functions
    private func configureOptionPackageLabel() {
        NSLayoutConstraint.activate([
            optionPackageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionPackageLabel.topAnchor.constraint(equalTo: topAnchor),
            optionPackageLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            optionPackageLabel.heightAnchor.constraint(equalToConstant: GetYaFont.mediumCaption1.lineHeight)])
    }
    
    private func configureOptionDetailDescriptionView() {
        typealias Const = Constants.OptionDetailDescriptionView
        NSLayoutConstraint.activate([
            optionDetailDescriptionView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            optionDetailDescriptionView.topAnchor.constraint(
                equalTo: optionPackageLabel.bottomAnchor,
                constant: Const.topMargin),
            optionDetailDescriptionView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            optionDetailDescriptionView.bottomAnchor.constraint(
                lessThanOrEqualTo: bottomBackgroundView.topAnchor,
                constant: Const.minimumBottomMargin)])
    }
    
    private func configureBottomBackgroundView() {
        typealias Const = Constants.BottomBackgroundView
        typealias BaseViewConst = BaseOptionDetailRoundView.Constants.ContentView
        let upperViewLeadingMargin = -BaseViewConst.leadingMargin
        let upperViewTrailingMargin = -BaseViewConst.trailingMargin
        let upperViewBottomMargin = -BaseViewConst.bottomMargin
        NSLayoutConstraint.activate([
            bottomBackgroundView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: upperViewLeadingMargin),
            bottomBackgroundView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: upperViewTrailingMargin),
            bottomBackgroundView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: upperViewBottomMargin),
            bottomBackgroundView.heightAnchor.constraint(equalToConstant: Const.height)])
    }
    
    private func configureOptionKeywordCollectionView() {
        typealias Const = Constants.OptionKeywordCollectionView
        NSLayoutConstraint.activate([
            optionKeywordCollectionView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            optionKeywordCollectionView.topAnchor.constraint(
                equalTo: bottomBackgroundView.topAnchor,
                constant: Const.topMargin),
            optionKeywordCollectionView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            optionKeywordCollectionView.bottomAnchor.constraint(
                equalTo: pageControl.topAnchor,
                constant: Const.bottomMargin)])
    }
    
    private func configurePageControl() {
        typealias Const = Constants.PageControl
        typealias BaseViewConst = BaseOptionDetailRoundView.Constants.ContentView
        let upperViewLeadingMargin = -BaseViewConst.leadingMargin
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: upperViewLeadingMargin),
            pageControl.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            pageControl.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Const.bottomMargin),
            pageControl.heightAnchor.constraint(equalToConstant: Const.height)])
    }
    
    private func configureSubviewsContentPriority() {
        optionPackageLabel.setContentHuggingPriority(.init(251), for: .vertical)
        optionDetailDescriptionView.setContentHuggingPriority(.init(250), for: .vertical)
        bottomBackgroundView.setContentHuggingPriority(.init(250), for: .vertical)
    }
}
