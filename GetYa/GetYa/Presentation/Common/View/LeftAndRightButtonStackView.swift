//
//  LeftAndRightButtonsView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/11.
//

import UIKit
import Combine

class LeftAndRightButtonStackView: UIStackView {
    // MARK: - UI Properties
    private let leftButton = CommonButton(
        font: GetYaFont.mediumBody3.uiFont,
        buttonBackgroundColorType: .custom(
            textColor: .GetYaPalette.gray400,
            layerBorderColor: .GetYaPalette.gray600,
            color: .white))
    private let rightButton = CommonButton(
        font: GetYaFont.mediumBody3.uiFont,
        buttonBackgroundColorType: .primary)
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillEqually
        spacing = CGFloat(6).scaledWidth
    }
    
    // MARK: - Functions
    func setLeftButton(title: String, handler: (() -> Void)? = nil) {
        leftButton.setTitle(title, for: .normal)
        leftButton.addAction(
            UIAction(handler: { _ in handler?() }),
            for: .touchUpInside)
        addArrangedSubview(leftButton)
    }
    
    func setRightButton(title: String, handler: (() -> Void)? = nil) {
        rightButton.setTitle(title, for: .normal)
        rightButton.addAction(
            UIAction(handler: { _ in handler?() }),
            for: .touchUpInside)
        addArrangedSubview(rightButton)
    }
}
