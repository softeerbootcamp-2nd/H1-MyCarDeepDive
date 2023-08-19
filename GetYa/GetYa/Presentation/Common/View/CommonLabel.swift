//
//  CommonLabel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/02.
//

import UIKit

class CommonLabel: UILabel {
    // MARK: - UI Properties
    
    // MARK: - Properties
    private var fontType: GetYaFont? {
        didSet {
            configureFont()
        }
    }
    override var text: String? {
        didSet {
            configureFont()
        }
    }
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    convenience init(fontType: GetYaFont) {
        self.init(frame: .zero)
        configureFontType(fontType: fontType)
    }
    
    convenience init(fontType: GetYaFont, color: UIColor) {
        self.init(frame: .zero)
        configureFontType(fontType: fontType)
        self.textColor = color
    }
    
    init(fontType: GetYaFont, color: UIColor, text: String) {
        super.init(frame: .zero)
        configureUI()
        configureFontType(fontType: fontType)
        self.textColor = color
        self.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        self.sizeToFit()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
    }
    
    private func configureFont() {
        if let text, let fontType {
            self.attributedText = NSMutableAttributedString(string: text).set {
                $0.configureHyundaiSans(type: fontType)
            }
        }
    }
    
    func configureFontType(fontType: GetYaFont) {
        self.fontType = fontType
    }
    
    func configurePartTextFont(otherFontType: GetYaFont, partText: String) {
        if let text, let fontType {
            self.attributedText = NSMutableAttributedString(string: text).set {
                $0.configureHyundaiSans(
                    type: fontType,
                    otherType: otherFontType, text: partText)
            }
        }
    }
    
    func configurePartTextColor(partText: String, partTextColor: UIColor) {
        if let text, let fontType {
            attributedText = NSMutableAttributedString(string: text).set {
                $0.configureHyundaiSans(type: fontType)
                $0.addAttributes([.foregroundColor: partTextColor], range: (text as NSString).range(of: partText))
            }
        }
    }
    
    func configurePartTextFont(
        color: UIColor,
        otherFontType: GetYaFont,
        partText: String
    ) {
        if let text, let fontType {
            attributedText = NSMutableAttributedString(string: text).set {
                $0.configureHyundaiSans(
                    type: fontType,
                    otherType: otherFontType,
                    text: partText)
                $0.addAttributes([.foregroundColor: color], range: (text as NSString).range(of: partText))
            }
        }
    }
}
