//
//  PeekTagView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/08.
//

import UIKit

class PeekTagView: UIView {
    // MARK: - UI Properties
    private let label = CommonLabel(
        fontType: GetYaFont.regularCaption1,
        color: .GetYaPalette.gray900
    )
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    init(text: String) {
        super.init(frame: .zero)
        setupViews()
        configureUI()
        configureLabelText(text: text)
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
        addSubview(label)
    }
    
    private func configureUI() {
        self.layer.cornerRadius = CGFloat(4).scaledWidth
        self.layer.backgroundColor = UIColor.black.cgColor
        
        configureLabel()
    }
    
    func configureLabelText(text: String) {
        label.text = text
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
