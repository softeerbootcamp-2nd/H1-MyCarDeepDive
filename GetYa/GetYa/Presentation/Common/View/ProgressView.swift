//
//  ProgressView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/06.
//

import UIKit

final class ProgressView: UIProgressView {
    // MARK: - Constant
    private let maxProgressValue: Float = 1.0
    
    private lazy var minProgressValue: Float = gaugeOneStepAmount
    
    private var progressTotalStep: Int = 0
    
    private var isWorkingAnimation: Bool = false
    
    // MARK: - Properties
    private var gaugeOneStepAmount: Float {
        1.0 / Float(progressTotalStep)
    }
    
    // MARK: - Lifecycles
    init(
        frame: CGRect,
        progressTotalStep: Int,
        style: UIProgressView.Style,
        progressTintColor: UIColor?,
        backgroundTintColor: UIColor?
    ) {
        self.progressTotalStep = progressTotalStep
        super.init(frame: frame)
        progressViewStyle = style
        configureUIColor(
            progressTintColor: progressTintColor,
            backgroundTintColor: backgroundTintColor)
    }
    
    convenience init(
        progressTotalStep: Int,
        progressTintColor: UIColor?,
        backgroundTintColor: UIColor?
    ) {
        self.init(
            frame: .zero,
            progressTotalStep: progressTotalStep,
            style: .bar,
            progressTintColor: progressTintColor,
            backgroundTintColor: backgroundTintColor)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(progressTotalStep: Int) {
        self.init(
            frame: .zero,
            progressTotalStep: progressTotalStep,
            style: .bar,
            progressTintColor: .GetYaPalette.acriveBlue,
            backgroundTintColor: .GetYaPalette.gray800)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        progressViewStyle = .default
    }
}

// MARK: - Helper
extension ProgressView {
    func configureUIColor(
        progressTintColor: UIColor?,
        backgroundTintColor: UIColor?
    ) {
        self.progressTintColor = progressTintColor
        trackTintColor = backgroundTintColor
    }
    
    func configureStyle(_ style: UIProgressView.Style) {
        progressViewStyle = style
    }
}
