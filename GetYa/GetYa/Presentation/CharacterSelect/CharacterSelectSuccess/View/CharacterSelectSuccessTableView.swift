//
//  CharacterSelectSuccessTableView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

import UIKit

final class CharacterSelectSuccessTableView: CommonRecommendResultTableView {
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
            CharacterSelectSuccessMainHeader.self,
            forHeaderFooterViewReuseIdentifier: CharacterSelectSuccessMainHeader.identifier)
        register(
            CharacterSelectSuccesSecondSectionHeader.self,
            forHeaderFooterViewReuseIdentifier: CharacterSelectSuccesSecondSectionHeader.identifier)
        register(
            CharacterSelectSuccessFooter.self,
            forHeaderFooterViewReuseIdentifier: CharacterSelectSuccessFooter.identifier)
        estimatedSectionHeaderHeight = UITableView.automaticDimension
        estimatedSectionFooterHeight = UITableView.automaticDimension
    }
}
