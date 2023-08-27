//
//  OptionSelectCollectionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit

class AdditionalCollectionView: UICollectionView {
    enum Constants {
        static let categoryItemCount: Int = 7
    }
    
    enum Sections: Hashable, CaseIterable {
        case category
        case all
        case other
    }
    
    enum Items: Hashable {
        case category(type: TagCategoryType)
        case all(datum: AdditionalOption)
        case packageItem(datum: AdditionalOption)
        case other(inquery: AdditionalTagOptionInquery)
    }
    
    // MARK: - Properties
    typealias DataSource = UICollectionViewDiffableDataSource<Sections, Items>
    private var diffableDatasource: DataSource!
    private var allItemCount: Int = 0
    private var selectedCategoryIndexPath: IndexPath = [0, 0]
    private var selectedOptionIDList: [Int] = [] {
        didSet {
            NotificationCenter.default.post(
                name: NSNotification.Name("selectedOptionNotification"),
                object: nil,
                userInfo: ["optionNumbers": selectedOptionIDList])
        }
    }
    private var selectedPackageOptionIDList: [Int] = [] {
        didSet {
            NotificationCenter.default.post(
                name: NSNotification.Name("selectedPackageOptionNotification"),
                object: nil,
                userInfo: ["optionNumbers": selectedPackageOptionIDList])
        }
    }
    
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
        translatesAutoresizingMaskIntoConstraints = false
        collectionViewLayout = createCompositionalLayout()
        delegate = self
        contentInsetAdjustmentBehavior = .never
        configureCollectionViewDataSource()
        register(
            OptionSelectCategoryCell.self,
            forCellWithReuseIdentifier: OptionSelectCategoryCell.identifier)
        register(
            OptionSelectAdditionalItemCell.self,
            forCellWithReuseIdentifier: OptionSelectAdditionalItemCell.identifier)
        register(
            OptionSelectTitleHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: OptionSelectTitleHeaderView.identifier)
        register(
            OptionSelectTagItemCell.self,
            forCellWithReuseIdentifier: OptionSelectTagItemCell.identifier)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, _ ) -> NSCollectionLayoutSection? in
            
            if self.selectedCategoryIndexPath.row == 0 {
                if sectionIndex == 0 {
                    return self.configureCategoryLayout()
                } else {
                    return self.configureItemLayout()
                }
            } else {
                if sectionIndex == 0 {
                    return self.configureCategoryLayout()
                } else {
                    return self.configureOtherLayout()
                }
            }
        }
        return layout
    }
    
    private func configureCategoryLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 6),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let itemInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12)
        item.contentInsets = itemInsets
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(CGFloat(72).scaledHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let sectionInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 24, trailing: 0)
        section.contentInsets = sectionInsets
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func configureItemLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0/2),
            heightDimension: .absolute(CGFloat(232).scaledHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        item.edgeSpacing = .init(
            leading: .fixed(0),
            top: .fixed(12),
            trailing: .fixed(0),
            bottom: .fixed(12))
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(232))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 16)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(24))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func configureOtherLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func configureCollectionViewDataSource() {
        diffableDatasource = DataSource(
            collectionView: self,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                switch itemIdentifier {
                case .category(let type):
                    if let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: OptionSelectCategoryCell.identifier,
                        for: indexPath) as? OptionSelectCategoryCell {
                        cell.setType(type: type)
                        return cell
                    }
                case .all(let datum):
                    if let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: OptionSelectAdditionalItemCell.identifier,
                        for: indexPath) as? OptionSelectAdditionalItemCell {
                        cell.setData(datum: datum)
                        cell.setSelectButtonIsSelected(isSelected: self.selectedOptionIDList.contains(datum.optionID))
                        cell.addActionLearnMoreViewButton(handler: {
                            print(indexPath.row)
                        })
                        cell.addActionSelectButton(handler: {
                            if self.selectedOptionIDList.contains(datum.optionID) {
                                self.selectedOptionIDList = self.selectedOptionIDList.filter { $0 != datum.optionID }
                            } else {
                                self.selectedOptionIDList.append(datum.optionID)
                            }
                        })
                        return cell
                    }
                case .packageItem(let datum):
                    if let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: OptionSelectAdditionalItemCell.identifier,
                        for: indexPath) as? OptionSelectAdditionalItemCell {
                        cell.setData(datum: datum)
                        cell.setSelectButtonIsSelected(isSelected: self.selectedPackageOptionIDList.contains(datum.optionID))
                        cell.addActionLearnMoreViewButton(handler: {
                            print(indexPath.row)
                        })
                        
                        guard let optionList = datum.additionalOptionIDList else { return UICollectionViewCell() }
                        cell.addActionSelectButton(handler: {
                            if self.selectedPackageOptionIDList.contains(datum.optionID) {
                                self.selectedPackageOptionIDList = self.selectedPackageOptionIDList
                                    .filter { $0 != datum.optionID }
                            } else {
                                self.selectedPackageOptionIDList.append(datum.optionID)
                            }
                        })
                        return cell
                    }
                case .other(let inquery):
                    if let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: OptionSelectTagItemCell.identifier,
                        for: indexPath) as? OptionSelectTagItemCell {
                        
                        let tagName = TagCategoryType.allCases[self.selectedCategoryIndexPath.row + 1].title
                        cell.setData(inqeury: inquery, tagName: tagName)
                        
                        return cell
                    }
                }
                return UICollectionViewCell()
            })
        
        diffableDatasource.supplementaryViewProvider = { collectionView, kind, indexPath in
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: OptionSelectTitleHeaderView.identifier,
                    for: indexPath) as? OptionSelectTitleHeaderView else {
                    return UICollectionReusableView()
                }
                
                header.setText(text: "전체 \(self.allItemCount)")
                header.setPartText(
                    text: "\(self.allItemCount)",
                    fontType: .mediumBody3,
                    color: .GetYaPalette.primary)
                
                return header
            }
            return UICollectionReusableView()
        }
    }
    
    // MARK: - Functions
    func setAllItemCount(count: Int) {
        allItemCount = count
    }
    
    func updateCategorySnapShot(types: [TagCategoryType]) {
        var snapshot = diffableDatasource.snapshot()
        snapshot.appendSections([.category])
        
        types.forEach {
            snapshot.appendItems([.category(type: $0)])
        }
        diffableDatasource.apply(snapshot, completion: { [weak self] in
            guard let self else { return }
            selectItem(at: [0, 0], animated: false, scrollPosition: .init())
        })
    }
    
    func updateItemSnapShot(data: [AdditionalOption]) {
        var snapshot = diffableDatasource.snapshot()
        
        snapshot.appendItems(data.map { .all(datum: $0) }, toSection: .all)
        diffableDatasource.apply(snapshot)
    }
    
    func updatePackageItemSnapShot(data: [AdditionalOption]) {
        var snapshot = diffableDatasource.snapshot()
        if snapshot.sectionIdentifiers.contains(.other) {
            snapshot.deleteSections([.other])
        }
        
        if snapshot.sectionIdentifiers.contains(.all) {
            snapshot.deleteSections([.all])
        }
        snapshot.appendSections([.all])
        
        snapshot.appendItems(data.map { .packageItem(datum: $0) }, toSection: .all)
        diffableDatasource.apply(snapshot)
    }
    
    func updateTagItemSnasphot(inquery: AdditionalTagOptionInquery) {
        var snapshot = diffableDatasource.snapshot()
        
        if snapshot.sectionIdentifiers.contains(.all) {
            snapshot.deleteSections([.all])
        }
        
        if snapshot.sectionIdentifiers.contains(.other) {
            snapshot.deleteSections([.other])
        }
        snapshot.appendSections([.other])
        
        snapshot.appendItems([.other(inquery: inquery)], toSection: .other)
        diffableDatasource.apply(snapshot)
    }
    
    // MARK: - Objc Functions
}

// MARK: - UICollectionViewDelegate
extension AdditionalCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            selectedCategoryIndexPath = indexPath
            
            NotificationCenter.default.post(
                name: NSNotification.Name("touchUpCategoryNotification"),
                object: nil,
                userInfo: ["tagNumber": selectedCategoryIndexPath.row + 1])
        } else {
            selectItem(at: selectedCategoryIndexPath, animated: false, scrollPosition: .init())
        }
    }
}
