//
//  CharacterSelectSuccessSectionDividerView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class CharacterSelectSuccessSectionDividerView: UIView {
    // MARK: - Constants
    enum Constant {
        enum OnePixelDivider {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 16, trailingMargin: 16, height: 1)
            static let bgColor: UIColor = .GetYaPalette.gray700
        }
        
        enum SectionTitle {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 20)
            static let color: UIColor = .GetYaPalette.gray300
            static let font: GetYaFont = .regularCaption1
            static let size: CGFloat = 12
        }
    }
    
    // MARK: - UI properties
    private let onePixelDivider: UIView = UIView(frame: .zero).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = Constant.OnePixelDivider.bgColor
    }
    
    private let sectionTitle = CommonLabel(
        font: .init(hyundaiSans: Constant.SectionTitle.font) ?? .init()
    )
    
    // MARK: - Helper
    // TODO: 폰트 새로 적용된거로 바꿔야함. NSMutableAttributed string
    func configureSectionTitle(with text: String) {
        sectionTitle.text = text
        sectionTitle.setFont(
            type: Constant.SectionTitle.font)
    }
}

// MARK: - LayoutSupportable
extension CharacterSelectSuccessSectionDividerView: LayoutSupportable {
    func configureConstraints() {
        _=[onePixelDividerConstraints,
           sectionTitleConstraints].map {
            NSLayoutConstraint.activate($0)
        }
    }
    
    // MARK: - Private layout supportable helper
    private var onePixelDividerConstraints: [NSLayoutConstraint] {
        let const = Constant.OnePixelDivider.uiConstant
        return [
            onePixelDivider.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin),
            onePixelDivider.topAnchor.constraint(
                equalTo: topAnchor,
                constant: const.topMargin),
            onePixelDivider.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -const.trailingMargin),
            onePixelDivider.heightAnchor.constraint(equalToConstant: const.height)]
    }
    
    private var sectionTitleConstraints: [NSLayoutConstraint] {
        let const = Constant.SectionTitle.uiConstant
        return [
            sectionTitle.topAnchor.constraint(
                equalTo: onePixelDivider.bottomAnchor,
                constant: const.topMargin),
            sectionTitle.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin)
        ]
    }
}
