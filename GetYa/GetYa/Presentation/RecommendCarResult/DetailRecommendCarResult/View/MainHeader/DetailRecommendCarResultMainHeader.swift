//
//  DetailRecommendCarResultMainHeader.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

import UIKit

final class DetailRecommendCarResultMainHeader: UITableViewHeaderFooterView {
    static let identifier = "DetailRecommendCarResultMainHeader"
    enum Constants {
        static let intrinsicContentHeight: CGFloat = {
            let thumbnailViewHeight = DetailRecommendCarResultThumbnailView
            .Constants
            .intrinsicContentHeight
            let recommendCarInfoHeight = CommonRecommendResultCarInfoView
                .Constants
                .intrinsicContentHeight
            let sectionDividerHeight = CommonRecommendResultSectionDividerTitleView
                .Constants
                .intrinsicContentHeight
            return thumbnailViewHeight + recommendCarInfoHeight + sectionDividerHeight
        }()
    }
    
    // MARK: - UI properties
    private let thumbnailView = DetailRecommendCarResultThumbnailView()
    private let recommendCarInfoView = CommonRecommendResultCarInfoView()
    private let sectionDivider = CommonRecommendResultSectionDividerTitleView()
    
    // MARK: - Lifecycles
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureSubviewUI(
            with: thumbnailView,
            recommendCarInfoView,
            sectionDivider)
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviewUI(
            with: thumbnailView,
            recommendCarInfoView,
            sectionDivider)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailView.prepareForReuse()
    }
    
    // MARK: - Functions
    func configure(with: DetailRecommendCarResultMainHeaderModel) {
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
    
    private func setRecommendCarInfoView(_ carInfo: DetailRecommendCarInfoModel) {
        recommendCarInfoView.configure(with: carInfo)
    }
    
    private func setSectionDivider(_ title: String) {
        sectionDivider.configureSectionTitle(with: title)
    }
}

// MARK: - LayoutSupportable
extension DetailRecommendCarResultMainHeader: LayoutSupportable {
    func configureConstraints() {
        _=[thumbnailViewConstraints,
           recommendCarInfoConstraints,
           sectionDividerConstraints
        ].map { NSLayoutConstraint.activate($0) }
    }
}

// MARK: - LayoutSupportable private functions
private extension DetailRecommendCarResultMainHeader {
    var thumbnailViewConstraints: [NSLayoutConstraint] {
        [thumbnailView.leadingAnchor.constraint(
            equalTo: leadingAnchor),
         thumbnailView.trailingAnchor.constraint(
            equalTo: trailingAnchor),
         thumbnailView.topAnchor.constraint(equalTo: topAnchor)]
    }
    
    var recommendCarInfoConstraints: [NSLayoutConstraint] {
        [recommendCarInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
         recommendCarInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
         recommendCarInfoView.topAnchor.constraint(equalTo: thumbnailView.bottomAnchor)]
    }
    
    var sectionDividerConstraints: [NSLayoutConstraint] {
        [sectionDivider.leadingAnchor.constraint(equalTo: leadingAnchor),
         sectionDivider.trailingAnchor.constraint(equalTo: trailingAnchor),
         sectionDivider.topAnchor.constraint(equalTo: recommendCarInfoView.bottomAnchor),
         sectionDivider.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor)]
    }
}
