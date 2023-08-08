//
//  NSMutableAttributedString+.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import UIKit

extension NSMutableAttributedString {
    func configureHyundaiSans(with type: GetYaFont) {
        guard let font = UIFont(hyundaiSans: type) else {
            print("DEBUG: Filed to create hyundaiSans font.")
            return
        }
        let attributes = configureHyundaiSansAttributes(
            with: font,
            type: type)
        
        addAttributes(
            attributes,
            range: .init(location: 0, length: string.count))
    }
    
    private func configureHyundaiSansAttributes(
        with font: UIFont,
        type: GetYaFont
    ) -> [NSAttributedString.Key: Any] {
        let style = NSMutableParagraphStyle().set {
            $0.maximumLineHeight = type.lineHeight
            $0.minimumLineHeight = type.lineHeight
        }
        
        return [
            .kern: type.kern,
            .font: font,
            .paragraphStyle: style,
            .baselineOffset: (type.lineHeight - font.lineHeight) / 4]
    }
}
