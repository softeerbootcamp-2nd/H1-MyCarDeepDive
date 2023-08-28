//
//  EnginePerformanceDescriptionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class EnginePerformanceDescriptionView: UIView {
    enum Constatns {
        enum DescriptionLabel {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 12)
        }
    }
    
    // MARK: - UI properties
    private let titleLabel = CommonLabel(
        fontType: .mediumBody4,
        color: .GetYaPalette.gray500)
    private let descriptionLabel = CommonLabel(
        fontType: .regularBody4,
        color: .GetYaPalette.gray300)
    
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
        addSubviews([
            titleLabel,
            descriptionLabel
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureTitleLabel()
        configureDescriptionLabel()
    }
    
    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: titleLabel.trailingAnchor,
                constant: Constatns.DescriptionLabel.leadingMargin),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func setTitle(text: String) {
        titleLabel.text = text
    }
    
    func setDescription(text: String) {
        descriptionLabel.text = text
    }
    
    // MARK: - Objc Functions

}
