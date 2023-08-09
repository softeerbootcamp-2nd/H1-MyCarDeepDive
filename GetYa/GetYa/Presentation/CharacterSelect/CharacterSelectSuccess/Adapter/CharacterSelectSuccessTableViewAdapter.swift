//
//  CharacterSelectSuccessTableViewAdapter.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

import UIKit

final class CharacterSelectSuccessTableViewAdapter: NSObject {
    private var dataSource: CharacterSSTableViewAdapterDataSource
    private var isShowedFirstTime = false
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return dataSource.numberOfRows(in: section)
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
        item = dataSource.cellItem(in: indexPath.section, indexPath.row)
        
        // TODO: 이거 셀 만들고 레이아웃 해야함
        print(item)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CharacterSelectSuccessTableViewAdapter: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        willDisplayHeaderView view: UIView,
        forSection section: Int
    ) {
        if section == 0, !isShowedFirstTime {
            guard let header = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: CharacterSelectSuccessMainHeader.id
            ) as? CharacterSelectSuccessMainHeader else {
                return
            }
            isShowedFirstTime.toggle()
            header.showAnimation()
        }
    }

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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            print(CharacterSelectSuccessMainHeader.Constant.intrinsicContentHeight)
            return CharacterSelectSuccessMainHeader.Constant.intrinsicContentHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
