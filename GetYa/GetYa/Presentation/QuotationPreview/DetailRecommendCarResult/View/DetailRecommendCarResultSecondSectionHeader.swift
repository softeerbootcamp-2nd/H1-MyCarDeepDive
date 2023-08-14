//
//  DetailRecommendCarResultSecondSectionHeader.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/09.
//

import UIKit

final class DetailRecommendCarResultSecondSectionHeader: UITableViewHeaderFooterView {
    static let identifier = "DetailRecommendCarResultSecondSectionHeader"
    // MARK: - UI properties
    private let sectionTitleAndLineDividerView = CommonQuotationPreviewTitleView()
    
    // MARK: - Lifecycles
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureSubviewUI(with: sectionTitleAndLineDividerView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Functions
    func configure(with sectionTitle: String) {
        sectionTitleAndLineDividerView.configureSectionTitle(with: sectionTitle)
    }
}

// MARK: - LayoutSupportable
extension DetailRecommendCarResultSecondSectionHeader: LayoutSupportable {
    func configureConstraints() {
        NSLayoutConstraint.activate([
            sectionTitleAndLineDividerView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            sectionTitleAndLineDividerView.topAnchor.constraint(
                equalTo: topAnchor),
            sectionTitleAndLineDividerView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            sectionTitleAndLineDividerView.bottomAnchor.constraint(
                equalTo: bottomAnchor)])
    }
}
