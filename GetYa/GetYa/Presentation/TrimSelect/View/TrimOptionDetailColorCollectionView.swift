//
//  TrimOptionDetailColorCollectionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/12.
//

import UIKit

class TrimOptionDetailColorCollectionView: UICollectionView {
    enum Constants {
        enum Cell {
            static let spacing = CGFloat(8).scaledWidth
            static let height = CGFloat(24).scaledHeight
            static let width = CGFloat(24).scaledHeight
        }
    }
    
    // MARK: - Properties
    private var colorArray: [UIColor] = []
    
    // MARK: - Lifecycles
    convenience init(colorArray: [UIColor]) {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        setColorArray(colorArray: colorArray)
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
        self.register(
            TrimOptionDetailColorCell.self,
            forCellWithReuseIdentifier: TrimOptionDetailColorCell.identifier)
    }
    
    // MARK: - Functions
    func setColorArray(colorArray: [UIColor]) {
        self.colorArray = colorArray
    }
}

// MARK: - UICollectionViewDelegate
extension TrimOptionDetailColorCollectionView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDatasource
extension TrimOptionDetailColorCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TrimOptionDetailColorCell.identifier,
            for: indexPath
        ) as? TrimOptionDetailColorCell else { return UICollectionViewCell()}
        cell.configureBackgroundColor(color: colorArray[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TrimOptionDetailColorCollectionView: UICollectionViewDelegateFlowLayout {
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
        return CGSize(width: Constants.Cell.width, height: Constants.Cell.height)
    }
}
