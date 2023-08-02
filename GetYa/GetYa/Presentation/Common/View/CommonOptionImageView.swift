//
//  CommonOptionImageView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/02.
//

import UIKit

class CommonOptionImageView: UIImageView {
    // MARK: - UI Properties
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    override init(image: UIImage?) {
        super.init(image: image)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = CGFloat.scaledWidth(value: 4)
        self.layer.masksToBounds = true
    }
    
    func configureImage(image: UIImage) {
        self.image = image
    }
}
