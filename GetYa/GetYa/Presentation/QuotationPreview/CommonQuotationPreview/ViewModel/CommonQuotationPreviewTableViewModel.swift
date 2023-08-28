//
//  CommonQuotationPreviewTableViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

// MARK: - ViewModel
class CommonQuotationPreviewTableViewModel {
    // MARK: - Properties
    private var dataSource: [[QuotationOption]]
    
    // MARK: - Lifecycles
    init(dataSource: [[QuotationOption]]) {
        self.dataSource = dataSource
    }
    
    // MARK: - Functions
    func setDataSource(with dataSource: [[QuotationOption]]) {
        self.dataSource = dataSource
    }
}

// MARK: - CommonRecommendResultTableViewDataSource
extension CommonQuotationPreviewTableViewModel: CommonQuotationPreviewAdapterDataSource {
    func cellItem(in section: Int, _ row: Int) -> QuotationOption {
        return dataSource[section][row]
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource[section].count
    }
    
    var numberOfSections: Int {
        dataSource.count
    }
}
