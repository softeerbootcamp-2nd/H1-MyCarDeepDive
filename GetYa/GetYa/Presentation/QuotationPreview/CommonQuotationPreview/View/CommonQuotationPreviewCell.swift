//
//  CommonRecommendCarResultTableViewCell.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

import UIKit

final class CommonQuotationPreviewCell: UITableViewCell {
    enum Constants {
        enum RecommendCarOptionView {
            static let height: CGFloat = .init(60).scaledHeight
            static let leadingMargin: CGFloat = .init(16).scaledWidth
            static let topMargin: CGFloat = .init(10).scaledHeight
        }
        enum ReviewdTextView {
            static let leadingMargin: CGFloat = .init(16).scaledWidth
            static let topMargin: CGFloat = .init(12).scaledHeight
            static let bottomMargin: CGFloat = .init(10).scaledHeight
            static let trailingMargin: CGFloat = .init(16).scaledWidth
            static let radius: CGFloat = .init(8).scaledWidth
            static let innerEdgeInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
            static let fontType = GetYaFont.regularBody4
            
            /// 리뷰는 최대 3줄까지 받아올 수 있도록 설정했습니다.
            static var maximumHeight: CGFloat {
                let numberOfThreeLineText = "테스트테스트\n테스트중간\n마지막글"
                return calculateHeight(from: numberOfThreeLineText)
            }
            static func calculateHeight(from reviewText: String) -> CGFloat {
                let tempPaddingLabel = CommonPaddingLabel(
                    padding: innerEdgeInset,
                    fontType: fontType,
                    color: .GetYaPalette.acriveBlue,
                    text: reviewText
                ).set { $0.translatesAutoresizingMaskIntoConstraints = true }
                
                let screenWidth = UIScreen.main.bounds.width
                let tempPaddingLabelWidth = screenWidth - (leadingMargin + trailingMargin)
                
                /// 원하는 paddingLabel의 width를 위한 frame지정
                tempPaddingLabel.frame = CGRect(
                    x: leadingMargin,
                    y: 0,
                    width: tempPaddingLabelWidth,
                    height: 0)

                return tempPaddingLabel.intrinsicContentSize.height
            }
        }
    }
    static let identifier = String(describing: CommonQuotationPreviewCell.self)
    
    // MARK: - UI properties
    private let recommendCarOptionView = CommonOptionView()
    
    private let reviewdTextView: CommonPaddingLabel = CommonPaddingLabel(
        padding: .init(top: 12, left: 12, bottom: 12, right: 12),
        fontType: Constants.ReviewdTextView.fontType,
        color: .GetYaPalette.acriveBlue,
        text: "리뷰를 불러오고 있습니다 ..."
    ).set {
        $0.layer.cornerRadius = Constants.ReviewdTextView.radius
        $0.clipsToBounds = true
        $0.backgroundColor = .GetYaPalette.lightAcriveBlue
    }
    
    // MARK: - Lifecycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        let reset = OptionInfo(
            optionId: 0,
            price: 0,
            optionName: "",
            optionImgUrl: "",
            comment: "")
        //configure(with: reset)
    }
    
    // MARK: - Functions
//    func configure(with productOptionModel: OptionInfo) {
//
//        var image: UIImage?
//        if let imageName = productOptionModel.optionImage {
//            image = UIImage(named: imageName)
//        }
//        recommendCarOptionView.configureDetail(
//            image: image,
//            title: productOptionModel.optionName,
//            price: productOptionModel.optionPrice)
//        reviewdTextView.text = productOptionModel.optionReview
//    }
    // MARK: - Objc Functions
}

// MARK: - LayoutSupportable
extension CommonQuotationPreviewCell: LayoutSupportable {
    func setupViews() {
        contentView.addSubviews([
            recommendCarOptionView,
            reviewdTextView])
    }
    
    func setupConstriants() {
        configureRecommendCarOptionView()
        configureReviewdTextView()
        
        recommendCarOptionView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        recommendCarOptionView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        reviewdTextView.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    private func configureRecommendCarOptionView() {
        typealias Const = Constants.RecommendCarOptionView
        NSLayoutConstraint.activate([
            recommendCarOptionView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Const.leadingMargin),
            recommendCarOptionView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Const.topMargin),
            recommendCarOptionView.heightAnchor.constraint(
                equalToConstant: Const.height)])
        
    }
    
    private func configureReviewdTextView() {
        typealias Const = Constants.ReviewdTextView
        NSLayoutConstraint.activate([
            reviewdTextView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Const.leadingMargin),
            reviewdTextView.topAnchor.constraint(
                equalTo: recommendCarOptionView.bottomAnchor,
                constant: Const.topMargin),
            reviewdTextView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Const.trailingMargin),
            reviewdTextView.bottomAnchor.constraint(
                lessThanOrEqualTo: contentView.bottomAnchor)])
    }
}
