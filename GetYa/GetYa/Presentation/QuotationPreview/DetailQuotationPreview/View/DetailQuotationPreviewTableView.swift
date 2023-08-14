//
//  DetailQuotationPreviewTableView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

import UIKit

final class DetailQuotationPreviewTableView: CommonQuotationPreviewTableView {
    // MARK: - Lifecycles
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Private functions
    private func configureUI() {
        register(
            DetailQuotationPreviewMainHeader.self,
            forHeaderFooterViewReuseIdentifier: DetailQuotationPreviewMainHeader.identifier)
        register(
            DetailQuotationPreviewSecionHeaderView.self,
            forHeaderFooterViewReuseIdentifier: DetailQuotationPreviewSecionHeaderView.identifier)
        register(
            DetailQuotationPreviewFooterView.self,
            forHeaderFooterViewReuseIdentifier: DetailQuotationPreviewFooterView.identifier)
        estimatedSectionHeaderHeight = UITableView.automaticDimension
        estimatedSectionFooterHeight = UITableView.automaticDimension
    }
}
