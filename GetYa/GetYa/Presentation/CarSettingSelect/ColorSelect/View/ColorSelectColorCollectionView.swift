//
//  ColorSelectColorCollectionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/15.
//

import UIKit

protocol ColorSelectColorDelegate: AnyObject {
    func touchUpColorCell(index: Int)
}

class ColorSelectColorCollectionView: UICollectionView {
    enum Constatns {
        static let spacing: CGFloat = .toScaledWidth(value: 12)
        static let cellLength: CGFloat = .toScaledHeight(value: 64)
        static let inset: UIEdgeInsets = UIEdgeInsets(
            top: 0,
            left: .toScaledWidth(value: 16),
            bottom: 0,
            right: .toScaledWidth(value: 16))
    }
    
    // MARK: - UI properties
    
    // MARK: - Properties
    private var colorType: ColorContentView.ColorType = .exterior
    weak var colorSelectDelegate: ColorSelectColorDelegate?
    private var colorNames: [String] = []
    private var colorImages: [UIImage?] = []
    private var selectedIndexPath: IndexPath? {
        didSet {
            if let indexPath = selectedIndexPath {
                colorSelectDelegate?.touchUpColorCell(index: indexPath.row)
            }
        }
    }
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout().set {
                $0.minimumLineSpacing = Constatns.spacing
                $0.itemSize = CGSize(width: Constatns.cellLength, height: Constatns.cellLength)
                $0.scrollDirection = .horizontal
            })
    }
    
    convenience init(colorNames: [String], colorImages: [UIImage?]) {
        self.init(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout().set {
                $0.minimumLineSpacing = Constatns.spacing
                $0.itemSize = CGSize(width: Constatns.cellLength, height: Constatns.cellLength)
                $0.scrollDirection = .horizontal
            })
        
        setColorNames(names: colorNames)
        setColorImages(images: colorImages)
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
            ColorSelectColorCell.self,
            forCellWithReuseIdentifier: ColorSelectColorCell.identifier)
        showsHorizontalScrollIndicator = false
        contentInset = Constatns.inset
    }
    
    // MARK: - Functions
    
    // TODO: 밑에 두 함수는 데이터 모델을 받을 수 있는 하나의 함수로 합쳐질것임
    func setColorNames(names: [String]) {
        colorNames = names
    }
    
    func setColorImages(images: [UIImage?]) {
        colorImages = images
    }
    
    func setColorType(type: ColorContentView.ColorType) {
        self.colorType = type
    }
    
    // MARK: - Objc Functions
}

// MARK: - UICollectionViewDelegate
extension ColorSelectColorCollectionView: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedIndexPath = indexPath
    }
}

// MARK: - UICollectionViewDataSource
extension ColorSelectColorCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorNames.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ColorSelectColorCell.identifier,
            for: indexPath
        ) as? ColorSelectColorCell else { return UICollectionViewCell() }
        
        switch colorType {
        case .exterior:
            if indexPath.row < 3 {
                cell.setExteriorTagViewIsHidden(number: indexPath.row + 1, isHidden: false)
            }
        case .interior:
            if indexPath.row == 0 {
                cell.setInteriorTagViewIsHidden(isHidden: false)
            }
        }
        cell.isSelected = selectedIndexPath == indexPath ? true : false
        cell.setImage(image: colorImages[indexPath.row])
        
        return cell
    }
}
