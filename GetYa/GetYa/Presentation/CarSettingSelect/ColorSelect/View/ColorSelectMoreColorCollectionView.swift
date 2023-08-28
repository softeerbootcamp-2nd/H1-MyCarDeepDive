//
//  ColorSelectMoreColorCollectionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/16.
//

import UIKit
class ColorSelectMoreColorCollectionView: UICollectionView {
    enum Constatns {
        static let spacing: CGFloat = .toScaledWidth(value: 12)
        static let cellHeight: CGFloat = .toScaledHeight(value: 86)
        static let cellWidth: CGFloat = .toScaledWidth(value: 64)
    }
    // MARK: - UI properties
    
    // MARK: - Properties
    private var colorType: ColorType = .exterior
    private var colorArray: [Color] = [] {
        didSet {
            reloadData()
        }
    }
    
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
    
    convenience init(type: ColorType) {
        self.init(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout().set {
                $0.minimumLineSpacing = Constatns.spacing
                $0.itemSize = CGSize(width: Constatns.cellWidth, height: Constatns.cellHeight)
                $0.scrollDirection = .vertical
            })
        setColorType(type: type)
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
    func setColorArray(colorArray: [Color]) {
        self.colorArray = colorArray
    }
    
    func setColorType(type: ColorType) {
        self.colorType = type
    }
}

// MARK: - UICollectionViewDelegate
extension ColorSelectMoreColorCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NotificationCenter.default.post(
            name: Notification.Name("touchColorCellNotification"),
            object: nil,
            userInfo: ["color": colorArray[indexPath.row], "colorType": colorType])
    }
}

// MARK: - UICollectionViewDataSource
extension ColorSelectMoreColorCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count
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
            name: colorArray[indexPath.row].trimName,
            imageURL: colorArray[indexPath.row].imageURL)
        
        return cell
    }
}
