//
//  QuestionNumberView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/07.
//

import UIKit

class QuestionNumberView: UIView {
    typealias Palette = UIColor.GetYaPalette
    
    // MARK: - UI Properties
    private let label = CommonLabel(fontType: .mediumHead4, color: Palette.gray400)
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        setText(text: text)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        configureUI()
    }
    
    // MARK: - Functions
    private func setupViews() {
        addSubviews([label])
    }
    
    private func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.backgroundColor = Palette.gray900.cgColor
        self.layer.cornerRadius = CGFloat(22).scaledWidth
        
        configureLabel()
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setText(text: String) {
        label.text = text
    }
}
