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
        setupUI()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailView.prepareForReuse()
    }
    
    // MARK: - Functions
    func configure(with: QuotationPreviewMainHeaderModel) {
        setThumbnailView(with.thumbnailKeywords)
        setRecommendCarInfoView(with.recommendCarProductOption)
        setSectionDivider(with.firstSectionTitle)
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
        _=[configureThumbnailView,
           configureRecommendCarInfo,
           configureSectionDivider
        ].map { NSLayoutConstraint.activate($0) }
    }
}

// MARK: - LayoutSupportable private functions
private extension DetailQuotationPreviewMainHeader {
    var configureThumbnailView: [NSLayoutConstraint] {
        [thumbnailView.leadingAnchor.constraint(
            equalTo: leadingAnchor),
         thumbnailView.trailingAnchor.constraint(
            equalTo: trailingAnchor),
         thumbnailView.topAnchor.constraint(equalTo: topAnchor)]
    }
    
    var configureRecommendCarInfo: [NSLayoutConstraint] {
        [recommendCarInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
         recommendCarInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
         recommendCarInfoView.topAnchor.constraint(equalTo: thumbnailView.bottomAnchor)]
    }
    
    var configureSectionDivider: [NSLayoutConstraint] {
        [sectionDivider.leadingAnchor.constraint(equalTo: leadingAnchor),
         sectionDivider.trailingAnchor.constraint(equalTo: trailingAnchor),
         sectionDivider.topAnchor.constraint(equalTo: recommendCarInfoView.bottomAnchor),
         sectionDivider.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor)]
    }
}
