//
//  CommonCheckListStackView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit

class CheckListStackView: UIStackView {
    // MARK: - UI Properties
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    init(textArray: [String]) {
        super.init(frame: .zero)
        configureUI()
        setupItem(textArray: textArray)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Functions
    private func removeAllArrangedSubViews() {
        self.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func setupItem(textArray: [String]) {
        removeAllArrangedSubViews()
        
        textArray.enumerated().forEach { (idx, text) in
            let itemView = CheckListItemView(text: text)
            itemView.delegate = self
            if idx == 0 { itemView.isTapped = true }
            addArrangedSubview(itemView)
        }
    }
    
    private func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.spacing = 12
    }
}

// TODO: 고른 선택지에 대한 데이터 저장에 대해 고민해야함.
extension CheckListStackView: CheckListItemViewDelegate {
    func tappedView(sender: UITapGestureRecognizer) {
        arrangedSubviews.map { $0 as? CheckListItemView }.forEach {
            if $0 != sender.view {
                $0?.isTapped = false
            }
        }
    }
}
