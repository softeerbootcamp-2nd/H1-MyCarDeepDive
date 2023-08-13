//
//  TrimSubOptionButton.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/10.
//

import UIKit

protocol TrimSubOptionButtonDelegate: AnyObject {
    func toucuUpButton(sender: UIButton)
}

class TrimSubOptionButton: UIButton {
    typealias Palette = UIColor.GetYaPalette
    
    // MARK: - UI properties
    
    // MARK: - Properties
    override var isSelected: Bool {
        didSet {
            layer.backgroundColor = isSelected ? Palette.gray1000.cgColor : Palette.gray800.cgColor
            layer.borderWidth = isSelected ? 1.5 : 0
        }
    }
    override var isHighlighted: Bool {
        didSet {
            delegate?.toucuUpButton(sender: self)
        }
    }
    
    weak var delegate: TrimSubOptionButtonDelegate?
    
    // MARK: - Lifecycles
    init(text: String) {
        super.init(frame: .zero)
        
        configureUI()
        setTitle(text, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureUI()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = CGFloat(8).scaledWidth
        layer.borderColor = Palette.primary.cgColor
        layer.backgroundColor = Palette.gray800.cgColor
        titleLabel?.font = GetYaFont.mediumBody4.uiFont
        setTitleColor(Palette.gray500, for: .normal)
        setTitleColor(Palette.primary, for: .selected)
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
}
