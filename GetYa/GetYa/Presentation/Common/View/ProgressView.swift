//
//  ProgressView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/06.
//

import UIKit
import Combine

final class ProgressView: UIProgressView {
    // MARK: - Constants
    private let maxGauge: Float = 1.0
    private lazy var minGauge: Float = gaugeOneStepAmount
    
    // MARK: - Properties
    private var progressTotalStep: Int = 0 {
        didSet {
            setProgress(gaugeOneStepAmount, animated: true)
        }
    }
    private var animationDuration: TimeInterval = 0.7
    private var gaugeOneStepAmount: Float {
        1.0 / Float(progressTotalStep)
    }
    private var subscription: AnyCancellable?
    private var autoUpdateProgress = PassthroughSubject<Int, Never>()
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        progressViewStyle = .bar
        configureUIColor(
            progressTintColor: .GetYaPalette.acriveBlue,
            backgroundTintColor: .GetYaPalette.gray800)
        bind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        progressViewStyle = .bar
        configureUIColor(
            progressTintColor: .GetYaPalette.acriveBlue,
            backgroundTintColor: .GetYaPalette.gray800)
        bind()
    }
    
    init(
        frame: CGRect,
        progressTotalStep: Int,
        style: UIProgressView.Style,
        progressTintColor: UIColor? = nil,
        backgroundTintColor: UIColor? = nil,
        animationDuration: TimeInterval
    ) {
        self.progressTotalStep = progressTotalStep
        self.animationDuration = animationDuration
        super.init(frame: frame)
        configureUI()
        progressViewStyle = style
        configureUIColor(
            progressTintColor: progressTintColor ?? .GetYaPalette.acriveBlue,
            backgroundTintColor: backgroundTintColor ?? .GetYaPalette.gray800)
        bind()
    }
    
    convenience init() {
        self.init(frame: .zero)
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
    }
    
    convenience init(progressTotalStep: Int) {
        self.init(frame: .zero)
        self.progressTotalStep = progressTotalStep
    }
    
    deinit {
        subscription = nil
    }
}

// MARK: - Helper
extension ProgressView {
    func configureProgressTotalStep(with totalStep: Int) {
        if totalStep <= 0 { return }
        progressTotalStep = totalStep
    }
    
    func configureAnimationDuration(with duration: TimeInterval) {
        if duration <= 0.0 { return }
        animationDuration = duration
    }
    
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
    
    func setProgress(by index: Int) {
        autoUpdateProgress.send(index + 1)
    }
    
    func increaseOneStep() {
        let nextGauge = progress + gaugeOneStepAmount
        let targetProgress = isOutOfGauge(nextGauge) ? maxGauge : nextGauge
        animate(from: targetProgress)
    }
    
    func decreaseOneStep() {
        let nextGauge = progress - gaugeOneStepAmount
        let targetProgress = isOutOfGauge(nextGauge) ? minGauge : nextGauge
        animate(from: targetProgress)
    }
}

// MARK: - Private helper
extension ProgressView {
    private func configureUI() {
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
    private func isOutOfGauge(_ gauge: Float) -> Bool {
        !(minGauge...maxGauge).contains(gauge)
    }
    
    private func animate(from targetProgress: Float) {
        UIView.animate(
            withDuration: animationDuration,
            delay: 0,
            options: .curveEaseInOut
        ) {
            self.setProgress(targetProgress, animated: true)
        }
    }
    
    private func bind() {
        subscription = autoUpdateProgress
            .map { [weak self] value -> Float in
                guard let self else { return 0.0 }
                return Float(value) / Float(progressTotalStep)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self else { return }
                if value > progress {
                    increaseOneStep()
                    return
                }
                decreaseOneStep()
            }
    }
}
