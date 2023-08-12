//
//  TrimOptionCollectionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/12.
//

import UIKit

class TrimOptionContentCollectionView: UICollectionView {
    enum Constants {
        enum Cell {
            static let spacing: CGFloat = 1
            static let height: CGFloat = CGFloat(168).scaledHeight
            static let expandedHeight: CGFloat = CGFloat(459).scaledHeight
        }
    }
    
    // MARK: - Properties
    private(set) var selectedIndexPath: IndexPath?
    private(set) var expandedIndexPath: [IndexPath] = []
    
    // TODO: - 이 부분은 모델로 짜여질 예정
    private(set) var exteriorColors: [UIColor] = []
    private(set) var interiorColors: [UIColor] = []
    private(set) var optionImages: [UIImage?] = []
    private(set) var optionDescriptionTexts: [String] = []
    
    // TODO: - 이 부분은 모델로 짜여질 예정
    private(set) var titleTexts: [String] = []
    private(set) var tagTexts: [[String]] = []
    private(set) var descriptionTexts: [String] = []
    private(set) var priceValues: [Int] = []
    
    // MARK: - Lifecycles
    init(
        titleTexts: [String],
        tagTexts: [[String]],
        descriptionTexts: [String],
        priceValues: [Int]
    ) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        configureUI()
        setTitleTexts(texts: titleTexts)
        setTagTexts(texts: tagTexts)
        setDescriptionTexts(texts: descriptionTexts)
        setPrice(values: priceValues)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureUI()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        self.delegate = self
        self.dataSource = self
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .GetYaPalette.gray700
        self.register(
            TrimOptionContentCell.self,
            forCellWithReuseIdentifier: TrimOptionContentCell.identifier)
    }
    
    // MARK: - Functions    
    func setTitleTexts(texts: [String]) {
        self.titleTexts = texts
    }
    
    func setTagTexts(texts: [[String]]) {
        self.tagTexts = texts
    }
    
    func setDescriptionTexts(texts: [String]) {
        self.descriptionTexts = texts
    }
    
    func setPrice(values: [Int]) {
        self.priceValues = values
    }
}

// MARK: - UICollectionView Delegate
extension TrimOptionContentCollectionView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionView Datasource
extension TrimOptionContentCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleTexts.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TrimOptionContentCell.identifier,
            for: indexPath) as? TrimOptionContentCell else { return UICollectionViewCell() }
        cell.configureDescriptionText(text: descriptionTexts[indexPath.row])
        cell.configureNameText(text: titleTexts[indexPath.row])
        cell.configureTagTexts(texts: tagTexts[indexPath.row])
        cell.configurePriceText(price: priceValues[indexPath.row])
        cell.isSelected = indexPath == selectedIndexPath
        cell.learnMoreView.button.isSelected = expandedIndexPath.contains(indexPath)
        cell.delegate = self
        
        //TODO: 서버에서 받아온 데이터로 처리해야함
        cell.learnMoreView.setContentView(view: TrimOptionDetailView(
            exteriorColorArray: [.red, .black, .blue],
            interiorColorArray: [.orange],
            optionImages: [UIImage(systemName: "house"), UIImage(systemName: "person"), UIImage(systemName: "sun.min")],
            optionDescriptionTexts: ["20인치 알로이 휠", "12.3인치 클러스터(컬러 LCD)", "서라운드 뷰 모니터"]))
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate FlowLayout
extension TrimOptionContentCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constants.Cell.spacing
    }
    
    // TODO: 기본 옵션의 개수가 4개 이상 넘어가면 크기 로직 짜야함
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if expandedIndexPath.contains(indexPath) {
            return CGSize(
                width: frame.width,
                height: Constants.Cell.expandedHeight)
        } else {
            return CGSize(
                width: frame.width,
                height: Constants.Cell.height)
        }
    }
}

// MARK: - TrimOptionContentCell Delegate
extension TrimOptionContentCollectionView: TrimOptionContentCellDelegate {
    func touchUpSelectButton(sender: UICollectionViewCell) {
        if let indexPath = self.indexPath(for: sender) {
            if expandedIndexPath.contains(indexPath) {
                expandedIndexPath = expandedIndexPath.filter { $0 != indexPath }
            } else {
                expandedIndexPath.append(indexPath)
            }
            UIView.performWithoutAnimation({
                self.reloadItems(at: [indexPath])
            })
        }
    }
}
