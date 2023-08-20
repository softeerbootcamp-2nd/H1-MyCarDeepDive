//
//  OptionSelectItemLearnMoreView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/20.
//

import UIKit

class OptionSelectItemLearnMoreView: UIView {
    enum Constants {
        enum Label {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 8)
        }
        enum Button {
            static let trailingMargin: CGFloat = .toScaledWidth(value: -8)
            static let height: CGFloat = .toScaledWidth(value: 14)
            static let width: CGFloat = .toScaledWidth(value: 14)
        }
    }
    
    // MARK: - UI properties
    private let label = CommonLabel(
        fontType: .regularCaption1,
        color: .GetYaPalette.gray300,
        text: "더 알아보기")
    private let button: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(
            UIImage(systemName: "chevron.right")?.withTintColor(
                .GetYaPalette.gray400,
                renderingMode: .alwaysOriginal),
            for: .normal)
    }
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(frame: .zero)
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
        clipsToBounds = true
        backgroundColor = .GetYaPalette.gray700
        layer.borderWidth = 0
        layer.cornerRadius = 4
        
        configureLabel()
        configureButton()
    }
    
    private func configureLabel() {
        typealias Const = Constants.Label
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin)
        ])
    }
    
    private func configureButton() {
        typealias Const = Constants.Button
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            button.heightAnchor.constraint(equalToConstant: Const.height),
            button.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    // MARK: - Functions
    func addButtonAction(handler: @escaping () -> Void) {
        button.addAction(UIAction(handler: { _ in
            handler()
        }), for: .touchUpInside)
    }
}
