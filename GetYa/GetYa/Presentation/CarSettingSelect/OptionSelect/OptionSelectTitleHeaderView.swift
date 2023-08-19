//
//  OptionSelectTitleHeaderView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit

class OptionSelectTitleHeaderView: UICollectionReusableView {
    // MARK: - UI properties
    private let label = CommonLabel(fontType: .mediumBody3, color: .GetYaPalette.gray300)
    
    // MARK: - Lifecycles
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
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubview(label)
    }
    
    private func configureUI() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    // MARK: - Functions
    func setText(text: String) {
        label.text = text
    }
    
    func setPartText(text: String, fontType: GetYaFont, color: UIColor) {
        label.configurePartTextFont(color: color, otherFontType: fontType, partText: text)
    }
}
