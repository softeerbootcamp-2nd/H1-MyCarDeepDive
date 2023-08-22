//
//  ColorSelectMoreColorCollectionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/16.
//

import UIKit

protocol ColorSelectMoreColorDelegate: AnyObject {
    func touchUpMoreColorCell(index: Int)
}

class ColorSelectMoreColorCollectionView: UICollectionView {
    enum Constatns {
        static let spacing: CGFloat = .toScaledWidth(value: 12)
        static let cellHeight: CGFloat = .toScaledHeight(value: 86)
        static let cellWidth: CGFloat = .toScaledWidth(value: 64)
    }
    // MARK: - UI properties
    
    // MARK: - Properties
    weak var colorSelectDelegate: ColorSelectMoreColorDelegate?
    private var colorType: ColorContentView.ColorType = .exterior
    private var trimNames: [String] = []
    private var colorImages: [UIImage?] = []
    private var colorImageURLs: [String] = []
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout().set {
                $0.minimumLineSpacing = Constatns.spacing
                $0.itemSize = CGSize(width: Constatns.cellWidth, height: Constatns.cellHeight)
                $0.scrollDirection = .vertical
            })
    }
    
    convenience init(type: ColorContentView.ColorType) {
        self.init(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout().set {
                $0.minimumLineSpacing = Constatns.spacing
                $0.itemSize = CGSize(width: Constatns.cellWidth, height: Constatns.cellHeight)
                $0.scrollDirection = .vertical
            })
        setColorType(type: type)
    }
    
    convenience init(trimNames: [String], colorImages: [UIImage?]) {
        self.init(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout().set {
                $0.minimumLineSpacing = Constatns.spacing
                $0.itemSize = CGSize(width: Constatns.cellWidth, height: Constatns.cellHeight)
                $0.scrollDirection = .vertical
            })
        
        setData(names: trimNames, images: colorImages)
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
            ColorSelectMoreColorCell.self,
            forCellWithReuseIdentifier: ColorSelectMoreColorCell.identifier)
        showsVerticalScrollIndicator = false
        isScrollEnabled = false
    }
    
    // MARK: - Functions
    func setData(names: [String], imageURLs: [String]) {
        trimNames = names
        colorImageURLs = imageURLs
    }
    
    func setData(names: [String], images: [UIImage?]) {
        trimNames = names
        colorImages = images
    }
    
    func setColorType(type: ColorContentView.ColorType) {
        self.colorType = type
    }
}

// MARK: - UICollectionViewDelegate
extension ColorSelectMoreColorCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        colorSelectDelegate?.touchUpMoreColorCell(index: indexPath.row)
    }
}

// MARK: - UICollectionViewDataSource
extension ColorSelectMoreColorCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trimNames.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ColorSelectMoreColorCell.identifier,
            for: indexPath
        ) as? ColorSelectMoreColorCell else { return UICollectionViewCell() }
        cell.setImageAndName(
            name: trimNames[indexPath.row],
            imageURL: colorImageURLs[indexPath.row])
        
        return cell
    }
}
