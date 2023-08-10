//
//  TrimSubOptionContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/10.
//

import UIKit

class TrimSubOptionContentView: UIView {
    enum Constants {
        enum StackView {
            static let spacing = CGFloat(12).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let stackView: UIStackView = UIStackView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = Constants.StackView.spacing
        $0.layer.cornerRadius = CGFloat(8).scaledHeight
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.GetYaPalette.gray700.cgColor
        $0.layer.borderWidth = 1
        $0.axis = .vertical
        $0.layoutMargins = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        $0.isLayoutMarginsRelativeArrangement = true
    }
    
    // MARK: - Lifecycles
    init(titleTexts: [String], optionTypeTexts: [[String]]) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
        configureDetail(titleTexts: titleTexts, optionTypeTexts: optionTypeTexts)
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
        addSubview(stackView)
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureStackView()
    }
    
    private func configureStackView() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func configureDetail(titleTexts: [String], optionTypeTexts: [[String]]) {
        titleTexts.enumerated().forEach { (idx, text) in
            let newView = TrimSubOptionView(
                titleText: text,
                optionTypeTexts: optionTypeTexts[idx])
            stackView.addArrangedSubview(newView)
        }
    }
}
