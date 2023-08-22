//
//  DefaultQuotationPreviewTableViewAdapter.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/19.
//

import UIKit

protocol DefaultQuotationPreviewAdapterDataSource {
    var mainSectionHeaderItem: DefaultQuotationPreviewMainHeaderModel { get }
    var secondSectionHeaderItem: String { get }
    var secondSectionFooterItem: String { get }
}

final class DefaultQuotationPreviewTableViewAdapter: CommonQuotationPreviewTableViewAdapter {
    // MARK: - Properties
    private var dataSource: DefaultQuotationPreviewAdapterDataSource
    private var isWorkedMainHeaderInitialAnimation = false
    
    // MARK: - Lifecycles
    init(
        tableView: UITableView,
        dataSource: DefaultQuotationPreviewAdapterDataSource
        & CommonQuotationPreviewAdapterDataSource
    ) {
        self.dataSource = dataSource
        super.init(tableView: tableView, dataSource: dataSource)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDelegate
extension DefaultQuotationPreviewTableViewAdapter: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        willDisplayHeaderView view: UIView,
        forSection section: Int
    ) {
        guard
            !isWorkedMainHeaderInitialAnimation,
            section == 0,
            let header = view as? DefaultQuotationPreviewMainHeader
        else { return }
        isWorkedMainHeaderInitialAnimation.toggle()
        header.showAnimation()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0, let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: DefaultQuotationPreviewMainHeader.identifier
        ) as? DefaultQuotationPreviewMainHeader {
            return header.set { $0.configure(with: dataSource.mainSectionHeaderItem) }
        } else if section == 1, let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: DetailQuotationPreviewSecionHeaderView.identifier
        ) as? DetailQuotationPreviewSecionHeaderView {
            return header.set { $0.configure(with: dataSource.secondSectionHeaderItem) }
        }
        return .init(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return DefaultQuotationPreviewMainHeader.Constants.intrinsicContentHeight
        } else if section == 1 {
            return CommonQuotationPreviewTitleView
                .Constants.intrinsicContentHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return DetailQuotationPreviewFooterView.Constants.intrinsicContentHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1, let footer = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: DetailQuotationPreviewFooterView.identifier
        ) as? DetailQuotationPreviewFooterView {
            return footer.set {
                $0.configure(with: dataSource.secondSectionFooterItem)
            }
        }
        return nil
    }
}

// MARK: - UIScrollViewDelegate
extension DefaultQuotationPreviewTableViewAdapter {
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
