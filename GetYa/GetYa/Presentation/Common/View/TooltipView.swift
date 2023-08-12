//
//  TooltipView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/09.
//

import UIKit

class TooltipView: UIView {
    enum TipYType {
        case top
        case bottom
    }
    
    // MARK: - Lifecycles
    init(
        backgroundColor: UIColor,
        tipStartX: CGFloat,
        tipYType: TipYType,
        tipWidth: CGFloat,
        tipHeight: CGFloat
    ) {
        super.init(frame: .zero)
        self.layer.backgroundColor = backgroundColor.cgColor
        configureTooltip(
            tipStartX: tipStartX,
            tipYType: tipYType,
            tipWidth: tipWidth,
            tipHeight: tipHeight)
        configureUI()
    }
    
    convenience init(
        tipStartX: CGFloat,
        tipWidth: CGFloat,
        tipHeight: CGFloat
    ) {
        self.init(
            backgroundColor: .white,
            tipStartX: tipStartX,
            tipYType: .top,
            tipWidth: tipWidth,
            tipHeight: tipHeight)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTooltip(tipStartX: 0, tipWidth: 8, tipHeight: 6)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureTooltip(tipStartX: 0, tipWidth: 8, tipHeight: 6)
        configureUI()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = CGFloat(8).scaledHeight
    }
    
    // MARK: - Functions
    func configureTooltip(
        tipStartX: CGFloat,
        tipYType: TipYType = .top,
        tipWidth: CGFloat,
        tipHeight: CGFloat
    ) {
        let path = CGMutablePath()

        let tipWidthCenter = tipWidth / 2.0
        let endXWidth = tipStartX + tipWidth
          
        path.move(to: CGPoint(x: tipStartX, y: 0))
        path.addLine(to: CGPoint(x: tipStartX + tipWidthCenter,
                                 y: tipYType == .top ? -tipHeight : tipHeight))
        path.addLine(to: CGPoint(x: endXWidth, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = self.layer.backgroundColor
        self.layer.insertSublayer(shape, at: 0)
    }
}
