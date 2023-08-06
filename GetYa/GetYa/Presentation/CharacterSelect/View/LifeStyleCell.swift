//
//  LifeStyleCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/05.
//

import UIKit

class LifeStyleCell: UICollectionViewCell {
    // MARK: - UI Properties
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.5
        imageView.layer.borderColor = UIColor.GetYaPalette.darkPrimary.cgColor
        
        return imageView
    }()
    
    private let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.borderColor = UIColor.GetYaPalette.darkPrimary.cgColor
        view.layer.borderWidth = 1.5
        view.backgroundColor = .white
        
        return view
    }()
    
    // MARK: - Properties
    static let identifier: String = "LifeStyleCell"
    private let titleImageViewLayoutConstant = UILayout(
        leadingMargin: 65,
        trailingMargin: -65,
        height: 128,
        width: 128
    )
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Functions
    private func setupViews() {
        
    }
    
    private func configureUI() {
        
    }
}
