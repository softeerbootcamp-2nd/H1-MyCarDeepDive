//
//  OptionDetailCell.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import UIKit

final class OptionDetailCell: UICollectionViewCell {
    static let identifier: String = "OptionDetailCell"
    // MARK: - UI properties
    // MARK: - Properties
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
}


// MARK: - UICollectionViewDataSource
extension OptionDetailCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

// MARK: - UICollectionViewDelegate
extension OptionDetailCell: UICollectionViewDelegate {
    
}
