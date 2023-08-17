//
//  AlertViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/16.
//

import UIKit

class AlertViewController: UIViewController {
    enum Constatns {
        enum ContainerView {
            static let height: CGFloat = .toScaledHeight(value: 60)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 40)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -40)
        }
        enum TitleLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 20)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 20)
        }
        enum DescriptionLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 20)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -17)
        }
        enum ButtonStackView {
            static let topMargin: CGFloat = .toScaledHeight(value: 30)
            static let topMarginAtAlertView: CGFloat = .toScaledHeight(value: 20)
            static let topMarginAtTextField: CGFloat = .toScaledHeight(value: 25)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 20)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -17)
            static let height: CGFloat = .toScaledHeight(value: 40)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -20)
        }
        enum SettingAlertView {
            static let topMargin: CGFloat = .toScaledHeight(value: 20)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 20)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -17)
        }
        enum TextField {
            static let topMargin: CGFloat = .toScaledHeight(value: 28)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 20)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -17)
            static let height: CGFloat = .toScaledHeight(value: 40)
        }
    }
    
    // MARK: - UI properties
    private let containerView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = CGFloat(12).scaledHeight
        $0.backgroundColor = .white
    }
    private let titleLabel = CommonLabel(fontType: .mediumHead4, color: .GetYaPalette.gray0)
    private let descriptionLabel = CommonLabel(fontType: .regularBody4, color: .GetYaPalette.gray300)
    private lazy var buttonStackView = LeftAndRightButtonStackView()
    private var settingAlertView: SettingAlertView!
    private let textField: UITextField = UITextField().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.layer.cornerRadius = CGFloat(8).scaledHeight
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.GetYaPalette.primary.cgColor
    }
    
    // MARK: - Properties
    private var buttonStackViewTopConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if textField.placeholder != nil {
            configureTextField()
        } else if settingAlertView != nil {
            configureSettingAlertView()
        }
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        view.addSubview(containerView)
        
        containerView.addSubviews([
            titleLabel,
            descriptionLabel,
            buttonStackView
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .GetYaPalette.gray300.withAlphaComponent(0.8)
        
        configureContainerView()
        configureTitleLabel()
        configureDescriptionLabel()
        configureButtonStackView()
    }
    
    private func configureContainerView() {
        typealias Const = Constatns.ContainerView
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Const.leadingMargin),
            containerView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Const.trailingMargin),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: Const.height)
        ])
    }
    
    private func configureTitleLabel() {
        typealias Const = Constatns.TitleLabel
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: Const.topMargin),
            titleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Const.leadingMargin)
        ])
    }
    
    private func configureDescriptionLabel() {
        typealias Const = Constatns.DescriptionLabel
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Const.topMargin),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Const.leadingMargin),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Const.trailingMargin)
        ])
    }
    
    private func configureButtonStackView() {
        typealias Const = Constatns.ButtonStackView
        
        buttonStackViewTopConstraint = buttonStackView.topAnchor.constraint(
            equalTo: descriptionLabel.bottomAnchor,
            constant: Const.topMargin)
        NSLayoutConstraint.activate([
            buttonStackViewTopConstraint,
            buttonStackView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Const.leadingMargin),
            buttonStackView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Const.trailingMargin),
            buttonStackView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: Const.bottomMargin),
            buttonStackView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureSettingAlertView() {
        typealias Const = Constatns.SettingAlertView
        
        NSLayoutConstraint.activate([
            settingAlertView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Const.topMargin),
            settingAlertView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Const.leadingMargin),
            settingAlertView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Const.trailingMargin)
        ])
    }
    
    private func configureTextField() {
        typealias Const = Constatns.TextField
        
        buttonStackViewTopConstraint.isActive = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Const.topMargin),
            textField.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Const.leadingMargin),
            textField.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Const.trailingMargin),
            textField.heightAnchor.constraint(equalToConstant: Const.height)
        ])
        buttonStackViewTopConstraint = buttonStackView.topAnchor.constraint(
            equalTo: textField.bottomAnchor,
            constant: Constatns.ButtonStackView.topMarginAtAlertView)
        buttonStackViewTopConstraint.isActive = true
    }
    
    // MARK: - Functions
    func setTitle(text: String) {
        titleLabel.text = text
    }
    
    func setDescription(text: String) {
        descriptionLabel.text = text
    }
    
    func setTextField(placeHolder: String, isEnaled: Bool) {
        textField.placeholder = placeHolder
        textField.isEnabled = isEnaled
        
        containerView.addSubview(textField)
    }
    
    func setLeftButtonAction(title: String, handler: (() -> Void)? = nil) {
        buttonStackView.setLeftButton(title: title, handler: handler)
    }
    
    func setRightButtonAction(title: String, handler: (() -> Void)? = nil) {
        buttonStackView.setRightButton(title: title, handler: handler)
    }
}
