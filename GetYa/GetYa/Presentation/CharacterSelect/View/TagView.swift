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
        fontType: GetYaFont.regularCaption1,
        color: .GetYaPalette.acriveBlue
    )
    
    // MARK: - Properties
    private var leadingConstraints: NSLayoutConstraint?
    private var trailingConstraints: NSLayoutConstraint?
    
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
        layer.borderColor = with.cgColor
    }
    
    func configureBorderWidth(with: CGFloat) {
        layer.borderWidth = with
    }
    
    func configureBackgroundColor(color: UIColor?) {
        backgroundColor = color
    }
    
    func configureLabelText(text: String) {
        label.text = text
    }
    
    func configureLabelFont(with font: UIFont) {
        label.font = font
    }
    
    func configureTextLabelLeadingMargin(with margin: CGFloat) {
        guard let leadingConstraints else {
            leadingConstraints = label.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: margin)
            leadingConstraints?.isActive = true
            return
        }
        leadingConstraints.isActive = false
        self.leadingConstraints = label.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: margin)
        leadingConstraints.isActive = true
        layoutIfNeeded()
    }
    
    func configureTextLabeltrailingMargin(with margin: CGFloat) {
        guard let trailingConstraints else {
            trailingConstraints = label.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -margin)
            trailingConstraints?.isActive = true
            return
        }
        trailingConstraints.isActive = false
        self.trailingConstraints = label.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: margin)
        trailingConstraints.isActive = true
        layoutIfNeeded()
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
