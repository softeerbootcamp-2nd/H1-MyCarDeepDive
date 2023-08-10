//
//  CommonTextView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/09.
//

import UIKit

class CommonTextView: UIView {
    enum Constants {
        enum Label {
            static let leadingMargin = CGFloat(12).scaledWidth
            static let trailingMargin = CGFloat(-12).scaledWidth
            static let topMargin = CGFloat(12).scaledHeight
            static let bottomMargin = CGFloat(-12).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let label = CommonLabel()
    
    private var labelConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Lifecycles
    init(
        backgroundColor: UIColor,
        textColor: UIColor,
        fontType: GetYaFont,
        textAlignment: NSTextAlignment
    ) {
        super.init(frame: .zero)
        setupViews()
        configureUI()
        self.layer.backgroundColor = backgroundColor.cgColor
        configureTextFont(fontType: fontType)
        configureTextAlignment(textAlignment: textAlignment)
        configureTextColor(color: textColor)
    }
    
    init(
        backgroundColor: UIColor,
        textColor: UIColor,
        fontType: GetYaFont
    ) {
        super.init(frame: .zero)
        setupViews()
        configureUI()
        self.layer.backgroundColor = backgroundColor.cgColor
        configureTextFont(fontType: fontType)
        configureTextColor(color: textColor)
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
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubview(label)
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureLabel()
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.Label.leadingMargin),
            label.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.Label.topMargin),
            label.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.Label.trailingMargin),
            label.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.Label.bottomMargin)
        ])
    }
    
    // MARK: - Functions
    func configureTextAlignment(textAlignment: NSTextAlignment) {
        self.label.textAlignment = textAlignment
    }
    
    func configureTextColor(color: UIColor) {
        self.label.textColor = color
    }
    
    func configureTextFont(fontType: GetYaFont) {
        self.label.font = fontType.uiFont
    }
    
    func configureText(text: String) {
        self.label.text = text
    }
    
    func configureCornerRadius(with radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func updateLabelMargins(leading: CGFloat, top: CGFloat, trailing: CGFloat, bottom: CGFloat) {
        _=labelConstraints.map {
            $0.isActive = false
        }
        
        labelConstraints[0] = label.leadingAnchor.constraint(
            equalTo: leadingAnchor, constant: leading)
        labelConstraints[1] = label.topAnchor.constraint(
            equalTo: topAnchor, constant: top)
        labelConstraints[2] = label.trailingAnchor.constraint(
            equalTo: trailingAnchor, constant: -trailing)
        labelConstraints[3] = label.bottomAnchor.constraint(
            equalTo: bottomAnchor, constant: -bottom)
        
        _=labelConstraints.map {
            $0.isActive = true
        }
        layoutIfNeeded()
    }
    
    // MARK: - Objc Functions
}
