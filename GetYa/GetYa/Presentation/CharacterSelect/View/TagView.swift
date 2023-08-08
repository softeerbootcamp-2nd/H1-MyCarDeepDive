//
//  TagView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/05.
//

import UIKit

class TagView: UIView {
    // MARK: - UI Properties
    private let label = CommonLabel(
        font: GetYaFont.regularCaption1.uiFont,
        color: .GetYaPalette.acriveBlue
    )
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    init(text: String) {
        super.init(frame: .zero)
        setupViews()
        configureUI()
        configureLabelText(text: text)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        configureUI()
    }
    
    // MARK: - Functions
    private func setupViews() {
        addSubview(label)
    }
    
    private func configureUI() {
        self.layer.cornerRadius = CGFloat(10).scaledWidth
        
        configureLabel()
        configureBackgroundColor(color: .GetYaPalette.gray1000)
    }
     
    func configureCornerRadius(with radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func configureTextColor(with: UIColor) {
        label.textColor = with
    }
    
    func configureBorderColor(with: UIColor) {
        label.layer.borderColor = with.cgColor
    }
    
    func configureBorderWidth(with: CGFloat) {
        label.layer.borderWidth = with
    }
    
    func configureBackgroundColor(color: UIColor) {
        self.layer.backgroundColor = color.cgColor
    }
    
    func configureLabelText(text: String) {
        label.text = text
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
