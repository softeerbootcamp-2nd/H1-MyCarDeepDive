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
            static let leadingMarinn = CGFloat(8).scaledWidth
            static let topMarinn = CGFloat(9).scaledWidth
            static let bottomMarinn = CGFloat(-9).scaledWidth
        }
        enum OptionStackView {
            static let spacing = CGFloat(8).scaledWidth
            static let width = CGFloat(248).scaledWidth
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
    private(set) var selectedButtonIndex: Int = 0 {
        didSet {
            optionStackView.arrangedSubviews
                .map { $0 as? TrimSubOptionButton }
                .enumerated()
                .forEach {
                    $0.element?.isSelected = $0.offset == selectedButtonIndex
                }
        }
    }
    
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
                constant: Constants.Label.leadingMarinn),
            label.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Label.topMarinn),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.Label.bottomMarinn)
        ])
    }
    
    private func configureOptionStackView() {
        NSLayoutConstraint.activate([
            optionStackView.topAnchor.constraint(equalTo: topAnchor),
            optionStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            optionStackView.widthAnchor.constraint(equalToConstant: Constants.OptionStackView.width)
        ])
    }
    
    // MARK: - Functions
    func setSelectedButtonIndex(index: Int) {
        self.selectedButtonIndex = index
    }
    
    func setOptionTitle(text: String) {
        self.label.text = text
    }
    
    func setOptionTypes(texts: [String]) {
        texts.enumerated().forEach { (idx, text) in
            let button = TrimSubOptionButton(text: text).set {
                $0.delegate = self
            }
            if idx == selectedButtonIndex { button.isSelected = true }
            optionStackView.addArrangedSubview(button)
        }
    }
    
    // MARK: - Objc Functions 
}

// MARK: - TrimSubOptionButton Delegate
extension TrimSubOptionView: TrimSubOptionButtonDelegate {
    func toucuUpButton(sender: UIButton) {
        _=optionStackView.arrangedSubviews.map {
            let button = $0 as? UIButton
            button?.isSelected = button == sender
        }
    }
}
