//
//  TrimSubOptionContentStackView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/10.
//

import UIKit

class TrimSubOptionContentStackView: UIStackView {
    enum Constants {
        enum StackView {
            static let spacing = CGFloat(12).scaledHeight
        }
    }
    
    // MARK: - UI properties
    
    // MARK: - Properties
    private let titleTexts = ["엔진", "바디", "구동방식"]
    private let optionTypeTexts = [
        ["디젤 2.2", "가솔린 3.8"],
        ["7인승", "8인승"],
        ["2WD", "4WD"]
    ]
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureDetail()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        configureUI()
        configureDetail()
    }
    
    // MARK: - Private Functions
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        spacing = Constants.StackView.spacing
        layer.cornerRadius = CGFloat(8).scaledHeight
        clipsToBounds = true
        layer.borderColor = UIColor.GetYaPalette.gray700.cgColor
        layer.borderWidth = 1
        axis = .vertical
        layoutMargins = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 8)
        isLayoutMarginsRelativeArrangement = true
    }
    
    // MARK: - Functions
    private func configureDetail() {
        titleTexts.enumerated().forEach { (idx, text) in
            let newView = TrimSubOptionView(
                titleText: text,
                optionTypeTexts: optionTypeTexts[idx])
            addArrangedSubview(newView)
        }
    }
}
