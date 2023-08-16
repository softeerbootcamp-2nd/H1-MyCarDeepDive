//
//  DetailQuotationPreviewSecionHeaderView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/09.
//

import UIKit

final class DetailQuotationPreviewSecionHeaderView: UITableViewHeaderFooterView {
    static let identifier = "DetailQuotationPreviewSecionHeaderView"
    // MARK: - UI properties
    private let sectionTitleAndLineDividerView = CommonQuotationPreviewTitleView()
    
    // MARK: - Lifecycles
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Functions
    func configure(with sectionTitle: String) {
        sectionTitleAndLineDividerView.configureSectionTitle(with: sectionTitle)
    }
}

// MARK: - LayoutSupportable
extension DetailQuotationPreviewSecionHeaderView: LayoutSupportable {
    func setupViews() {
        addSubviews([sectionTitleAndLineDividerView])
    }
    
    func setupConstriants() {
        sectionTitleAndLineDividerViewConstraints()
    }
    
    private func sectionTitleAndLineDividerViewConstraints() {
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
