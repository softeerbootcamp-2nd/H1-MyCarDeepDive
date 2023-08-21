//
//  PurchaseLearnMoreView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit

class PurchaseLearnMoreView: LearnMoreView {
    // MARK: - UI properties
    private let label = CommonLabel(fontType: .mediumBody4, color: .GetYaPalette.primary)
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    init(textColor: UIColor, text: String) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
        configureTextColor(color: textColor)
        configureText(text: text)
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
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            label
        ])
    }
    
    private func configureUI() {
        clipsToBounds = true
        backgroundColor = .white
        setButtonColor(color: .GetYaPalette.gray400)
        layer.borderWidth = 0
        layer.cornerRadius = 0
        
        configureLabel()
        configureButton(view: label)
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(12).scaledHeight),
            label.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    // MARK: - Functions
    func configureText(text: String) {
        label.text = text
    }
    
    func configureTextColor(color: UIColor) {
        label.textColor = color
    }
}
