//
//  CharacterSelectSuccessThumbnailView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class CharacterSelectSuccessThumbnailView: UIView {
    // MARK: - Constant
    enum Constant {
        static let layerColors: [UIColor] = [
            UIColor(red: 0.9, green: 0.92, blue: 0.94, alpha: 1),
            UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1)]
        static let intrinsicContentHeight: CGFloat = {
            let discriptionViewHeight = RecommendDiscriptionView.intrinsicContentHeight
            let subDiscriptionViewHeight =  RecommendSubDiscriptionView.intrinsicContentHeight
            return discriptionViewHeight + subDiscriptionViewHeight + RecommendCarBackgroundView.uiConstant.height
        }()
        enum RecommendKeywordStackView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 41, trailingMargin: 16, height: 28)
            static let interItemSpacing: CGFloat = 6
        }
        enum TagView {
            static let textColor: UIColor = .GetYaPalette.gray300
            static let height: CGFloat = UILayout.init(height: 28).height
            static let cornerRadius: CGFloat = height/2
            static let font: UIFont = UIFont.systemFont(ofSize: 12, weight: .semibold)
            static let leadingMargin: CGFloat = .init(10).scaledWidth
            static let trailingMargin: CGFloat = .init(10).scaledWidth
            static let borderWidth: CGFloat = 1
            static let borderColor: UIColor = .GetYaPalette.gray600
        }
        enum RecommendDiscriptionView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 85)
            static let font: GetYaFont = .mediumHead1
            static let fontColor: UIColor = .GetYaPalette.gray0
            static let intrinsicContentHeight: CGFloat = uiConstant.topMargin + font.lineHeight
        }
        enum RecommendSubDiscriptionView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 3, bottomMargin: 79)
            static let font: GetYaFont = .regularBody4
            static let fontColor: UIColor = .GetYaPalette.gray200
            static let intrinsicContentHeight: CGFloat = uiConstant.topMargin + font
                .lineHeight + uiConstant.bottomMargin
        }
        enum RecommendCarImageView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 62, topMargin: 145, bottomMargin: 11)
            static let imageName: String = "characterSelectSuccessCar"
        }
        enum RecommendCarBackgroundView {
            static let uiConstant: UILayout = .init(height: 131)
            static let bgColor: UIColor = .GetYaPalette.gray300
        }
    }
    // MARK: - UI properties
    private let recommendKeywordStackView: UIStackView = .init(arrangedSubviews: []).set {
        let const = Constant.RecommendKeywordStackView.self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = const.interItemSpacing
    }
    private let recommendDiscriptionView: CommonLabel = .init(
        fontType: Constant.RecommendDiscriptionView.font,
        color: Constant.RecommendDiscriptionView.fontColor,
        text: "질문에 기반한 추천 차량이에요"
    )
    private let recommendSubDiscriptionView: CommonLabel = .init(
        fontType: Constant.RecommendSubDiscriptionView.font,
        color: Constant.RecommendSubDiscriptionView.fontColor,
        text: "전국의 Car master 분들이 엄선하여 추천했어요"
    )
    private let recommendCarImageView = UIImageView(
        image: .init(named: Constant.RecommendCarImageView.imageName)
    ).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
    }
    private let recommendCarBackgroundView = UIView(frame: .zero).set {
        let const = Constant.RecommendCarBackgroundView.self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = const.bgColor
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    override var bounds: CGRect {
        didSet {
            let gradient = CAGradientLayer()
            gradient.frame = bounds
            gradient.colors = Constant.layerColors.map { $0.cgColor }
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
extension CharacterSelectSuccessThumbnailView {
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
        let const = Constant.TagView.self
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
extension CharacterSelectSuccessThumbnailView: LayoutSupportable {
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
private extension CharacterSelectSuccessThumbnailView {
    var recommendKeywordStackViewConstraints: [NSLayoutConstraint] {
        let const = Constant.RecommendKeywordStackView.self
        return [
            recommendKeywordStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.uiConstant.leadingMargin),
            recommendKeywordStackView.trailingAnchor.constraint(
                lessThanOrEqualTo: trailingAnchor,
                constant: -const.uiConstant.trailingMargin),
            recommendKeywordStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: const.uiConstant.topMargin),
            recommendKeywordStackView.heightAnchor.constraint(
                equalToConstant: const.uiConstant.height)]
    }
    
    var recommendDiscriptionViewConstraints: [NSLayoutConstraint] {
        let const = Constant.RecommendDiscriptionView.self
        return [
            recommendDiscriptionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.uiConstant.leadingMargin),
            recommendDiscriptionView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: const.uiConstant.topMargin),
            recommendDiscriptionView.heightAnchor.constraint(
                lessThanOrEqualToConstant: const.font.lineHeight)]
    }
    
    var recommendSubDiscriptionViewConstraints: [NSLayoutConstraint] {
        let const = Constant.RecommendSubDiscriptionView.self
        return [
            recommendSubDiscriptionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.uiConstant.leadingMargin),
            recommendSubDiscriptionView.topAnchor.constraint(
                equalTo: recommendDiscriptionView.bottomAnchor,
                constant: const.uiConstant.topMargin),
            recommendSubDiscriptionView.bottomAnchor.constraint(
                equalTo: recommendCarBackgroundView.topAnchor,
                constant: -const.uiConstant.bottomMargin),
            recommendSubDiscriptionView.heightAnchor.constraint(
                lessThanOrEqualToConstant: const.font.lineHeight)]
    }
    
    var recommendCarImageViewConstraints: [NSLayoutConstraint] {
        let const = Constant.RecommendCarImageView.self
        return [
            recommendCarImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.uiConstant.leadingMargin),
            recommendCarImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -const.uiConstant.bottomMargin),
            recommendCarImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -const.uiConstant.trailingMargin),
            recommendCarImageView.topAnchor.constraint(
                greaterThanOrEqualTo: topAnchor,
                constant: const.uiConstant.topMargin)]
    }
    
    var recommendCarBackgroundViewConstraints: [NSLayoutConstraint] {
        let const = Constant.RecommendCarBackgroundView.self
        return [
            recommendCarBackgroundView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            recommendCarBackgroundView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            recommendCarBackgroundView.bottomAnchor.constraint(
                equalTo: bottomAnchor),
            recommendCarBackgroundView.heightAnchor.constraint(
                equalToConstant: const.uiConstant.height)]
    }
}
