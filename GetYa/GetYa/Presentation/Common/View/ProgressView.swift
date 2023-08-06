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
    
    // MARK: - Properties
    
    private var progressTotalStep: Int = 0
    
    private var animationDuration: TimeInterval = 0.7
    
    private var isWorkingAnimation: Bool = false
    
    private var gaugeOneStepAmount: Float {
        1.0 / Float(progressTotalStep)
    }
    
    // MARK: - Lifecycles
    init(
        frame: CGRect,
        progressTotalStep: Int,
        style: UIProgressView.Style,
        progressTintColor: UIColor?,
        backgroundTintColor: UIColor?,
        animationDuration: TimeInterval
    ) {
        self.progressTotalStep = progressTotalStep
        self.animationDuration = animationDuration
        super.init(frame: frame)
        progressViewStyle = style
        configureUIColor(
            progressTintColor: progressTintColor,
            backgroundTintColor: backgroundTintColor)
    }
    
    convenience init(
        progressTotalStep: Int,
        progressTintColor: UIColor?,
        backgroundTintColor: UIColor?,
        animationDuration: TimeInterval
    ) {
        self.init(
            frame: .zero,
            progressTotalStep: progressTotalStep,
            style: .bar,
            progressTintColor: progressTintColor,
            backgroundTintColor: backgroundTintColor,
            animationDuration: animationDuration)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // TODO: - 남석이형이 수정한 빨래트로 색 변경.
    convenience init(progressTotalStep: Int) {
        self.init(
            frame: .zero,
            progressTotalStep: progressTotalStep,
            style: .bar,
            progressTintColor: .GetYaPalette.acriveBlue,
            backgroundTintColor: .GetYaPalette.gray800,
            animationDuration: 0.7)
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

// MARK: - Private helper
extension ProgressView {
    private func isOutOfGauge(_ gauge: Float) -> Bool {
        !(minProgressValue...maxProgressValue).contains(gauge)
    }
    
    private func animate(from targetProgress: Float) {
        UIView.animate(
            withDuration: animationDuration,
            delay: 0,
            options: .curveEaseInOut) {
                self.setProgress(targetProgress, animated: true)
            }
    }
}
