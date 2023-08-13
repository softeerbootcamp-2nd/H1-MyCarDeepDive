//
//  DetailRecommendCarResultTableView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

import UIKit

final class DetailRecommendCarResultTableView: CommonRecommendResultTableView {
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
            DetailRecommendCarResultMainHeader.self,
            forHeaderFooterViewReuseIdentifier: DetailRecommendCarResultMainHeader.identifier)
        register(
            DetailRecommendCarResultSecondSectionHeader.self,
            forHeaderFooterViewReuseIdentifier: DetailRecommendCarResultSecondSectionHeader.identifier)
        register(
            DetailRecommendCarResultFooter.self,
            forHeaderFooterViewReuseIdentifier: DetailRecommendCarResultFooter.identifier)
        estimatedSectionHeaderHeight = UITableView.automaticDimension
        estimatedSectionFooterHeight = UITableView.automaticDimension
    }
}
