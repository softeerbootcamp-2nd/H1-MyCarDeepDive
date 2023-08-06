//
//  CommonWideButton.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/01.
//

import UIKit

final class CommonButton: UIButton {
    // MARK: - UI Properties
    
    // MARK: - Properties
    
    enum ButtonBackgroundColorType {
        case primary
        case black
        case white
        
        var color: UIColor {
            switch self {
            case .primary:
                return .GetYaPalette.primary
            case .black:
                return .black
            case .white:
                return .white
            }
        }
        
        var textColor: UIColor {
            switch self {
            case .primary, .black:
                return .white
            case .white:
                return .GetYaPalette.primary
            }
        }
        
        var layerBorderColor: CGColor {
            switch self {
            case .white, .primary:
                return self.color.cgColor
            case .black:
                return UIColor.GetYaPalette.gray600.cgColor
            }
        }
    }
    
    // MARK: - LifeCycles
    
    init(
        font: UIFont,
        buttonBackgroundColorType: ButtonBackgroundColorType,
        title: String
    ) {
        super.init(frame: .zero)
        configureUI()
        configureDetail(
            font: font,
            buttonBackgroundColorType: buttonBackgroundColorType,
            title: title
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Functions
    
    private func configureUI() {
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 1
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureDetail(
        font: UIFont,
        buttonBackgroundColorType: ButtonBackgroundColorType,
        title: String
    ) {
        self.titleLabel?.font = font
        self.setTitle(title, for: .normal)
        self.setTitleColor(buttonBackgroundColorType.textColor, for: .normal)
        self.setTitleColor(
            buttonBackgroundColorType.textColor.withAlphaComponent(0.5),
            for: .disabled
        )
        self.layer.backgroundColor = buttonBackgroundColorType.color.cgColor
        self.layer.borderColor = buttonBackgroundColorType.layerBorderColor
    }
}
