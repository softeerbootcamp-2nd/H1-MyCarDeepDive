//
//  TrimSubOptionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/10.
//

import UIKit

class TrimSubOptionView: UIView {
    enum Constants {
        enum Label {
            static let leadingMaring = CGFloat(8).scaledWidth
        }
        enum OptionStackView {
            static let spacing = CGFloat(8).scaledWidth
            static let leadingMargin = CGFloat(43).scaledWidth
        }
    }
    
    // MARK: - UI properties
    private let label = CommonLabel(
        fontType: .mediumBody4,
        color: .GetYaPalette.gray200)
    private let optionStackView: UIStackView = UIStackView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = Constants.OptionStackView.spacing
    }
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    init(titleText: String, optionTypeTexts: [String]) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
        setOptionTitle(text: titleText)
        setOptionTypes(texts: optionTypeTexts)
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
        addSubviews([label, optionStackView])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureLabel()
        configureOptionStackView()
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.Label.leadingMaring),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configureOptionStackView() {
        NSLayoutConstraint.activate([
            optionStackView.leadingAnchor.constraint(
                equalTo: label.trailingAnchor,
                constant: Constants.OptionStackView.leadingMargin),
            optionStackView.topAnchor.constraint(equalTo: topAnchor),
            optionStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func setOptionTitle(text: String) {
        self.label.text = text
    }
    
    func setOptionTypes(texts: [String]) {
        
    }
    
    // MARK: - Objc Functions 
}
