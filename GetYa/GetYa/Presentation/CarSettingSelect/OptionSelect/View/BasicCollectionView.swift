//
//  BasicCollectionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import UIKit

class BasicCollectionView: UICollectionView {
    enum Constants {
        static let categoryItemCount: Int = 7
    }
    
    enum Sections: Hashable {
        case category
        case all(itemCount: Int)
    }

    enum Items: Hashable {
        case category(type: TagCategoryType)
        case all(datum: BasicOption)
    }
    
    // MARK: - Properties
    typealias DataSource = UICollectionViewDiffableDataSource<Sections, Items>
    private var cateogroySnapshot = NSDiffableDataSourceSnapshot<Sections, Items>()
    private var diffableDatasource: DataSource!
    private var itemCount: Int = 0
    private var selectedCategoryIndexPath: IndexPath = [0, 0]
    
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
            OptionSelectBasicItemCell.self,
            forCellWithReuseIdentifier: OptionSelectBasicItemCell.identifier)
        register(
            OptionSelectTitleHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: OptionSelectTitleHeaderView.identifier)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, _ ) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0:
                return self.configureCategoryLayout()
            default:
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
        let sectionInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 24, trailing: 0)
        section.contentInsets = sectionInsets
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func configureItemLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0/2),
            heightDimension: .absolute(CGFloat(174).scaledHeight))
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
                        withReuseIdentifier: OptionSelectBasicItemCell.identifier,
                        for: indexPath) as? OptionSelectBasicItemCell {
                        cell.setData(datum: datum)
                        cell.addActionLearnMoreViewButton(handler: {
                            print(indexPath.row)
                        })
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
                
                header.setText(text: "전체 \(self.itemCount)")
                header.setPartText(
                    text: "\(self.itemCount)",
                    fontType: .mediumBody3,
                    color: .GetYaPalette.primary)
                
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
        cateogroySnapshot = snapshot
        diffableDatasource.apply(cateogroySnapshot, completion: { [weak self] in
            guard let self else { return }
            selectItem(at: [0, 0], animated: false, scrollPosition: .init())
        })
    }
    
    func updateItemSnapShot(data: [BasicOption]) {
        self.itemCount = data.count
        var snapshot = cateogroySnapshot
        snapshot.appendSections([.all(itemCount: data.count)])
        
        snapshot.appendItems(data.map { .all(datum: $0) }, toSection: .all(itemCount: data.count))
        diffableDatasource.apply(snapshot)
    }
    
    // MARK: - Objc Functions
}

// MARK: - UICollectionViewDelegate
extension BasicCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            selectedCategoryIndexPath = indexPath
            
            NotificationCenter.default.post(
                name: NSNotification.Name("touchUpBasicCategoryNotification"),
                object: nil,
                userInfo: ["tagNumber": selectedCategoryIndexPath.row + 1])
        } else {
            selectItem(at: selectedCategoryIndexPath, animated: false, scrollPosition: .init())
        }
    }
}
