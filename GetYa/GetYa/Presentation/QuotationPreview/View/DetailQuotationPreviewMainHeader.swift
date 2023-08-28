//
//  DetailQuotationPreviewMainHeader.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

import UIKit

final class DetailQuotationPreviewMainHeader: UITableViewHeaderFooterView {
    static let identifier = "DetailQuotationPreviewMainHeader"
    enum Constants {
        static let intrinsicContentHeight: CGFloat = {
            let thumbnailViewHeight = DetailQuotationPreviewThumbnailView
            .Constants
            .intrinsicContentHeight
            let recommendCarInfoHeight = CommonQuotationPreviewCarInfoView
                .Constants
                .intrinsicContentHeight
            let sectionDividerHeight = CommonQuotationPreviewTitleView
                .Constants
                .intrinsicContentHeight
            return thumbnailViewHeight + recommendCarInfoHeight + sectionDividerHeight
        }()
    }
    
    // MARK: - UI properties
    private let thumbnailView = DetailQuotationPreviewThumbnailView()
    private let recommendCarInfoView = CommonQuotationPreviewCarInfoView()
    private let sectionDivider = CommonQuotationPreviewTitleView()
    
    // MARK: - Lifecycles
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Functions
    func configureUI() {
        setupUI()
        recommendCarInfoView.setCarOptionsLabelBottomConstraint()
    }
    func configure(with: QuotationPreviewMainHeaderModel) {
        setThumbnailView(with.thumbnailKeywords)
        setRecommendCarInfoView(with.recommendCarProductOption)
        setSectionDivider(with.firstSectionTitle)
        thumbnailView.configure(imageUrl: with.thumbnailUrl)
    }
    
    func showAnimation() {
        thumbnailView.setInitialCarImageForAnimation()
        thumbnailView.showCarImageAnimation()
    }
    
    // MARK: - Private functions
    private func setThumbnailView(_ thumbnailKeywords: [String]) {
        thumbnailView.configureRecommendKeywordStackView(thumbnailKeywords)
    }
    
    private func setRecommendCarInfoView(_ carInfo: QuotationPreviewCarInfoModel) {
        recommendCarInfoView.configure(with: carInfo)
    }
    
    private func setSectionDivider(_ title: String) {
        sectionDivider.configureSectionTitle(with: title)
    }
}

// MARK: - LayoutSupportable
extension DetailQuotationPreviewMainHeader: LayoutSupportable {
    func setupViews() {
        addSubviews([thumbnailView,
            recommendCarInfoView,
            sectionDivider])
        
    }
    
    func setupConstriants() {
        configureThumbnailView()
        configureRecommendCarInfo()
        configureSectionDivider()
    }
}

// MARK: - LayoutSupportable private functions
private extension DetailQuotationPreviewMainHeader {
    func configureThumbnailView() {
        typealias Const = DetailQuotationPreviewThumbnailView.Constants
        NSLayoutConstraint.activate([
            thumbnailView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            thumbnailView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            thumbnailView.topAnchor.constraint(equalTo: topAnchor)])
    }
    
    func configureRecommendCarInfo() {
        typealias Const = CommonQuotationPreviewCarInfoView.Constants
        NSLayoutConstraint.activate([
            recommendCarInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recommendCarInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            recommendCarInfoView.topAnchor.constraint(equalTo: thumbnailView.bottomAnchor),
            recommendCarInfoView.heightAnchor.constraint(lessThanOrEqualToConstant: Const.intrinsicContentHeight)])
    }
    
    func configureSectionDivider() {
        typealias Const = CommonQuotationPreviewTitleView.Constants
        NSLayoutConstraint.activate([
            sectionDivider.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionDivider.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionDivider.topAnchor.constraint(equalTo: recommendCarInfoView.bottomAnchor),
            sectionDivider.heightAnchor.constraint(
                equalToConstant: Const.intrinsicContentHeight),
            sectionDivider.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}
