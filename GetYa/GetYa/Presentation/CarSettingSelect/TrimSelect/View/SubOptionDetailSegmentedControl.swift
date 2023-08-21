//
//  SubOptionDetailSegmentedControl.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class SubOptionDetailSegmentedControl: UISegmentedControl {
    // MARK: - UI properties
    private lazy var underlineView: UIView = UIView().set {
        let width = CGFloat(80).scaledWidth
        let height = CGFloat(2).scaledHeight
        let yPosition = self.bounds.size.height - height
        let frame = CGRect(x: 0, y: yPosition, width: width, height: height)
        $0.frame = frame
        $0.backgroundColor = .GetYaPalette.gray50
        self.addSubview($0)
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        removeBackgroundAndDivider()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        configureUI()
        removeBackgroundAndDivider()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        removeBackgroundAndDivider()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let xPostion = caculateXposition()
        UIView.animate(
            withDuration: 0.1,
            animations: {
                self.underlineView.frame.origin.x = xPostion
            }
        )
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        selectedSegmentIndex = 0
        
        configureTitle()
    }
    
    private func configureTitle() {
        self.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.GetYaPalette.gray400,
                .font: GetYaFont.regularHead2.uiFont
            ],
            for: .normal)
        self.setTitleTextAttributes(
          [
            NSAttributedString.Key.foregroundColor: UIColor.GetYaPalette.gray100,
            .font: GetYaFont.mediumHead2.uiFont
          ],
          for: .selected
        )
    }
    
    private func removeBackgroundAndDivider() {
        let image = UIImage()
        setBackgroundImage(image, for: .normal, barMetrics: .default)
        setBackgroundImage(image, for: .selected, barMetrics: .default)
        setBackgroundImage(image, for: .highlighted, barMetrics: .default)
        
        setDividerImage(
            image,
            forLeftSegmentState: .selected,
            rightSegmentState: .normal,
            barMetrics: .default)
    }
    
    private func caculateXposition() -> CGFloat {
        let equalDivideWidth = (self.bounds.width / CGFloat(self.numberOfSegments))
        let xSpace = (self.bounds.width / CGFloat(self.numberOfSegments))
        * CGFloat(self.selectedSegmentIndex + 1)
        let xPosition = xSpace - equalDivideWidth / 2 - underlineView.frame.width / 2
        return xPosition
    }
    
    // MARK: - Functions
    func configureBottomBorder() {
        let border = CALayer()
        let height = CGFloat(1).scaledHeight
        border.frame = CGRect.init(x: 0, y: frame.height - height, width: frame.width, height: height)
        border.backgroundColor = UIColor.GetYaPalette.gray700.cgColor
        layer.insertSublayer(border, at: 0)
    }
}
