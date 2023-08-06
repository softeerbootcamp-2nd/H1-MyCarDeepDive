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
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    convenience init(font: UIFont) {
        self.init(frame: .zero)
        configureFont(font: font)
    }
    
    convenience init(font: UIFont, color: UIColor) {
        self.init(frame: .zero)
        configureFont(font: font)
        configureColor(color: color)
    }
    
    init(font: UIFont, color: UIColor, text: String) {
        super.init(frame: .zero)
        configureUI()
        configureFont(font: font)
        configureColor(color: color)
        configureText(text: text)
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
    
    // TODO: Letter 간격 로직 넣기
    func configureFont(font: UIFont) {
        self.font = font
    }
    
    func configureColor(color: UIColor) {
        self.textColor = color
    }
    
    func configureText(text: String) {
        self.text = text
    }
}
