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
    /// 프로그래스가 이동할 수 있는 총 단계입니다. 페이지 총 개수와 동일해야 합니다.
    private var progressTotalStep: Int
    private var animationDuration: TimeInterval = 0.7
    private var gaugeOneStepAmount: Float {
        1.0 / Float(progressTotalStep)
    }
    private var subscription: AnyCancellable?
    private var autoUpdateProgress = PassthroughSubject<Int, Never>()
    
    // MARK: - Lifecycles
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
        progressViewStyle = style
        configureUIColor(
            progressTintColor: progressTintColor ?? .GetYaPalette.acriveBlue,
            backgroundTintColor: backgroundTintColor ?? .GetYaPalette.gray800)
        setProgress(gaugeOneStepAmount, animated: false)
        bind()
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
    
    convenience init(progressTotalStep: Int) {
        self.init(
            frame: .zero,
            progressTotalStep: progressTotalStep,
            style: .bar,
            animationDuration: 0.7)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    /// 실제로 이 경우에 required init?일때 반드시 필요한 progressTotalStep의 값은 어떻게 받아야 할까?.. progressTotal Step은 어디서 받아야할까?
    required init?(coder: NSCoder) {
        progressTotalStep = 0
        super.init(coder: coder)
        progressViewStyle = .default
        setProgress(gaugeOneStepAmount, animated: false)
        configureUIColor(
            progressTintColor: .GetYaPalette.acriveBlue,
            backgroundTintColor: .GetYaPalette.gray800)
        bind()
    }
    
    deinit {
        subscription = nil
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
    
    // TODO: 화면 전환될 page index.
    /// **index는 0부터** 시작합니다!!!
    /// 안전하게 하려면 page total count도 받아서 progressTotalStep와 일치하는지 아니면 -1 인지 비교하면 되는데,,
    func setProgress(with index: Int) {
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
                guard let progressTotalStep = self?.progressTotalStep else {
                    return 0.0
                }
                return Float(value) / Float(progressTotalStep)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let progress = self?.progress else {
                    return
                }
                if value > progress {
                    self?.increaseOneStep()
                    return
                }
                self?.decreaseOneStep()
            }
    }
}
