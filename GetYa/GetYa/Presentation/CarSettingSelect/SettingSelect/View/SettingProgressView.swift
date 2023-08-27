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
            static let height: CGFloat = CGFloat(20).scaledHeight
            static let width: CGFloat = CGFloat(20).scaledHeight
        }
        enum SecondChevronRight {
            static let leadingMargin: CGFloat = CGFloat(12).scaledWidth
            static let height: CGFloat = CGFloat(20).scaledHeight
            static let width: CGFloat = CGFloat(20).scaledHeight
        }
    }
    enum ProgressType: CaseIterable {
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
            trimLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            trimLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configureFirstChevronRight() {
        NSLayoutConstraint.activate([
            firstChevronRight.leadingAnchor.constraint(
                equalTo: trimLabel.trailingAnchor,
                constant: Constants.FirstChevronRight.leadingMargin),
            firstChevronRight.centerYAnchor.constraint(equalTo: centerYAnchor),
            firstChevronRight.heightAnchor.constraint(
                equalToConstant: Constants.FirstChevronRight.height),
            firstChevronRight.widthAnchor.constraint(
                equalToConstant: Constants.FirstChevronRight.width)
        ])
    }
    
    private func configureColorLabel() {
        NSLayoutConstraint.activate([
            colorLabel.leadingAnchor.constraint(
                equalTo: firstChevronRight.trailingAnchor,
                constant: Constants.ColorLabel.leadingMargin),
            colorLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configureSecondChevronRight() {
        NSLayoutConstraint.activate([
            secondChevronRight.leadingAnchor.constraint(
                equalTo: colorLabel.trailingAnchor,
                constant: Constants.SecondChevronRight.leadingMargin),
            secondChevronRight.centerYAnchor.constraint(equalTo: centerYAnchor),
            secondChevronRight.heightAnchor.constraint(
                equalToConstant: Constants.FirstChevronRight.height),
            secondChevronRight.widthAnchor.constraint(
                equalToConstant: Constants.FirstChevronRight.width)
        ])
    }
    
    private func configureOptionLabel() {
        NSLayoutConstraint.activate([
            optionLabel.leadingAnchor.constraint(
                equalTo: secondChevronRight.trailingAnchor,
                constant: Constants.OptionLabel.leadingMargin),
            optionLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // MARK: - Functions
    func setCurrentSettingProgress(index: Int) {
        let type = ProgressType.allCases[index]
        
        colorLabel.configureFontType(fontType: .custom(
            size: 16,
            kern: -0.3,
            lineHeight: 26,
            nameType: .regularHead))
        colorLabel.textColor = .GetYaPalette.gray400
        trimLabel.configureFontType(fontType: .custom(
            size: 16,
            kern: -0.3,
            lineHeight: 26,
            nameType: .regularHead))
        trimLabel.textColor = .GetYaPalette.gray400
        optionLabel.configureFontType(fontType: .custom(
            size: 16,
            kern: -0.3,
            lineHeight: 26,
            nameType: .regularHead))
        optionLabel.textColor = .GetYaPalette.gray400
        
        switch type {
        case .trim:
            trimLabel.configureFontType(fontType: .custom(
                size: 16,
                kern: -0.3,
                lineHeight: 26,
                nameType: .mediumHead))
            trimLabel.textColor = .GetYaPalette.gray50
        case .color:
            colorLabel.configureFontType(fontType: .custom(
                size: 16,
                kern: -0.3,
                lineHeight: 26,
                nameType: .mediumHead))
            colorLabel.textColor = .GetYaPalette.gray50
        case .option:
            optionLabel.configureFontType(fontType: .custom(
                size: 16,
                kern: -0.3,
                lineHeight: 26,
                nameType: .mediumHead))
            optionLabel.textColor = .GetYaPalette.gray50
        }
    }
}
