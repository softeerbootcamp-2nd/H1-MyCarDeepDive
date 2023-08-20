//
//  OptionPackageDescriptionView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/21.
//

import UIKit

final class OptionPackageDescriptionView: UIView {
    enum Constants {
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
        text: "")
    private let optionDetailDescriptionView = OptionDetailDescriptionAreaView(frame: .zero)
    private let optionTitleCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout())
    private var pageControl = CommonPageControl(numberOfPages: 0)
    
    // MARK: - Properties

    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Functions
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
    // MARK: - Objc Functions
}
