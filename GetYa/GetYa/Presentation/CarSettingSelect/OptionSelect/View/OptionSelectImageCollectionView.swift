//
//  OptionSelectImageCollectionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import UIKit

class OptionSelectImageCollectionView: UICollectionView {
    enum Constatns {
        static let spacing: CGFloat = .toScaledWidth(value: 12)
        static let cellLength: CGFloat = .toScaledHeight(value: 76)
        static let inset: UIEdgeInsets = UIEdgeInsets(
            top: 0,
            left: .toScaledWidth(value: 16),
            bottom: 0,
            right: .toScaledWidth(value: 16))
    }
    
    // MARK: - UI properties
    
    // MARK: - Properties
    private var imageURLArray: [String] = []
    private var selectedIndexPath: IndexPath?
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout().set {
                $0.minimumLineSpacing = Constatns.spacing
                $0.itemSize = CGSize(width: Constatns.cellLength, height: Constatns.cellLength)
                $0.scrollDirection = .horizontal})
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
        delegate = self
        dataSource = self
        register(
            OptionSelectImageCell.self,
            forCellWithReuseIdentifier: OptionSelectImageCell.identifier)
        showsHorizontalScrollIndicator = false
        contentInset = Constatns.inset
    }
    
    // MARK: - Functions
    func setImageURLArray(URLArray: [String]) {
        imageURLArray = URLArray
        
        reloadData()
    }
    
    // MARK: - Objc Functions
}

// MARK: - UICollectionView Delegate {
extension OptionSelectImageCollectionView: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedIndexPath = indexPath
    }
}

// MARK: - UICollectionView DataSource
extension OptionSelectImageCollectionView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
         return imageURLArray.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OptionSelectImageCell.identifier,
            for: indexPath
        ) as? OptionSelectImageCell else { return UICollectionViewCell() }
        cell.setImage(imageURL: imageURLArray[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionView DelegateFlowLayout
extension OptionSelectImageCollectionView: UICollectionViewDelegateFlowLayout {
    
}
