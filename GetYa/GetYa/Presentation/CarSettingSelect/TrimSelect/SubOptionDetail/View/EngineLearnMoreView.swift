//
//  EngineLearnMoreView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class EngineLearnMoreView: LearnMoreView {
    enum Constants {
        enum SmallContentView {
            static let topMargin = CGFloat(16).scaledHeight
            static let leadingMargin = CGFloat(16).scaledWidth
            static let height = CGFloat(48).scaledHeight
        }
        enum Descriptionlable {
            static let topMargin = CGFloat(4).scaledHeight
            static let leadingMargin = CGFloat(16).scaledWidth
        }
        enum LargeContentView {
            static let topMargin = CGFloat(14).scaledHeight
            static let height = CGFloat(276).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let smallContentView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let titleLabel = CommonLabel(
        fontType: .mediumHead4,
        color: .GetYaPalette.gray100)
    private let descriptionLabel = CommonLabel(
        fontType: .regularBody4,
        color: .GetYaPalette.gray400)
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    convenience init(titleText: String, descriptionText: String) {
        self.init(frame: .zero)
        
        setTitle(text: titleText)
        setDescription(text: descriptionText)
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
        addSubview(smallContentView)
        
        smallContentView.addSubviews([
            titleLabel,
            descriptionLabel
        ])
    }
    
    private func configureUI() {
        clipsToBounds = true
        layer.borderColor = UIColor.GetYaPalette.gray700.cgColor
        setButtonColor(color: .GetYaPalette.gray300)
        
        configureSmallContentVIew()
        configureTitleLabel()
        configureDescriptionLabel()
        configureButton(view: smallContentView)
    }
    
    private func configureSmallContentVIew() {
        NSLayoutConstraint.activate([
            smallContentView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.SmallContentView.topMargin),
            smallContentView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.SmallContentView.leadingMargin),
            smallContentView.heightAnchor.constraint(
                equalToConstant: Constants.SmallContentView.height),
            smallContentView.trailingAnchor.constraint(
                equalTo: button.leadingAnchor)
        ])
    }
    
    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: smallContentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: smallContentView.leadingAnchor)
        ])
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Constants.Descriptionlable.topMargin),
            descriptionLabel.leadingAnchor.constraint(equalTo: smallContentView.leadingAnchor)
        ])
    }
    
    private func configureContentView(contentView: UIView) {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Constants.LargeContentView.topMargin),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.heightAnchor.constraint(
                equalToConstant: Constants.LargeContentView.height)
        ])
    }
    
    // MARK: - Functions
    func setTitle(text: String) {
        titleLabel.text = text
    }
    
    func setDescription(text: String) {
        descriptionLabel.text = text
    }
    
    func setContentView(view: UIView) {
        addSubview(view)
        configureContentView(contentView: view)
    }
    
    // MARK: - Objc Functions

}
