//
//  CommonPaddingLabel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/12.
//

import UIKit

class CommonPaddingLabel: CommonLabel {
    // MARK: - Properties
    private var padding = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
    
    // MARK: - Lifecycles
    init(padding: UIEdgeInsets, fontType: GetYaFont, color: UIColor, text: String) {
        super.init(fontType: fontType, color: color, text: text)
        self.padding = padding
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
}
