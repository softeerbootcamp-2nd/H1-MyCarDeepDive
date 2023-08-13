//
//  CharacterSelectSuccesSecondSectionHeader.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/09.
//

import UIKit

final class CharacterSelectSuccesSecondSectionHeader: UITableViewHeaderFooterView {
    static let id = String(describing: CharacterSelectSuccesSecondSectionHeader.self)
    // MARK: - UI properties
    private let sectionTitleAndLineDividerView = CommonResommendResultSectionDividerTitleView()
    
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
extension CharacterSelectSuccesSecondSectionHeader: LayoutSupportable {
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
