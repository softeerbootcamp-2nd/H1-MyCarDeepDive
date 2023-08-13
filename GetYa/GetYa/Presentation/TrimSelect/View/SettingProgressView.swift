//
//  SettingProgressView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class SettingProgressView: UIView {
    enum Constants {
        enum ColorLabel {
            static let leadingMargin: CGFloat = CGFloat(12).scaledWidth
        }
        enum OptionLabel {
            static let leadingMargin: CGFloat = CGFloat(12).scaledWidth
        }
        enum FirstChevronRight {
            static let leadingMargin: CGFloat = CGFloat(12).scaledWidth
        }
        enum SecondChevronRight {
            static let leadingMargin: CGFloat = CGFloat(12).scaledWidth
        }
    }
    enum ProgressType {
        case trim
        case color
        case option
    }
    
    // MARK: - UI properties
    private let trimLabel = CommonLabel(
        fontType: .custom(
            size: 16,
            kern: -0.3,
            lineHeight: 26,
            nameType: .regularHead),
        color: .GetYaPalette.gray400,
        text: "트림")
    private let colorLabel = CommonLabel(
        fontType: .custom(
            size: 16,
            kern: -0.3,
            lineHeight: 26,
            nameType: .regularHead),
        color: .GetYaPalette.gray400,
        text: "색상")
    private let optionLabel = CommonLabel(
        fontType: .custom(
            size: 16,
            kern: -0.3,
            lineHeight: 26,
            nameType: .regularHead),
        color: .GetYaPalette.gray400,
        text: "옵션")
    private let firstChevronRight: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(
            UIImage(systemName: "chevron.right")?.withTintColor(
                .GetYaPalette.gray500,
                renderingMode: .alwaysOriginal),
            for: .disabled)
        $0.isEnabled = false
    }
    private let secondChevronRight: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(
            UIImage(systemName: "chevron.right")?.withTintColor(
                .GetYaPalette.gray500,
                renderingMode: .alwaysOriginal),
            for: .disabled)
        $0.isEnabled = false
    }
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            trimLabel,
            colorLabel,
            optionLabel,
            firstChevronRight,
            secondChevronRight
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        configureTrimLabel()
        configureFirstChevronRight()
        configureColorLabel()
        configureSecondChevronRight()
        configureOptionLabel()
    }
    
    private func configureTrimLabel() {
        NSLayoutConstraint.activate([
            trimLabel.topAnchor.constraint(equalTo: topAnchor),
            trimLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            trimLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureFirstChevronRight() {
        NSLayoutConstraint.activate([
            firstChevronRight.topAnchor.constraint(equalTo: topAnchor),
            firstChevronRight.leadingAnchor.constraint(
                equalTo: trimLabel.trailingAnchor,
                constant: Constants.FirstChevronRight.leadingMargin),
            firstChevronRight.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureColorLabel() {
        NSLayoutConstraint.activate([
            colorLabel.topAnchor.constraint(equalTo: topAnchor),
            colorLabel.leadingAnchor.constraint(
                equalTo: trimLabel.trailingAnchor,
                constant: Constants.ColorLabel.leadingMargin),
            colorLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureSecondChevronRight() {
        NSLayoutConstraint.activate([
            secondChevronRight.topAnchor.constraint(equalTo: topAnchor),
            secondChevronRight.leadingAnchor.constraint(
                equalTo: trimLabel.trailingAnchor,
                constant: Constants.SecondChevronRight.leadingMargin),
            secondChevronRight.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureOptionLabel() {
        NSLayoutConstraint.activate([
            optionLabel.topAnchor.constraint(equalTo: topAnchor),
            optionLabel.leadingAnchor.constraint(
                equalTo: trimLabel.trailingAnchor,
                constant: Constants.OptionLabel.leadingMargin),
            optionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func setCurrentSettingProgress(type: ProgressType) {
        colorLabel.configureFontType(fontType: .custom(
            size: 16,
            kern: -0.3,
            lineHeight: 26,
            nameType: .regularHead))
        trimLabel.configureFontType(fontType: .custom(
            size: 16,
            kern: -0.3,
            lineHeight: 26,
            nameType: .regularHead))
        optionLabel.configureFontType(fontType: .custom(
            size: 16,
            kern: -0.3,
            lineHeight: 26,
            nameType: .regularHead))
        
        switch type {
        case .trim:
            trimLabel.configureFontType(fontType: .custom(
                size: 16,
                kern: -0.3,
                lineHeight: 26,
                nameType: .mediumHead))
        case .color:
            colorLabel.configureFontType(fontType: .custom(
                size: 16,
                kern: -0.3,
                lineHeight: 26,
                nameType: .mediumHead))
        case .option:
            optionLabel.configureFontType(fontType: .custom(
                size: 16,
                kern: -0.3,
                lineHeight: 26,
                nameType: .mediumHead))
        }
    }
}
