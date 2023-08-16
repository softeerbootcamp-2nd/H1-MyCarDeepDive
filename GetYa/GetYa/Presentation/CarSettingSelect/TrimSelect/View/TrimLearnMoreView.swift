//
//  TrimLearnMoreView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/12.
//

import UIKit

class TrimLearnMoreView: LearnMoreView {
    enum Constants {
        enum Label {
            static let topMargin = CGFloat(12).scaledHeight
            static let leadingMargin = CGFloat(12).scaledWidth
        }
        enum ContentView {
            static let topMargin = CGFloat(17).scaledHeight
            static let leadingMargin = CGFloat(20).scaledWidth
            static let trailingMargin = CGFloat(-20).scaledWidth
            static let height = CGFloat(285).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let label = CommonLabel(fontType: .mediumBody4, color: .GetYaPalette.primary)
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    init(text: String) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
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
        
        configureLabel()
        configureButton(view: label)
    }
    
    private func configureContentView(contentView: UIView) {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(
                equalTo: label.bottomAnchor,
                constant: Constants.ContentView.topMargin),
            contentView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.ContentView.leadingMargin),
            contentView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.ContentView.trailingMargin),
            contentView.heightAnchor.constraint(
                equalToConstant: Constants.ContentView.height)
        ])
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.Label.topMargin),
            label.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.Label.leadingMargin)
        ])
    }
    
    // MARK: - Functions
    func configureText(text: String) {
        label.text = text
    }
    
    func configureTextColor(color: UIColor) {
        label.textColor = color
    }
    
    func setContentView(view: UIView) {
        addSubview(view)
        configureContentView(contentView: view)
    }
    
    // MARK: - Objc Functions
}
