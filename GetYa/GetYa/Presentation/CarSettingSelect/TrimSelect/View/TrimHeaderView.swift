//
//  TrimHeaderView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/12.
//

import UIKit

class TrimHeaderView: UIView {
    enum Constants {
        enum ImageView {
            static let topMargin = CGFloat(37).scaledHeight
            static let width = CGFloat(290).scaledWidth
            static let height = CGFloat(130).scaledHeight
        }
        enum GradientLayer {
            static let height = CGFloat(82).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let imageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        // TODO: 임시이므로 나중에 차 사진을 넣든, 서버에서 받든 처리해야함.
        $0.image = UIImage(named: "LifeStylePeekTitle")
    }
    private
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    init(titleImage: UIImage?) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
        setImage(image: titleImage)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        configureGradient()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            imageView
        ])
    }
    
    private func configureUI() {
        backgroundColor = .GetYaPalette.lightPrimary
        translatesAutoresizingMaskIntoConstraints = false
        
        configureImageView()
    }
    
    private func configureImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.ImageView.topMargin),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Constants.ImageView.width),
            imageView.heightAnchor.constraint(equalToConstant: Constants.ImageView.height)
        ])
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
    
    // MARK: - Functions
    func setImage(image: UIImage?) {
        imageView.image = image
    }
}
