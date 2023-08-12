//
//  TrimOptionContentHeaderView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/13.
//

import UIKit

class TrimOptionContentHeaderView: UICollectionReusableView {
    enum Constants {
        enum Label {
            static let topMargin = CGFloat(16).scaledHeight
            static let leadingMargin = CGFloat(16).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let label = CommonLabel(
        fontType: .mediumHead3,
        color: .GetYaPalette.gray200,
        text: "트림")
    
    // MARK: - Properties
    static let identifier = "TrimOptionContentHeaderView"
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
        configureLabel()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubview(label)
    }
    
    private func configureLabel() {
        backgroundColor = .white
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.Label.topMargin),
            label.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.Label.leadingMargin)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
}
