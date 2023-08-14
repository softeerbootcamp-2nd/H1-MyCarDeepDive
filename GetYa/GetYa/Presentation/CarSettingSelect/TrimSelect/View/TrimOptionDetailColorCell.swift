//
//  TrimOptionDetailColorCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/12.
//

import UIKit

class TrimOptionDetailColorCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "TrimOptionDetailColorCell"
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureUI()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        layer.cornerRadius = CGFloat(2).scaledHeight
    }
    
    // MARK: - Functions
    func configureBackgroundColor(color: UIColor) {
        layer.backgroundColor = color.cgColor
    }
}
