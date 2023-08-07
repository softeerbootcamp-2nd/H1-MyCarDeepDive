//
//  LifeStyleViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/06.
//

import UIKit

// TODO: Cell 클릭에 따른 Button 활성화 구현

class LifeStyleViewController: UIViewController {
    // MARK: - UI Properties
    private let contentView = QuestionContentView()
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createCollectionViewLayout()
    )
    private lazy var pageControl = CommonPageControl(numberOfPages: tagTexts.count + 1)
    
    // MARK: - Properties
    private let collectionViewLayoutConstant = UILayout(topMargin: 43, height: 320)
    private let cellLayoutConstant = UILayout(height: 320, width: 278)
    private let cellSpacing: CGFloat = 8
    private let pageControlLayoutConstant = UILayout(topMargin: 32)
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
    private var selectedIndexPath: IndexPath?
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureUI()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        contentView.frame = view.frame
        contentView.configureDetail(
            descriptionText: "유사한 라이프스타일을 선택하면\n차량을 추천해 드려요.",
            partText: "라이프스타일",
            questionNumber: 1,
            questionCount: 2,
            buttonTitle: "선택 완료"
        )
        
        configureCollectionView()
        configurePageControl()
    }
    
    // MARK: - Functions
    private func createCollectionViewLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cellLayoutConstant.width, height: cellLayoutConstant.height)
        flowLayout.minimumLineSpacing = cellSpacing
        flowLayout.minimumInteritemSpacing = cellSpacing
        flowLayout.scrollDirection = .horizontal
        
        return flowLayout
    }
    
    private func setupViews() {
        view.addSubviews([
            contentView
        ])
        
        contentView.addSubviews([
            collectionView,
            pageControl
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    private func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            LifeStyleCell.self,
            forCellWithReuseIdentifier: LifeStyleCell.identifier)
        collectionView.register(
            LifeStyleDetailCell.self,
            forCellWithReuseIdentifier: LifeStyleDetailCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = false
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        let insetX = (UIScreen.main.bounds.width - cellLayoutConstant.width) / 2.0
        collectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: contentView.descriptionLabel.bottomAnchor,
                constant: collectionViewLayoutConstant.topMargin),
            collectionView.heightAnchor.constraint(
                equalToConstant: collectionViewLayoutConstant.height),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configurePageControl() {
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(
                equalTo: collectionView.bottomAnchor,
                constant: pageControlLayoutConstant.topMargin),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - UICollectionView Delegate
extension LifeStyleViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedIndexPath = indexPath
    }
}

// MARK: - UICollectionView Datasource
extension LifeStyleViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return tagTexts.count + 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if indexPath.row == tagTexts.count {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LifeStyleDetailCell.identifier,
                for: indexPath) as? LifeStyleDetailCell else {
                return UICollectionViewCell()
            }
            
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LifeStyleCell.identifier,
                for: indexPath) as? LifeStyleCell else {
                return UICollectionViewCell()
            }
            
            cell.setDescriptionText(text: descriptionTexts[indexPath.row])
            cell.setTitleImage(image: UIImage(systemName: "house")!)
            cell.setTagViews(texts: tagTexts[indexPath.row])
            cell.isSelected = indexPath == selectedIndexPath
            cell.configureByIsSelected(isSelected: cell.isSelected)
            
            return cell
        }
    }
}

// MARK: - UIScrollView Delegate
extension LifeStyleViewController {
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
            y: scrollView.contentInset.top)
    }
}
