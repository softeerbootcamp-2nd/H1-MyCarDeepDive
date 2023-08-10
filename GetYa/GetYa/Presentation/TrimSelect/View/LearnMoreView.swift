//
//  LearnMoreView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/10.
//

import UIKit

protocol LearnMoreViewDelegate: AnyObject {
    func touchUpExpandButtonByIsSelected(isSelected: Bool)
}

class LearnMoreView: UIView {
    enum Constants {
        enum Label {
            static let leadingMargin = CGFloat(12).scaledWidth
            static let topMargin = CGFloat(12).scaledHeight
        }
        enum Button {
            static let topMargin = CGFloat(12).scaledHeight
            static let trailingMargin = CGFloat(-12).scaledWidth
            static let width = CGFloat(20).scaledHeight
            static let height = CGFloat(20).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let label = CommonLabel(fontType: .mediumBody4, color: .GetYaPalette.primary)
    private lazy var button: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        $0.setImage(UIImage(systemName: "chevron.up"), for: .selected)
        $0.addTarget(self, action: #selector(touchUpButton), for: .touchUpInside)
    }
    
    // MARK: - Properties
    weak var delegate: LearnMoreViewDelegate?
    
    // MARK: - Lifecycles
    convenience init(text: String) {
        self.init(frame: .zero)
        
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
            label,
            button
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = UIColor.GetYaPalette.primary.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = CGFloat(8).scaledHeight
        
        configureLabel()
        configureButton()
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
    
    private func configureButton() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.Button.topMargin),
            button.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.Button.trailingMargin),
            button.widthAnchor.constraint(equalToConstant: Constants.Button.width),
            button.heightAnchor.constraint(equalToConstant: Constants.Button.height)
        ])
    }
    
    // MARK: - Functions
    func configureText(text: String) {
        label.text = text
    }
    
    // MARK: - Objc Functions
    @objc private func touchUpButton(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        delegate?.touchUpExpandButtonByIsSelected(isSelected: sender.isSelected)
    }
}
