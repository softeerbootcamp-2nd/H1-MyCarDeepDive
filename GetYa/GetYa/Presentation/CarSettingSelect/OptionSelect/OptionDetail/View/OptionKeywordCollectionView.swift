//
//  OptionKeywordCollectionView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/23.
//

import UIKit

final class OptionKeywordCollectionView: UICollectionView {
    // MARK: - Lifecycles
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        backgroundColor = .clear
        register(
            OptionDetailKeywordCell.self,
            forCellWithReuseIdentifier: OptionDetailKeywordCell.identifier)
    }
}
