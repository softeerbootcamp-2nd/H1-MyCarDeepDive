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
        enum RecommendKeywordStackView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 41, trailingMargin: 16, height: 28)
            static let interItemSpacing: CGFloat = 6
        }
        enum TagView {
            static let textColor: UIColor = .GetYaPalette.gray300
            static let height: CGFloat = UILayout.init(height: 28).height
            static let cornerRadius: CGFloat = height/2
            static let font: GetYaFont = GetYaFont.regularCaption1
            static let borderWidth: CGFloat = 1
            static let borderColor: UIColor = .GetYaPalette.gray300
        }
        enum RecommendDiscriptionView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 85)
            static let font: GetYaFont = .mediumHead2
            static let fontColor: UIColor = .GetYaPalette.gray0
        }
        enum RecommendSubDiscriptionView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 16, topMargin: 4)
            static let font: GetYaFont = .regularBody4
            static let fontColor: UIColor = .GetYaPalette.gray200
        }
        enum RecommendCarImageView {
            static let uiConstant: UILayout = .init(
                leadingMargin: 62, topMargin: 145, bottomMargin: 11)
            static let imageName: String = "characterSelectSuccessCar"
        }
        enum RecommendCarBackgroundView {
            static let uiConstant: UILayout = .init(bottomMargin: 11, height: 131)
            static let bgColor: UIColor = .GetYaPalette.gray300
        }
    }
    // MARK: - UI properties
    private let recommendKeywordStackView: UIStackView = .init(arrangedSubviews: []).set {
        let const = Constant.RecommendKeywordStackView.self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = const.interItemSpacing
        $0.distribution = .fillEqually
    }
    private let recommendDiscriptionView: CommonLabel = .init(
        font: Constant.RecommendDiscriptionView.font.uiFont,
        color: Constant.RecommendDiscriptionView.fontColor,
        text: "질문에 기반한 추천 차량이에요"
    ).set { $0.translatesAutoresizingMaskIntoConstraints = false }
    private let recommendSubDiscriptionView: CommonLabel = .init(
        font: Constant.RecommendSubDiscriptionView.font.uiFont,
        color: Constant.RecommendSubDiscriptionView.fontColor,
        text: "전국의 Car master 분들이 엄선하여 추천했어요")
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
        setCarImageAnimation()
    }
    
    override var bounds: CGRect {
        didSet {
            print("hfiwehfiwehfiwehfiowhfoiwhfiowh")
            print("\(bounds)")
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
    
    func setRecommendKeywordStackView(_ texts: [String]) {
        let const = Constant.TagView.self
        // TODO: 폰트색 변경해야함
        _=texts.map { text in
            recommendKeywordStackView.addArrangedSubview(TagView(text: text).set {
                $0.configureCornerRadius(with: const.cornerRadius)
                $0.configureBorderWidth(with: const.borderWidth)
                $0.configureBorderColor(with: const.borderColor)
            })
        }
    }
    
    func setCarImageAnimation() {
        _=recommendCarImageView.set {
            $0.alpha = 0.777
            $0.transform = .init(translationX: 27, y: 0.777)
        }
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0.23,
            options: [.curveEaseIn, .curveLinear, .curveEaseOut]
        ) {
            _=self.recommendCarImageView.set {
                $0.alpha = 1
                $0.transform = .identity
            }
        }
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
                equalTo: trailingAnchor,
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
                constant: const.uiConstant.topMargin)]
    }
    
    var recommendSubDiscriptionViewConstraints: [NSLayoutConstraint] {
        let const = Constant.RecommendSubDiscriptionView.self
        return [
            recommendSubDiscriptionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: const.uiConstant.leadingMargin),
            recommendSubDiscriptionView.topAnchor.constraint(
                equalTo: recommendDiscriptionView.bottomAnchor,
                constant: const.uiConstant.topMargin)]
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
                equalTo: bottomAnchor,
                constant: -const.uiConstant.bottomMargin),
            recommendCarBackgroundView.heightAnchor.constraint(
                equalToConstant: const.uiConstant.height)]
    }
}
