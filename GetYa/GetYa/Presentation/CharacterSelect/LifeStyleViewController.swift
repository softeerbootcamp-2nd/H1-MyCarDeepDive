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
        collectionViewLayout: configureCollectionViewLayout()
    )
    private lazy var pageControl = CommonPageControl(numberOfPages: tagTexts.count)
    
    // MARK: - Properties
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

        view.backgroundColor = .white
        
        view.addSubviews([collectionView, pageControl])
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LifeStyleCell.self, forCellWithReuseIdentifier: LifeStyleCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = false
        collectionView.decelerationRate = .fast
        let insetX = (UIScreen.main.bounds.width - 278) / 2.0
        collectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
        
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 320),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 32),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Functions
    func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 278, height: 320)
        flowLayout.minimumLineSpacing = 8
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.scrollDirection = .horizontal
        
        return flowLayout
    }
}

extension LifeStyleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagTexts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
        let cellWidth: CGFloat = 278 + 8
        let index = round(scrolledOffsetX / cellWidth)
        pageControl.currentPage = Int(index)
        targetContentOffset.pointee = CGPoint(
            x: index * cellWidth - scrollView.contentInset.left,
            y: scrollView.contentInset.top
        )
    }
}
