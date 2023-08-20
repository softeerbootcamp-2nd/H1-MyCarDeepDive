//
//  OptionPackageDescriptionView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import UIKit

final class OptionPackageDescriptionView: UIView {
    enum Constants {
        enum OptionPackageLabel {
            static let trailingMargin: CGFloat = .toScaledWidth(value: -79)
        }
        enum OptionDetailDescriptionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 4)
            static let maximumHeight: CGFloat = OptionDetailDescriptionAreaView
                .Constants
                .maximumHeight
        }
        enum OptionTitleCollectionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 28)
            static let height: CGFloat = .toScaledHeight(value: 94)
        }
        
        enum PageControl {
            static let topMargin: CGFloat = .toScaledHeight(value: 28)
            static let height: CGFloat = .toScaledWidth(value: 8)
            static let width = height
        }
        
    }
    // MARK: - UI properties
    private let optionPackageLabel = CommonLabel(
        fontType: .mediumCaption1,
        color: .GetYaPalette.gray400,
        text: ""
    ).set { $0.numberOfLines = 1 }
    private let optionDetailDescriptionView = OptionDetailDescriptionAreaView(frame: .zero)
    private let optionTitleCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout())
    private var pageControl = CommonPageControl(numberOfPages: 0)
    
    // MARK: - Properties

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
        translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    private func setPageControlSelectedPage(currentPage: Int) {
        pageControl.currentPage = currentPage
    }
    
    // MARK: - Functions
    func configure(
        delegator: (UICollectionViewDataSource & UICollectionViewDelegate)?,
        pages: Int?
    ) {
        setOptionTitleCollectionView(from: delegator)
        setPageCount(with: pages)
    }
    
    func setOptionTitleCollectionView(from delegator: (UICollectionViewDataSource & UICollectionViewDelegate)?) {
        optionTitleCollectionView.delegate = delegator
        optionTitleCollectionView.dataSource = delegator
    }
    
    func setPageCount(with pages: Int?) {
        pageControl.numberOfPages = pages ?? 0
    }
}

// MARK: - LayoutSupportable
extension OptionPackageDescriptionView: LayoutSupportable {
    func setupViews() {
        addSubviews([
            optionPackageLabel,
            optionDetailDescriptionView,
            optionTitleCollectionView,
            pageControl])
        
    }
    
    func setupConstriants() {
        configureOptionPackageLabel()
        configureOptionDetailDescriptionView()
        configureOptionTitleCollectionView()
        configurePageControl()
    }
    
    // MARK: - LayoutSupport private functions
    private func configureOptionPackageLabel() {
        NSLayoutConstraint.activate([
            optionPackageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionPackageLabel.topAnchor.constraint(equalTo: topAnchor),
            optionPackageLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)])
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
            optionDetailDescriptionView.heightAnchor.constraint(
                equalToConstant: Const.maximumHeight)])
    }
    
    ///이게 기본적으로 상위 뷰에서 contentView에서 leading, trailing 제약이 20씩 있어서 super.leadingAnchor로 하게된다면 어떻게 될 까...
    private func configureOptionTitleCollectionView() {
        typealias Const = Constants.OptionTitleCollectionView
        NSLayoutConstraint.activate([
            optionTitleCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionTitleCollectionView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            optionTitleCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionTitleCollectionView.heightAnchor.constraint(
                equalToConstant: Const.height)])
    }
    
    private func configurePageControl() {
        typealias Const = Constants.PageControl
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControl.topAnchor.constraint(
                equalTo: optionTitleCollectionView.bottomAnchor,
                constant: Const.topMargin),
            pageControl.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            pageControl.bottomAnchor.constraint(
                equalTo: bottomAnchor)])
    }
}
