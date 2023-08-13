//
//  DetailRecommendCarResultTableViewAdapter.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

import UIKit

final class DetailRecommendCarResultTableViewAdapter: CommonRecommendCarResultTableViewAdapter {
    // MARK: - Properties
    private var dataSource: DetailRecommendCarResultTableViewAdapterDataSource
    private var isWorkedMainHeaderInitialAnimation = false
    
    // MARK: - Lifecycles
    init(
        tableView: UITableView,
        dataSource: DetailRecommendCarResultTableViewAdapterDataSource
        & CommonRecommendCarResultTableViewAdapterDataSource
    ) {
        self.dataSource = dataSource
        super.init(tableView: tableView, dataSource: dataSource)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDelegate
extension DetailRecommendCarResultTableViewAdapter: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        willDisplayHeaderView view: UIView,
        forSection section: Int
    ) {
        guard
            !isWorkedMainHeaderInitialAnimation,
            section == 0,
            let header = view as? DetailRecommendCarResultMainHeader
        else { return }
        isWorkedMainHeaderInitialAnimation.toggle()
        header.showAnimation()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0, let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: DetailRecommendCarResultMainHeader.identifier
        ) as? DetailRecommendCarResultMainHeader {
            return header.set { $0.configure(with: dataSource.mainSectionHeaderItem) }
        } else if section == 1, let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: DetailRecommendCarResultSecondSectionHeader.identifier
        ) as? DetailRecommendCarResultSecondSectionHeader {
            return header.set { $0.configure(with: dataSource.secondSectionHeaderItem) }
        }
        return .init(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return DetailRecommendCarResultMainHeader.Constants.intrinsicContentHeight
        } else if section == 1 {
            return CommonRecommendCarResultSectionDividerTitleView
                .Constants.intrinsicContentHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return DetailRecommendCarResultFooter.Constants.intrinsicContentHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1, let footer = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: DetailRecommendCarResultFooter.identifier
        ) as? DetailRecommendCarResultFooter {
            return footer.set {
                $0.configure(with: dataSource.secondSectionFooterItem)
            }
        }
        return nil
    }
}

// MARK: - UIScrollViewDelegate
extension DetailRecommendCarResultTableViewAdapter {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard isWorkedMainHeaderInitialAnimation else { return }
        let offSetY = scrollView.contentOffset.y
        let svContentHeight = scrollView.contentSize.height
        let scrollableMaximumY = svContentHeight - scrollView.bounds.height
        if offSetY < 0 {
            scrollView.contentOffset.y = 0
        } else if offSetY > scrollableMaximumY {
            scrollView.contentOffset.y = scrollableMaximumY
        }
    }
}
