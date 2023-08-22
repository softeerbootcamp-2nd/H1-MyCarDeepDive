//
//  QuotationFinishHeaderView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit

class CommonTableHeaderView: UITableViewHeaderFooterView {
    // MARK: - UI properties
    private let label = CommonLabel(fontType: .regularCaption1, color: .GetYaPalette.gray300)
    
    // MARK: - Properties
    static let identifier = "CommonTableHeaderView"
    
    // MARK: - Lifecycles
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
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
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func setFont(fontType: GetYaFont) {
        label.configureFontType(fontType: fontType)
    }
    
    func setLabel(text: String) {
        label.text = text
    }
    
    // MARK: - Objc Functions
}
