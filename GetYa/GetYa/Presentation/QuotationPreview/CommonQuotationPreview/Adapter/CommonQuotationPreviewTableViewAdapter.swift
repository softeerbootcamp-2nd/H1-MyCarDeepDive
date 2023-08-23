//
//  CommonQuotationPreviewTableViewAdapter.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

import UIKit

class CommonQuotationPreviewTableViewAdapter: NSObject {
    // MARK: - Properties
    private var dataSource: CommonQuotationPreviewAdapterDataSource
    
    // MARK: - Lifecycles
    init(
        tableView: UITableView,
        dataSource: CommonQuotationPreviewAdapterDataSource
    ) {
        self.dataSource = dataSource
        super.init()
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension CommonQuotationPreviewTableViewAdapter: UITableViewDataSource {
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
            withIdentifier: CommonQuotationPreviewCell.identifier,
            for: indexPath
        ) as? CommonQuotationPreviewCell else {
            return .init(
                style: .default,
                reuseIdentifier: CommonQuotationPreviewCell.identifier)
        }
        let item = dataSource.cellItem(in: indexPath.section, indexPath.row)
        //cell.configure(with: item)
        return cell
    }
}
