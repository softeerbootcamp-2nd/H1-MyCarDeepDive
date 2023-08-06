//
//  LifeStyleViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/06.
//

import UIKit

class LifeStyleViewController: UIViewController {
    // MARK: - UI Properties
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createCollectionViewLayout()
    )
    private lazy var pageControl = CommonPageControl(numberOfPages: tagTexts.count)
    private let button = CommonButton(
        font: GetYaFont.mediumBody3.uiFont,
        buttonBackgroundColorType: .primary,
        title: "선택 완료"
    )
    private let descriptionLabel = CommonLabel(
        font: GetYaFont.regularHead2.uiFont,
        color: .GetYaPalette.gray0,
        text: "유사한 라이프스타일을 선택하면\n차량 조합을 추천해 드려요."
    )
    
    // MARK: - Properties
    private let collectionViewLayoutConstant = UILayout(topMargin: 43, height: 320)
    private let cellLayoutConstant = UILayout(height: 320, width: 278)
    private let cellSpacing: CGFloat = 8
    private let descriptionLabelLayoutConstant = UILayout(leadingMargin: 16, topMargin: 29)
    private let pageControlLayoutConstant = UILayout(topMargin: 32)
    private let buttonLayoutConstant = UILayout(
        leadingMargin: 17,
        trailingMargin: -17,
        bottomMargin: -32,
        height: 52
    )
    let descriptionTexts: [String] = [
        "가족과 함께 타서 안전을\n중시해요",
        "매일 출퇴근하여 경제적이고\n편안한 주행을 원해요",
        "운전 경력이 짧아\n똑똑한 주행을 원해요",
        "트렌드에 민감해\n디자인과 성능이 중요해요"
    ]
    let tagTexts: [[String]] = [
        ["#주행안전", "#사용편의"],
        ["#사용편의", "#추위/더위"],
        ["#주행안전", "#주차/출차"],
        ["#스타일", "#퍼포먼스"]
    ]
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureUI()
    }
    
    // MARK: - Functions
    func createCollectionViewLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cellLayoutConstant.width, height: cellLayoutConstant.height)
        flowLayout.minimumLineSpacing = cellSpacing
        flowLayout.minimumInteritemSpacing = cellSpacing
        flowLayout.scrollDirection = .horizontal
        
        return flowLayout
    }
    
    private func setupViews() {
        view.addSubviews([
            descriptionLabel,
            collectionView,
            pageControl,
            button
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        configureDescriptionLabel()
        configureCollectionView()
        configurePageControl()
        configureButton()
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: descriptionLabelLayoutConstant.topMargin
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: descriptionLabelLayoutConstant.leadingMargin
            )
        ])
    }
    
    private func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            LifeStyleCell.self,
            forCellWithReuseIdentifier: LifeStyleCell.identifier
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = false
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        let insetX = (UIScreen.main.bounds.width - cellLayoutConstant.width) / 2.0
        collectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: collectionViewLayoutConstant.topMargin
            ),
            collectionView.heightAnchor.constraint(
                equalToConstant: collectionViewLayoutConstant.height
            ),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configurePageControl() {
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(
                equalTo: collectionView.bottomAnchor,
                constant: pageControlLayoutConstant.topMargin
            ),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureButton() {
        button.isEnabled = false
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: buttonLayoutConstant.leadingMargin
            ),
            button.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: buttonLayoutConstant.trailingMargin
            ),
            button.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: buttonLayoutConstant.bottomMargin
            ),
            button.heightAnchor.constraint(equalToConstant: buttonLayoutConstant.height)
        ])
    }
}

extension LifeStyleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return tagTexts.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LifeStyleCell.identifier,
            for: indexPath
        ) as? LifeStyleCell else {
            return UICollectionViewCell()
        }
        
        cell.setDescriptionText(text: descriptionTexts[indexPath.row])
        cell.setTitleImage(image: UIImage(systemName: "house")!)
        cell.setTagViews(texts: tagTexts[indexPath.row])
        
        return cell
    }
    
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth: CGFloat = cellLayoutConstant.width + cellSpacing
        let index = round(scrolledOffsetX / cellWidth)
        pageControl.currentPage = Int(index)
        targetContentOffset.pointee = CGPoint(
            x: index * cellWidth - scrollView.contentInset.left,
            y: scrollView.contentInset.top
        )
    }
}
