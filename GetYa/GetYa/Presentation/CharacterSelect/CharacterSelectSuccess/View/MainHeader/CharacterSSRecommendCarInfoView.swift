//
//  CharacterSelectSuccessRecommendCarInfoView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

// CharacterSelectSuccessRecommendCarInfoView
final class CharacterSSRecommendCarInfoView: UIView {
    // MARK: - Constant
    enum Constant {
        static let intrinsicContentHeight: CGFloat = {
            let carKrNameHeight = CarKrNameLabel.intrinsicContentHeight
            let carOptionsLabelHeight = CarOptionsLabel.intrinsicContentHeight
            return carKrNameHeight + carOptionsLabelHeight
        }()
        
        enum CarKrNameLabel {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 24)
            static let fontColor: UIColor = .GetYaPalette.gray50
            static let font: GetYaFont = .mediumHead2
            static let intrinsicContentHeight = {
                return uiConstant.topMargin + font.lineHeight
            }()
        }
        
        enum CarEnTrimLabel {
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
            static let intrinsicContentHeight = {
                return uiConstant.topMargin + font.lineHeight
            }()
        }
    }
    
    // MARK: - UI properties
    private let carKrNameLabel: CommonLabel = .init(
        fontType: Constant.CarKrNameLabel.font,
        color: Constant.CarKrNameLabel.fontColor)
    private let carEnTrimLabel: CommonLabel = .init(
        fontType: Constant.CarEnTrimLabel.font,
        color: Constant.CarEnTrimLabel.fontColor)
    private let carPriceLabel: CommonLabel = .init(
        fontType: Constant.CarPriceLabel.font,
        color: Constant.CarPriceLabel.fontColor)
    private let carOptionsLabel: CommonLabel = .init(
        fontType: Constant.CarOptionsLabel.font,
        color: Constant.CarOptionsLabel.fontColor)
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviewUI(
            with: carKrNameLabel,
            carEnTrimLabel,
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
    func configure(with recommendCarInfo: RecommendCarInfoModel) {
        _=carKrNameLabel.set {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = recommendCarInfo.carKrName
            $0.sizeToFit()
        }
        _=carEnTrimLabel.set {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = recommendCarInfo.carEnTrimName
            $0.sizeToFit()
        }
        _=carPriceLabel.set {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = recommendCarInfo.carPrice
            $0.sizeToFit()
        }
        _=carOptionsLabel.set {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = recommendCarInfo.carOptions
            $0.sizeToFit()
        }
    }
}

// MARK: - LayoutSupportable
extension CharacterSSRecommendCarInfoView: LayoutSupportable {
    func configureConstraints() {
        _=[carKrNameLabelConstraints,
           carEnNameLabelConstraints,
           carPriceLabelConstraints,
           carOptionsLabelConstraints
        ].map { NSLayoutConstraint.activate($0) }
    }
}

// MARK: - Private layout supportable
private extension CharacterSSRecommendCarInfoView {
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
        let const = Constant.CarEnTrimLabel.uiConstant
        return [
            carEnTrimLabel.leadingAnchor.constraint(
                equalTo: carKrNameLabel.trailingAnchor,
                constant: const.leadingMargin),
            carEnTrimLabel.centerYAnchor.constraint(
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
