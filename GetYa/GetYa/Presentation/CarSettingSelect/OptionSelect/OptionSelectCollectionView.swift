//
//  OptionSelectCollectionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit

class OptionSelectCollectionView: UICollectionView {
    enum Constants {
        static let categoryItemCount: Int = 7
    }
    
    enum Sections: Hashable {
        case category
        case all
    }

    enum Items: Hashable, CaseIterable {
        static var allCases: [OptionSelectCollectionView.Items] = [.category(index: 0), .all(datum: nil)]
        
        case category(index: Int)
        case all(datum: OptionData?)
    }
    
    // MARK: - UI properties
    
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
        updateCategorySnapShot()
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureUI()
        updateCategorySnapShot()
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
            OptionSelectItemCell.self,
            forCellWithReuseIdentifier: OptionSelectItemCell.identifier)
        register(
            OptionSelectTitleHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: OptionSelectTitleHeaderView.identifier)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, _ ) -> NSCollectionLayoutSection? in
            switch Items.allCases[sectionIndex] {
            case .category:
                return self.configureCategoryLayout()
            case .all:
                return self.configureItemLayout()
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
        let sectionInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 0)
        section.contentInsets = sectionInsets
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func configureItemLayout() -> NSCollectionLayoutSection {
        let allItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0/2),
            heightDimension: .absolute(CGFloat(232).scaledHeight))
        let allItem = NSCollectionLayoutItem(layoutSize: allItemSize)
        allItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        allItem.edgeSpacing = .init(
            leading: .fixed(0),
            top: .fixed(12),
            trailing: .fixed(0),
            bottom: .fixed(12))
        
        let allItemGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(232))
        let allItemGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: allItemGroupSize,
            subitems: [allItem])
        allItemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 16)
        
        let nestedGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(300))
        let nestedGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: nestedGroupSize,
            subitems: [allItemGroup])
        
        let section = NSCollectionLayoutSection(group: nestedGroup)
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
    
    private func configureCollectionViewDataSource() {
        diffableDatasource = DataSource(
            collectionView: self,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                switch itemIdentifier {
                case .category(let index):
                    if let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: OptionSelectCategoryCell.identifier,
                        for: indexPath) as? OptionSelectCategoryCell {
                        cell.setByIndex(index: index)
                        
                        return cell
                    }
                case .all(let datum):
                    if let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: OptionSelectItemCell.identifier,
                        for: indexPath) as? OptionSelectItemCell {
                        cell.setData(datum: datum!)
                        cell.addActionLearnMoreViewButton(handler: {
                            print(indexPath.row)
                        })
                        cell.addActionSelectButton(handler: {
                            if self.selectedItemIndexPath.contains(indexPath) {
                                self.selectedItemIndexPath =  self.selectedItemIndexPath.filter { $0 != indexPath }
                            } else {
                                self.selectedItemIndexPath.append(indexPath)
                            }
                        })
                        return cell
                    }
                }
                return UICollectionViewCell()
            })
        
        diffableDatasource.supplementaryViewProvider = { collectionView, kind, indexPath in
            if kind == UICollectionView.elementKindSectionHeader {
                if indexPath.section == 1 {
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
            }
            return UICollectionReusableView()
        }
    }
    
    private func updateCategorySnapShot() {
        var snapshot = diffableDatasource.snapshot()
        snapshot.appendSections([.category])
        
        for idx in 0..<Constants.categoryItemCount {
            snapshot.appendItems([.category(index: idx)])
        }
        diffableDatasource.apply(snapshot, completion: { [weak self] in
            guard let self else { return }
            selectItem(at: [0, 0], animated: false, scrollPosition: .init())
            collectionView(self, didSelectItemAt: [0, 0])
        })
    }
    
    // MARK: - Functions
    func updateItemSnapShot(data: [OptionData]) {
        var snapshot = diffableDatasource.snapshot()
        if !snapshot.sectionIdentifiers.contains(.all) {
            snapshot.appendSections([.all])
        }
        
        snapshot.appendItems(data.map { .all(datum: $0) }, toSection: .all)
        diffableDatasource.apply(snapshot)
    }
    
    // MARK: - Objc Functions
}

// MARK: - UICollectionViewDelegate
extension OptionSelectCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            currentSelectedCategoryIndexPath = indexPath
        } else {
            selectItem(at: currentSelectedCategoryIndexPath, animated: false, scrollPosition: .init())
        }
    }
}
