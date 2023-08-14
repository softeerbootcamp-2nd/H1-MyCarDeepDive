//
//  CommonQuotationPreviewTableViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

// MARK: - View model
struct QuotationPreviewCarProductOptionModel {
    let optionImage: String?
    let optionName: String?
    let optionPrice: Int?
    let optionReview: String?
}

// MARK: - ViewModel
class CommonQuotationPreviewTableViewModel {
    // MARK: - Properties
    private var dataSource: [[QuotationPreviewCarProductOptionModel]]
    
    // MARK: - Lifecycles
    init(dataSource: [[QuotationPreviewCarProductOptionModel]]) {
        self.dataSource = dataSource
    }
    
    init() {
        dataSource = QuotationPreviewCarProductOptionModel.mocks
    }
    
    // MARK: - Functions
    func setDataSource(with dataSource: [[QuotationPreviewCarProductOptionModel]]) {
        self.dataSource = dataSource
    }
}

// MARK: - CommonRecommendResultTableViewDataSource
extension CommonQuotationPreviewTableViewModel: CommonQuotationPreviewTableViewAdapterDataSource {
    func cellItem(in section: Int, _ row: Int) -> QuotationPreviewCarProductOptionModel {
        return dataSource[section][row]
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource[section].count
    }
    
    var numberOfSections: Int {
        dataSource.count
    }
}
