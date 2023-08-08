//
//  CharacterSelectSuccessTableViewAdapter.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

import UIKit

final class CharacterSelectSuccessTableViewAdapter: NSObject {
    private var dataSource: CharacterSSTableViewAdapterDataSource
    
    init(
        tableView: UITableView,
        dataSource: CharacterSSTableViewAdapterDataSource
    ) {
        self.dataSource = dataSource
        super.init()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension CharacterSelectSuccessTableViewAdapter: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch section {
        case 0:
            return dataSource.numberOfFirstSectionItems
        case 1:
            return dataSource.numberOfSectionSectionItems
        default:
            return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let index = indexPath.row
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterSelectSuccessTableViewCell.id,
            for: indexPath) as? CharacterSelectSuccessTableViewCell
        else {
            return .init(style: .default, reuseIdentifier: CharacterSelectSuccessTableViewCell.id)
        }
        var item: RecommendCarProductOptionModel
        switch indexPath.section {
        case 0:
            item = dataSource.firstSectionCellItem(at: index)
        case 1:
            item = dataSource.secondSectionCellItem(at: index)
        default:
            return .init(style: .default, reuseIdentifier: CharacterSelectSuccessTableViewCell.id)
        }
        // TODO: 이거 해야함
        print(item)
        return cell
    }
}

extension CharacterSelectSuccessTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            section == 0,
            let header = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: CharacterSelectSuccessMainHeader.id
            ) as? CharacterSelectSuccessMainHeader
        else { return nil }
        let thumbnailKeywords = dataSource.mainSectionHeaderItem.thumbnailKeywords
        let carProductionOption = dataSource.mainSectionHeaderItem.recommendCarProductOption
        let firstSectionTitle = dataSource.mainSectionHeaderItem.firstSectionTitle
        return header.set {
            $0.configure(
                thumbnailKeywordTexts: thumbnailKeywords,
                recommendCarInfo: carProductionOption,
                firstSectionTitle: firstSectionTitle)
        }
    }
}
