//
//  CommonOptionSelectButton.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/02.
//

import UIKit

class CommonOptionSelectButton: UIButton {
    // MARK: - UI Properties
    
    // MARK: - Properties
    override var isSelected: Bool {
        didSet {
            self.layer.backgroundColor = isSelected ? UIColor(hexString: "00428E").cgColor : UIColor.white.cgColor
        }
    }
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle("선택", for: .normal)
        self.setImage(UIImage(named: "Blue-Check-Circle"), for: .normal)
        self.setImage(UIImage(named: "White-Check-Circle"), for: .selected)
        self.setTitleColor(UIColor(hexString: "00428E"), for: .normal)
        self.setTitleColor(.white, for: .selected)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hexString: "00428E").cgColor
        self.layer.cornerRadius = 20
        self.layer.backgroundColor = UIColor.white.cgColor
    }
}
