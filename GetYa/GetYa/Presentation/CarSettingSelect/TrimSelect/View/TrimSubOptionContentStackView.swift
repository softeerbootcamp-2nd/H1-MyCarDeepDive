//
//  TrimSubOptionContentStackView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/10.
//

import UIKit

protocol TrimSubOptionContentStackViewDelegate: AnyObject {
    func transferOptionText(type: TrimSubOptionContentStackView.OptionType)
    func sendAllSubOptionSelectedIndex(indexList: [Int])
}

class TrimSubOptionContentStackView: UIStackView {
    enum Constants {
        enum StackView {
            static let spacing = CGFloat(12).scaledHeight
        }
    }
    enum OptionType: String {
        case engine = "엔진"
        case body = "바디"
        case system = "구동방식"
    }
    
    // MARK: - UI properties
    
    // MARK: - Properties
    weak var delegate: TrimSubOptionContentStackViewDelegate?
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
                optionTypeTexts: optionTypeTexts[idx]
            ).set {
                $0.delegate = self
            }
            addArrangedSubview(newView)
        }
    }
}

// MARK: - TrimSubOptionViewDelegate
extension TrimSubOptionContentStackView: TrimSubOptionViewDelegate {
    func touchUpOptionButton(text: String) {
        if let type = OptionType(rawValue: text) {
            delegate?.transferOptionText(type: type)
        }
        var isSelectedIndex: [Int] = []
        arrangedSubviews.map { $0 as? TrimSubOptionView }.forEach {
            $0?.optionStackView.arrangedSubviews.map { $0 as? UIButton }.enumerated().forEach({
                if $0.element?.isSelected == true {
                    isSelectedIndex.append($0.offset + 1)
                }
            })
        }
        delegate?.sendAllSubOptionSelectedIndex(indexList: isSelectedIndex)
    }
}
