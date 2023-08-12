//
//  CharacterSelectSuccessTableViewCell.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

import UIKit

final class CharacterSelectSuccessTableViewCell: UITableViewCell {
    enum Constant {
        static var intrinsicContentHeight: CGFloat {
            let carOptionConst = RecommendCarOptionView.self
            let reviewdConst = ReviewdTextView.self
            return carOptionConst.topMargin + carOptionConst.height + reviewdConst
                .height + reviewdConst.topMargin + reviewdConst.bottomMargin
        }
        
        enum RecommendCarOptionView {
            static let height: CGFloat = .init(60).scaledHeight
            static let leadingMargin: CGFloat = .init(16).scaledWidth
            static let topMargin: CGFloat = .init(10).scaledHeight
        }

        enum ReviewdTextView {
            static let height: CGFloat = .init(46).scaledHeight
            static let leadingMargin: CGFloat = .init(16).scaledWidth
            static let topMargin: CGFloat = .init(12).scaledHeight
            static let bottomMargin: CGFloat = .init(10).scaledHeight
            static let trailingMargin: CGFloat = .init(16).scaledWidth
            static let radius: CGFloat = .init(8).scaledWidth
        }
    }
    static let id = String(describing: CharacterSelectSuccessTableViewCell.self)
    
    // MARK: - UI properties
    private let recommendCarOptionView = CommonOptionView()
    private let reviewdTextView = CommonTextView(
        backgroundColor: .GetYaPalette.lightAcriveBlue,
        textColor: .GetYaPalette.acriveBlue,
        fontType: .regularBody4,
        textAlignment: .left
    ).set {
        $0.configureCornerRadius(with: Constant.ReviewdTextView.radius)
    }
    
    // MARK: - Lifecycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureSubviewUI(
            with: recommendCarOptionView,
            reviewdTextView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Functions
    func configure(with productOptionModel: RecommendCarProductOptionModel) {
        recommendCarOptionView.configureDetail(
            image: UIImage(named: productOptionModel.optionImage) ?? .init(),
            title: productOptionModel.optionName,
            price: productOptionModel.optionPrice)
        reviewdTextView.configureText(text: productOptionModel.optionReview)
    }
    // MARK: - Objc Functions
}

// MARK: - LayoutSupportable
extension CharacterSelectSuccessTableViewCell: LayoutSupportable {
    func configureConstraints() {
        _=[recommendCarOptionViewConstraints,
           reviewdTextViewConstraints
        ].map { NSLayoutConstraint.activate($0) }
        
        recommendCarOptionView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        recommendCarOptionView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        reviewdTextView.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    private var recommendCarOptionViewConstraints: [NSLayoutConstraint] {
        let const = Constant.RecommendCarOptionView.self
        return [
            recommendCarOptionView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: const.leadingMargin),
            recommendCarOptionView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: const.topMargin),
            recommendCarOptionView.heightAnchor.constraint(
                equalToConstant: const.height)]
    }
    private var reviewdTextViewConstraints: [NSLayoutConstraint] {
        let const = Constant.ReviewdTextView.self
        return [
            reviewdTextView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: const.leadingMargin),
            reviewdTextView.topAnchor.constraint(
                equalTo: recommendCarOptionView.bottomAnchor,
                constant: const.topMargin),
            reviewdTextView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -const.trailingMargin),
            reviewdTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: const.height),
            reviewdTextView.bottomAnchor.constraint(equalTo: bottomAnchor)]
    }
}
