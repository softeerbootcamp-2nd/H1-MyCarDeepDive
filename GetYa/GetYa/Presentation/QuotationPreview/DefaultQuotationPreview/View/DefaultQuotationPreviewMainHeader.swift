//
//  DefaultQuotationPreviewMainHeader.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/18.
//

import UIKit

final class DefaultQuotationPreviewMainHeader: UITableViewHeaderFooterView {
    static let identifier = "DefaultQuotationPreviewMainHeader"
    enum Constants {
        static let intrinsicContentHeight: CGFloat = {
            let thumbnailViewHeight = DefaultQuotationPreviewThumbnailView
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
    private let thumbnailView = DefaultQuotationPreviewThumbnailView()
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
    
    // MARK: - Functions
    func configure(with: QuotationPreviewMainHeaderModel) {
        setThumbnailView(with.thumbnailKeywords)
        setRecommendCarInfoView(with.recommendCarProductOption)
        setSectionDivider(with.firstSectionTitle)
    }
    
    func showAnimation() {
        //thumbnailView.setInitialCarImageForAnimation()
        //thumbnailView.showCarImageAnimation()
    }
    
    // MARK: - Private functions
    
    private func setRecommendCarInfoView(_ carInfo: QuotationPreviewCarInfoModel) {
        recommendCarInfoView.configure(with: carInfo)
    }
    
    private func setSectionDivider(_ title: String) {
        sectionDivider.configureSectionTitle(with: title)
    }
}

// MARK: - LayoutSupportable
extension DefaultQuotationPreviewMainHeader: LayoutSupportable {
    func setupViews() {
        addSubviews([
            thumbnailView,
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
private extension DefaultQuotationPreviewMainHeader {
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
