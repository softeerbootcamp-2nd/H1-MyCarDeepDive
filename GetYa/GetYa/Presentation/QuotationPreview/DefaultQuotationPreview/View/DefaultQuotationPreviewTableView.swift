//
//  DefaultQuotationPreviewTableView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/18.
//

import UIKit

final class DefaultQuotationPreviewTableView: CommonQuotationPreviewTableView {
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
            DefaultQuotationPreviewMainHeader.self,
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
