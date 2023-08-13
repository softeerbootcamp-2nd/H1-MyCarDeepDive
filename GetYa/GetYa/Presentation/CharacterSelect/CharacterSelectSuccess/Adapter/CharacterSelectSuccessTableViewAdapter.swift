//
//  CharacterSelectSuccessTableViewAdapter.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

import UIKit

final class CharacterSelectSuccessTableViewAdapter: NSObject {
    // MARK: - Properties
    private var dataSource: CharacterSSTableViewAdapterDataSource
    private var isWorkedMainHeaderInitialAnimation = false
    private var isConfiguredMainHeader = false
    
    // MARK: - Lifecycles
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
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CommonRecommendResultTableViewCell.id,
            for: indexPath
        ) as? CommonRecommendResultTableViewCell else {
            return .init(
                style: .default,
                reuseIdentifier: CommonRecommendResultTableViewCell.id)
        }
        var item: RecommendCarProductOptionModel
        item = dataSource.cellItem(in: indexPath.section, indexPath.row)
        cell.configure(with: item)
        return cell
    }
}

// TODO: 리뷰 line만큼 계산된 tableView cell dynamic한 높이로 반영 해야합니다.
// MARK: - UITableViewDelegate
extension CharacterSelectSuccessTableViewAdapter: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        willDisplayHeaderView view: UIView,
        forSection section: Int
    ) {
        guard
            !isWorkedMainHeaderInitialAnimation,
            section == 0,
            let header = view as? CharacterSelectSuccessMainHeader
        else { return }
        isWorkedMainHeaderInitialAnimation.toggle()
        header.showAnimation()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0, let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: CharacterSelectSuccessMainHeader.id
        ) as? CharacterSelectSuccessMainHeader {
            return header.set { $0.configure(with: dataSource.mainSectionHeaderItem) }
        } else if section == 1, let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: CharacterSelectSuccesSecondSectionHeader.id
        ) as? CharacterSelectSuccesSecondSectionHeader {
            return header.set { $0.configure(with: dataSource.secondSectionHeaderItem) }
        }
        return .init(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CharacterSelectSuccessMainHeader.Constant.intrinsicContentHeight
        } else if section == 1 {
            return CommonResommendResultSectionDividerTitleView
                .Constant.intrinsicContentHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return CharacterSelectSuccessFooter.Constants.intrinsicContentHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1, let footer = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: CharacterSelectSuccessFooter.id
        ) as? CharacterSelectSuccessFooter {
            return footer.set {
                $0.configure(with: dataSource.secondSectionFooterItem)
            }
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CommonRecommendResultTableViewCell.Constant.intrinsicContentHeight
    }
}

// MARK: - UIScrollViewDelegate
extension CharacterSelectSuccessTableViewAdapter {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let svContentHeight = scrollView.contentSize.height
        let scrollableMaximumY = svContentHeight - scrollView.bounds.height
        guard scrollableMaximumY > 0 else { return }
        if offSetY < 0 {
            scrollView.contentOffset.y = 0
        } else if offSetY > scrollableMaximumY {
            scrollView.contentOffset.y = scrollableMaximumY
        }
    }
}
