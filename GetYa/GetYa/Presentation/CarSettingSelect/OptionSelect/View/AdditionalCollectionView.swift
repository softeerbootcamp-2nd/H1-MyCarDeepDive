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
        case all(datum: AdditionalOptionItem)
        case other(datum: OptionTagData)
    }
    
    // MARK: - Properties
    typealias DataSource = UICollectionViewDiffableDataSource<Sections, Items>
    private var diffableDatasource: DataSource!
    private var currentSelectedCategoryIndexPath: IndexPath = [0, 0]
    private var selectedItemIndexPath: [IndexPath] = [] {
        didSet {
            print(selectedItemIndexPath)
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
            
            if self.currentSelectedCategoryIndexPath.row == 0 {
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
                        cell.setSelectButtonIsSelected(isSelected: self.selectedItemIndexPath.contains(indexPath))
                        cell.addActionLearnMoreViewButton(handler: {
                            print(indexPath.row)
                        })
                        cell.addActionSelectButton(handler: {
                            if self.selectedItemIndexPath.contains(indexPath) {
                                self.selectedItemIndexPath = self.selectedItemIndexPath.filter { $0 != indexPath }
                            } else {
                                self.selectedItemIndexPath.append(indexPath)
                            }
                        })
                        return cell
                    }
                case .other(let datum):
                    if let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: OptionSelectTagItemCell.identifier,
                        for: indexPath) as? OptionSelectTagItemCell {
                        cell.setData(datum: datum)
                        
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
                
                header.setText(text: "전체 \(15)")
                header.setPartText(text: "15", fontType: .mediumBody3, color: .GetYaPalette.primary)
                
                return header
            }
            return UICollectionReusableView()
        }
    }
    
    // MARK: - Functions
    func updateCategorySnapShot(types: [TagCategoryType]) {
        var snapshot = diffableDatasource.snapshot()
        snapshot.appendSections([.category])
        
        types.forEach {
            snapshot.appendItems([.category(type: $0)])
        }
        diffableDatasource.apply(snapshot, completion: { [weak self] in
            guard let self else { return }
            selectItem(at: [0, 0], animated: false, scrollPosition: .init())
            collectionView(self, didSelectItemAt: [0, 0])
        })
    }
    
    func updateItemSnapShot(data: [AdditionalOptionItem]) {
        var snapshot = diffableDatasource.snapshot()
        if snapshot.sectionIdentifiers.contains(.other) {
            snapshot.deleteSections([.other])
        }
        
        if !snapshot.sectionIdentifiers.contains(.all) {
            snapshot.appendSections([.all])
        }
        
        snapshot.appendItems(data.map { .all(datum: $0) }, toSection: .all)
        diffableDatasource.apply(snapshot)
    }
    
    func updateTagItemSnasphot(data: [OptionTagData]) {
        var snapshot = diffableDatasource.snapshot()
        
        if snapshot.sectionIdentifiers.contains(.all) {
            snapshot.deleteSections([.all])
        }
        
        if !snapshot.sectionIdentifiers.contains(.other) {
            snapshot.appendSections([.other])
        }
        
        snapshot.appendItems(data.map { .other(datum: $0) }, toSection: .other)
        diffableDatasource.apply(snapshot)
    }
    
    // MARK: - Objc Functions
}

// MARK: - UICollectionViewDelegate
extension AdditionalCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            currentSelectedCategoryIndexPath = indexPath
            
            if indexPath.row != 0 {
                updateTagItemSnasphot(data: [
                    OptionTagData(
                        tagImageURL: "",
                        items: [
                            OptionTagItem(
                                name: "빌트인 캠(보조배터리 포함)",
                                price: 0,
                                imageURL: "a",
                                xPosition: 16.0,
                                yPosition: 10.0),
                            OptionTagItem(
                                name: "빌트인 캠(보조배터리 포함)",
                                price: 0,
                                imageURL: "b",
                                xPosition: .toScaledWidth(value: 150),
                                yPosition: 10.0),
                            OptionTagItem(
                                name: "빌트인 캠(보조배터리 포함)",
                                price: 0,
                                imageURL: "c",
                                xPosition: .toScaledWidth(value: 200),
                                yPosition: 10.0),
                            OptionTagItem(
                                name: "현대 스마트 센스 Ⅰ",
                                price: 0,
                                imageURL: "d",
                                xPosition: .toScaledWidth(value: 120),
                                yPosition: 80.0),
                            OptionTagItem(
                                name: "현대 스마트 센스 Ⅰ",
                                price: 0,
                                imageURL: "d",
                                xPosition: .toScaledWidth(value: 250),
                                yPosition: 150.0)
                            ])
                ])
            } else {
                updateItemSnapShot(data: [
                    .init(
                        id: 1,
                        imageURL: "",
                        selectRate: 6.5,
                        optionName: "현대 스마트 센스 Ⅰ",
                        optionPrice: 1090000,
                        badgeName: "H Genuine Accessories",
                        tagList: [Tag(id: 1, name: "사용편의")]),
                    .init(
                        id: 1,
                        imageURL: "",
                        selectRate: 6.5,
                        optionName: "빌트인 캠(보조배터리 포함)",
                        optionPrice: 1090000,
                        badgeName: "H Genuine Accessories",
                        tagList: [Tag(id: 1, name: "사용편의")]),
                    .init(
                        id: 1,
                        imageURL: "",
                        selectRate: 82.0,
                        optionName: "현대 스마트 센스 Ⅰ",
                        optionPrice: 1090000,
                        badgeName: "N Performance",
                        tagList: [Tag(id: 1, name: "사용편의")]),
                    .init(
                        id: 1,
                        imageURL: "",
                        selectRate: 65.0,
                        optionName: "현대 스마트 센스 Ⅰ",
                        optionPrice: 1090000,
                        badgeName: "None",
                        tagList: [Tag(id: 1, name: "사용편의")])
                ])
            }
        } else {
            selectItem(at: currentSelectedCategoryIndexPath, animated: false, scrollPosition: .init())
        }
    }
}
