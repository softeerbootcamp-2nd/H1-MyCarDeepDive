//
//  SettingSelectTitleBackgroundVIew.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/15.
//

import UIKit

class SettingSelectTitleBackgroundVIew: UIView {
    enum Constants {
        enum GradientLayer {
            static let height = CGFloat(82).scaledHeight
        }
    }
    
    // MARK: - UI properties
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        configureGradient()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        backgroundColor = .GetYaPalette.lightPrimary
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureGradient() {
        let colors: [CGColor] = [
            UIColor.GetYaPalette.primary.withAlphaComponent(0.3).cgColor,
            UIColor.clear.cgColor
        ]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.frame = CGRect(
            x: 0,
            y: bounds.height - Constants.GradientLayer.height,
            width: frame.width,
            height: Constants.GradientLayer.height)
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.locations = [0.0, 1.0]
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
