//
//  CharacterSelectSuccessRecommendCarInfo.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class CharacterSelectSuccessRecommendCarInfo: UIView {
    // MARK: - Constant
    enum Constant {
        enum CarKrNameLabel {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 24)
            static let fontColor: UIColor = .GetYaPalette.gray50
            static let font: GetYaFont = .mediumHead2
        }
        
        enum CarEnNameLabel {
            static let uiConstant: UILayout = .init(leadingMargin: 7.5)
            static let fontColor: UIColor = .GetYaPalette.gray300
            static let font: GetYaFont = .mediumBody2
        }
        
        enum CarPriceLabel {
            static let uiConstant: UILayout = .init(trailingMargin: 16)
            static let fontColor: UIColor = .GetYaPalette.gray100
            static let font: GetYaFont = .mediumHead4
        }
        
        enum CarOptionsLabel {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 5)
            static let size: CGFloat = 0
            static let fontColor: UIColor = .GetYaPalette.gray400
            static let font: GetYaFont = .regularCaption1
        }
    }
    
    // MARK: - UI properties
    private let carKrNameLabel: CommonLabel = .init(frame: .zero)
    private let carEnNameLabel: CommonLabel = .init(frame: .zero)
    private let carPriceLabel: CommonLabel = .init(frame: .zero)
    private let carOptionsLabel: CommonLabel = .init(frame: .zero)
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviewUI(
            with: carKrNameLabel,
            carEnNameLabel,
            carPriceLabel,
            carOptionsLabel)
    }
    
    convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Helper
    // TODO: 추후 남석이형이 업뎃하면 그거 적용,, setFont자동화 + header호출시점에 configure(with:_:_:_:)로 데이터 주입
    // 값 주입해야함.
    func configure(
        with carKrName: String,
        _ carEnName: String,
        _ carPrice: String,
        _ carOptions: String
    ) {
        
        _=carKrNameLabel.set {
            $0.configureText(text: carKrName)
            $0.configureFont(font: Constant.CarKrNameLabel.font.uiFont)
            $0.configureColor(color: Constant.CarKrNameLabel.fontColor)
        }
        _=carEnNameLabel.set {
            $0.configureText(text: carEnName)
            $0.configureFont(font: Constant.CarEnNameLabel.font.uiFont)
            $0.configureColor(color: Constant.CarEnNameLabel.fontColor)
        }
        _=carPriceLabel.set {
            $0.configureText(text: carPrice)
            $0.configureFont(font: Constant.CarPriceLabel.font.uiFont)
            $0.configureColor(color: Constant.CarPriceLabel.fontColor)
        }
        _=carOptionsLabel.set {
            $0.configureText(text: carOptions)
            $0.configureFont(font: Constant.CarOptionsLabel.font.uiFont)
            $0.configureColor(color: Constant.CarOptionsLabel.fontColor)
        }
    }
}

// MARK: - LayoutSupportable
extension CharacterSelectSuccessRecommendCarInfo: LayoutSupportable {
    func configureConstraints() {
        _=[carKrNameLabelConstraints,
           carEnNameLabelConstraints,
           carPriceLabelConstraints,
           carOptionsLabelConstraints
        ].map { NSLayoutConstraint.activate($0) }
    }
}

// MARK: - Private layout supportable
private extension CharacterSelectSuccessRecommendCarInfo {
    var carKrNameLabelConstraints: [NSLayoutConstraint] {
        let const = Constant.CarKrNameLabel.uiConstant
        return [
            carKrNameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin),
            carKrNameLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: const.topMargin)]
    }
    
    var carEnNameLabelConstraints: [NSLayoutConstraint] {
        let const = Constant.CarEnNameLabel.uiConstant
        return [
            carEnNameLabel.leadingAnchor.constraint(
                equalTo: carKrNameLabel.trailingAnchor,
                constant: const.leadingMargin),
            carEnNameLabel.centerYAnchor.constraint(
                equalTo: carKrNameLabel.centerYAnchor)
        ]
    }
    
    var carPriceLabelConstraints: [NSLayoutConstraint] {
        let const = Constant.CarPriceLabel.uiConstant
        return [
            carPriceLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -const.trailingMargin),
            carPriceLabel.centerYAnchor.constraint(
                equalTo: carKrNameLabel.centerYAnchor)]
    }
    
    var carOptionsLabelConstraints: [NSLayoutConstraint] {
        let const = Constant.CarOptionsLabel.uiConstant
        return [
            carOptionsLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin),
            carOptionsLabel.topAnchor.constraint(
                equalTo: carKrNameLabel.bottomAnchor,
                constant: const.topMargin),
            carOptionsLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor)]
    }
}
