//
//  CommonCheckListItemLabel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit

class CommonCheckListItemLabel: CommonLabel {
    // MARK: - UI Properties
    
    // MARK: - Properties
    override var isHighlighted: Bool {
        didSet {
            self.textColor = isHighlighted ? UIColor(hexString: "00428E") : UIColor(hexString: "F0F0F0")
            self.font = isHighlighted ? UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(400)) : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(500))
        }
    }
    
    // MARK: - LifeCycles
    
    // MARK: - Functions
}
