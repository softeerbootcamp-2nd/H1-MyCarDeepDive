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
    
    // TODO: - Color Set 만들면 수정할 것
    enum WideButtonBackgroundColorType {
        case primary
        case black
        case white
        
        var color: UIColor {
            switch self {
            case .primary:
                return UIColor(hexString: "00428E")
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
                return UIColor(hexString: "00428E")
            }
        }
        
        var layerBorderColor: CGColor {
            switch self {
            case .white, .primary:
                return self.color.cgColor
            case .black:
                return UIColor(hexString: "D1D7DF").cgColor
            }
        }
    }
    
    // MARK: - LifeCycles
    
    init(
        font: UIFont,
        wideButtonBackgroundColorType: WideButtonBackgroundColorType,
        title: String
    ) {
        super.init(frame: .zero)
        configureDetail(
            font: font,
            wideButtonBackgroundColorType: wideButtonBackgroundColorType,
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
        self.layer.cornerRadius = CGFloat.scaledWidth(value: 6)
        self.layer.borderWidth = 1
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDetail(
        font: UIFont,
        wideButtonBackgroundColorType: WideButtonBackgroundColorType,
        title: String
    ) {
        self.titleLabel?.font = font
        self.setTitle(title, for: .normal)
        self.setTitleColor(wideButtonBackgroundColorType.textColor, for: .normal)
        self.layer.backgroundColor = wideButtonBackgroundColorType.color.cgColor
        self.layer.borderColor = wideButtonBackgroundColorType.layerBorderColor
    }
}
