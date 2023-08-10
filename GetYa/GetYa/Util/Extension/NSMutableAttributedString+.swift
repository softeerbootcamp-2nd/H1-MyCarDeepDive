//
//  NSMutableAttributedString+HyundaiSansConfigure.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import UIKit

extension NSMutableAttributedString {
    func configureHyundaiSans(type: GetYaFont) {
        let font = type.uiFont
        let attributes = configureHyundaiSansAttributes(
            with: font,
            type: type)
        
        addAttributes(
            attributes,
            range: .init(location: 0, length: string.count))
    }
    
    func configureHyundaiSans(type: GetYaFont, otherType: GetYaFont, text: String) {
        configureHyundaiSans(type: type)
        
        let otherFont = otherType.uiFont
        let otherAttributes = configureHyundaiSansAttributes(
            with: otherFont,
            type: otherType)
        
        addAttributes(
            otherAttributes,
            range: (string as NSString).range(of: text))
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
