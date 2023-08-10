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
        static let intrinsicContentHeight: CGFloat = {
            let onePixelDividerHeight = OnePixelDivider.intrinsicContentHeight
            let sectionTitleHeight = SectionTitle.intrinsicContentHeight
            
           return onePixelDividerHeight + sectionTitleHeight
        }()
        enum OnePixelDivider {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 16, trailingMargin: 16, height: 1)
            static let bgColor: UIColor = .GetYaPalette.gray700
            static let intrinsicContentHeight: CGFloat = {
                return uiConstant.height + uiConstant.topMargin
            }()
        }
        
        enum SectionTitle {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 20)
            static let fontColor: UIColor = .GetYaPalette.gray300
            static let font: GetYaFont = .regularCaption1
            static let intrinsicContentHeight: CGFloat = {
                uiConstant.topMargin + font.lineHeight
            }()
        }
    }
    
    // MARK: - UI properties
    private let onePixelDivider: UIView = UIView(frame: .zero).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = Constant.OnePixelDivider.bgColor
    }
    
    private let sectionTitle = CommonLabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviewUI(
            with: onePixelDivider, sectionTitle)
    }
    
    convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviewUI(
            with: onePixelDivider, sectionTitle)
    }
    
    // MARK: - Helper
    func configureSectionTitle(with text: String) {
        sectionTitle.text = text
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
    
    // 추후에 풀리퀘 받고 새로 개선된 common label 써야함..
    private var sectionTitleConstraints: [NSLayoutConstraint] {
        let const = Constant.SectionTitle.uiConstant
        return [
            sectionTitle.topAnchor.constraint(
                equalTo: onePixelDivider.bottomAnchor,
                constant: const.topMargin),
            sectionTitle.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.leadingMargin),
            sectionTitle.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
    }
}
