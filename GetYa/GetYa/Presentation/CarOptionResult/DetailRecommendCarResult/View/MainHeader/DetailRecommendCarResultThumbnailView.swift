//
//  DetailRecommendCarResultThumbnailView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class DetailRecommendCarResultThumbnailView: UIView {
    enum Constants {
        static let layerColors: [UIColor] = [
            UIColor(red: 0.9, green: 0.92, blue: 0.94, alpha: 1),
            UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1)]
        static let intrinsicContentHeight: CGFloat = {
            let discriptionViewHeight = RecommendDiscriptionView.intrinsicContentHeight
            let subDiscriptionViewHeight =  RecommendSubDiscriptionView.intrinsicContentHeight
            return discriptionViewHeight + subDiscriptionViewHeight + RecommendCarBackgroundView.height
        }()
        enum RecommendKeywordStackView {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(41).scaledHeight
            static let trailingMargin = CGFloat(16).scaledWidth
            static let height = CGFloat(28).scaledHeight
            static let interItemSpacing: CGFloat = 6
        }
        enum TagView {
            static let textColor: UIColor = .GetYaPalette.gray300
            static let height: CGFloat = UILayout.init(height: 28).height
            static let cornerRadius: CGFloat = height/2
            static let font: UIFont = UIFont.systemFont(ofSize: 12, weight: .semibold)
            static let leadingMargin = CGFloat(10).scaledWidth
            static let trailingMargin = CGFloat(10).scaledWidth
            static let borderWidth: CGFloat = 1
            static let borderColor: UIColor = .GetYaPalette.gray600
        }
        enum RecommendDiscriptionView {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(85).scaledHeight
            static let font: GetYaFont = .mediumHead1
            static let fontColor: UIColor = .GetYaPalette.gray0
            static let intrinsicContentHeight: CGFloat = topMargin + font.lineHeight
        }
        enum RecommendSubDiscriptionView {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(3).scaledHeight
            static let bottomMargin = CGFloat(79).scaledHeight
            static let font: GetYaFont = .regularBody4
            static let fontColor: UIColor = .GetYaPalette.gray200
            static let intrinsicContentHeight: CGFloat = topMargin + font
                .lineHeight + bottomMargin
        }
        enum RecommendCarImageView {
            static let leadingMargin = CGFloat(62).scaledWidth
            static let topMargin = CGFloat(145).scaledHeight
            static let bottomMargin = CGFloat(11).scaledHeight
            static let imageName: String = "characterSelectSuccessCar"
        }
        enum RecommendCarBackgroundView {
            static let height = CGFloat(131).scaledHeight
            static let bgColor: UIColor = .GetYaPalette.gray300
        }
    }
    
    // MARK: - UI properties
    private let recommendKeywordStackView: UIStackView = .init(arrangedSubviews: []).set {
        let const = Constants.RecommendKeywordStackView.self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = const.interItemSpacing
    }
    private let recommendDiscriptionView: CommonLabel = .init(
        fontType: Constants.RecommendDiscriptionView.font,
        color: Constants.RecommendDiscriptionView.fontColor,
        text: "질문에 기반한 추천 차량이에요"
    )
    private let recommendSubDiscriptionView: CommonLabel = .init(
        fontType: Constants.RecommendSubDiscriptionView.font,
        color: Constants.RecommendSubDiscriptionView.fontColor,
        text: "전국의 Car master 분들이 엄선하여 추천했어요"
    )
    private let recommendCarImageView = UIImageView(
        image: .init(named: Constants.RecommendCarImageView.imageName)
    ).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
    }
    private let recommendCarBackgroundView = UIView(frame: .zero).set {
        let const = Constants.RecommendCarBackgroundView.self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = const.bgColor
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    override var bounds: CGRect {
        didSet {
            let gradient = CAGradientLayer()
            gradient.frame = bounds
            gradient.colors = Constants.layerColors.map { $0.cgColor }
            layer.insertSublayer(gradient, at: 0)
        }
    }
    
    convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
}

// MARK: - Helper
extension DetailRecommendCarResultThumbnailView {
    func configureUI() {
        configureSubviewUI(
            with: recommendKeywordStackView,
            recommendDiscriptionView,
            recommendSubDiscriptionView,
            recommendCarImageView,
            recommendCarBackgroundView)
        bringSubviewToFront(recommendCarImageView)
    }
    
    func configureRecommendKeywordStackView(_ texts: [String]) {
        let const = Constants.TagView.self
        _=texts.map { text in
            recommendKeywordStackView.addArrangedSubview(TagView(text: text).set {
                $0.configureCornerRadius(with: const.cornerRadius)
                $0.configureBorderWidth(with: const.borderWidth)
                $0.configureBorderColor(with: const.borderColor)
                $0.configureLabelFont(with: const.font)
                $0.configureTextColor(with: const.textColor)
                $0.configureBackgroundColor(color: .none)
                $0.configureTextLabelLeadingMargin(with: const.leadingMargin)
                $0.configureTextLabeltrailingMargin(with: const.trailingMargin)
                $0.sizeToFit()
            })
        }
    }
    
    func setInitialCarImageForAnimation() {
        _=recommendCarImageView.set {
            $0.alpha = 0.777
            $0.transform = .init(translationX: 27, y: 0.777)
        }
    }
    
    func showCarImageAnimation() {
        UIView.animate(
            withDuration: 0.7,
            delay: 0,
            options: [.curveEaseOut]
        ) {
            _=self.recommendCarImageView.set {
                $0.alpha = 1
                $0.transform = .identity
            }
        }
    }
    
    func prepareForReuse() {
        _=recommendKeywordStackView.arrangedSubviews.map { $0.removeFromSuperview() }
    }
}

// MARK: - LayoutSupportable
extension DetailRecommendCarResultThumbnailView: LayoutSupportable {
    func configureConstraints() {
        _=[recommendKeywordStackViewConstraints,
           recommendDiscriptionViewConstraints,
           recommendSubDiscriptionViewConstraints,
           recommendCarImageViewConstraints,
           recommendCarBackgroundViewConstraints].map {
            NSLayoutConstraint.activate($0)
        }
    }
}

// MARK: - Layout supportable private helper
private extension DetailRecommendCarResultThumbnailView {
    var recommendKeywordStackViewConstraints: [NSLayoutConstraint] {
        typealias Const = Constants.RecommendKeywordStackView
        return [
            recommendKeywordStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            recommendKeywordStackView.trailingAnchor.constraint(
                lessThanOrEqualTo: trailingAnchor,
                constant: -Const.trailingMargin),
            recommendKeywordStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            recommendKeywordStackView.heightAnchor.constraint(
                equalToConstant: Const.height)]
    }
    
    var recommendDiscriptionViewConstraints: [NSLayoutConstraint] {
        typealias Const = Constants.RecommendDiscriptionView
        return [
            recommendDiscriptionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            recommendDiscriptionView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            recommendDiscriptionView.heightAnchor.constraint(
                lessThanOrEqualToConstant: Const.font.lineHeight)]
    }
    
    var recommendSubDiscriptionViewConstraints: [NSLayoutConstraint] {
        typealias Const = Constants.RecommendSubDiscriptionView
        return [
            recommendSubDiscriptionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            recommendSubDiscriptionView.topAnchor.constraint(
                equalTo: recommendDiscriptionView.bottomAnchor,
                constant: Const.topMargin),
            recommendSubDiscriptionView.bottomAnchor.constraint(
                equalTo: recommendCarBackgroundView.topAnchor,
                constant: -Const.bottomMargin),
            recommendSubDiscriptionView.heightAnchor.constraint(
                lessThanOrEqualToConstant: Const.font.lineHeight)]
    }
    
    var recommendCarImageViewConstraints: [NSLayoutConstraint] {
        typealias Const = Constants.RecommendCarImageView
        return [
            recommendCarImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            recommendCarImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -Const.bottomMargin),
            recommendCarImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            recommendCarImageView.topAnchor.constraint(
                greaterThanOrEqualTo: topAnchor,
                constant: Const.topMargin)]
    }
    
    var recommendCarBackgroundViewConstraints: [NSLayoutConstraint] {
        typealias Const = Constants.RecommendCarBackgroundView
        return [
            recommendCarBackgroundView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            recommendCarBackgroundView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            recommendCarBackgroundView.bottomAnchor.constraint(
                equalTo: bottomAnchor),
            recommendCarBackgroundView.heightAnchor.constraint(
                equalToConstant: Const.height)]
    }
}
