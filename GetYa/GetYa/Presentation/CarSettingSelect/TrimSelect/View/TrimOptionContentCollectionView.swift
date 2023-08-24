//
//  TrimOptionCollectionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/12.
//

import UIKit

protocol TrimOptionContentCollectionViewDelegate: AnyObject {
    func touchUpCellSelectButton(trimSelectModel: TrimSelectModel)
    func touchUpLearnMoreViewButton()
}

class TrimOptionContentCollectionView: UICollectionView {
    enum Constants {
        enum Cell {
            static let spacing: CGFloat = 1
            static let height: CGFloat = CGFloat(168).scaledHeight
            static let expandedHeight: CGFloat = CGFloat(459).scaledHeight
        }
        enum HeaderView {
            static let height: CGFloat = CGFloat(52).scaledHeight
        }
    }
    
    // MARK: - Properties
    weak var trimOptionDelegate: TrimOptionContentCollectionViewDelegate?
    private(set) var selectedIndexPath: IndexPath?
    private(set) var expandedIndexPath: [IndexPath] = []
    private(set) var trimIDArray: [Int] = []
    private(set) var exteriorColorImageURLArray: [[String]] = []
    private(set) var interiorColorImageURLArray: [[String]] = []
    private(set) var optionImageURLArray: [[String]] = []
    private(set) var optionDescriptionTexts: [[String]] = []
    private(set) var titleTexts: [String] = []
    private(set) var tagTexts: [[String]] = []
    private(set) var descriptionTexts: [String] = []
    private(set) var priceValues: [Int] = []
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
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
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .GetYaPalette.gray700
        register(
            TrimOptionContentCell.self,
            forCellWithReuseIdentifier: TrimOptionContentCell.identifier)
        isScrollEnabled = false
    }
    
    private func initializeProperties() {
        trimIDArray = []
        titleTexts = []
        descriptionTexts = []
        priceValues = []
        optionDescriptionTexts = []
        optionImageURLArray = []
        exteriorColorImageURLArray = []
        interiorColorImageURLArray = []
        tagTexts = []
        selectedIndexPath = nil
        expandedIndexPath = []
    }
    
    // MARK: - Functions
    func setTrimInquery(data: TrimInquery, trimSubOptionSelectNames: [String]) {
        initializeProperties()
        data.carSpecs.forEach {
            trimIDArray.append($0.trimID)
            titleTexts.append($0.trimName)
            descriptionTexts.append($0.summary)
            priceValues.append($0.price)
            optionDescriptionTexts.append($0.basicOptionNames)
            optionImageURLArray.append($0.basicOptionImageURLArray)
            exteriorColorImageURLArray.append($0.exteriorColorImageURLArray)
            interiorColorImageURLArray.append($0.interiorColorImageURLArray)
            tagTexts.append(trimSubOptionSelectNames)
        }
        selectedIndexPath = [0, data.recommendTrimID - 1]
        reloadData()
    }
}

// MARK: - UICollectionView Delegate
extension TrimOptionContentCollectionView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionView Datasource
extension TrimOptionContentCollectionView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return titleTexts.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TrimOptionContentCell.identifier,
            for: indexPath) as? TrimOptionContentCell
        else { return UICollectionViewCell() }
        cell.delegate = self
        cell.learnMoreView.button.isSelected = expandedIndexPath.contains(indexPath)
        cell.configureDescriptionText(text: descriptionTexts[indexPath.row])
        cell.configureNameText(text: titleTexts[indexPath.row])
        cell.configureTagTexts(texts: tagTexts[indexPath.row])
        cell.configurePriceText(price: priceValues[indexPath.row])
        cell.setSelectButtonIsSelected(isSelected: indexPath == selectedIndexPath)
        cell.learnMoreView.setContentView(view: TrimOptionDetailView(
            exteriorColorArray: exteriorColorImageURLArray[indexPath.row],
            interiorColorArray: interiorColorImageURLArray[indexPath.row],
            optionImageURLArray: optionImageURLArray[indexPath.row],
            optionDescriptionTexts: optionDescriptionTexts[indexPath.row]))
        
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
        let indexPath = indexPath(for: sender)
        if selectedIndexPath != indexPath {
            visibleCells.map { $0 as? TrimOptionContentCell }.forEach {
                $0?.setSelectButtonIsSelected(isSelected: false)
            }
            selectedIndexPath = indexPath
            if let cell = sender as? TrimOptionContentCell, let selectedIndexPath {
                cell.setSelectButtonIsSelected(isSelected: true)
                let index = selectedIndexPath.row
                trimOptionDelegate?.touchUpCellSelectButton(
                    trimSelectModel: TrimSelectModel(
                        trimID: trimIDArray[index],
                        trimTag: tagTexts[index],
                        trimName: titleTexts[index],
                        trimPrice: priceValues[index]))
            }
        }
    }
    
    func touchUpLearnMoreViewButton(sender: UICollectionViewCell) {
        if let indexPath = self.indexPath(for: sender) {
            if expandedIndexPath.contains(indexPath) {
                expandedIndexPath = expandedIndexPath.filter { $0 != indexPath }
            } else {
                expandedIndexPath.append(indexPath)
            }
            
            UIView.performWithoutAnimation({
                self.collectionViewLayout.invalidateLayout()
                self.trimOptionDelegate?.touchUpLearnMoreViewButton()
            })
        }
    }
}
