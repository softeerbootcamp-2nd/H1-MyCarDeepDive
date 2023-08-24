//
//  CommonQuotationPreviewTableViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

// MARK: - View model
//struct QuotationPreviewCarProductOptionModel {
//    let optionImage: String
//    let optionName: String
//    let optionPrice: Int
//    let optionReview: String?
//}

// MARK: - ViewModel
class CommonQuotationPreviewTableViewModel {
    // MARK: - Properties
    private var dataSource: [[OptionInfo]]
    
    // MARK: - Lifecycles
    init(dataSource: [[OptionInfo]]) {
        self.dataSource = dataSource
    }
    
    // MARK: - Functions
    func setDataSource(with dataSource: [[OptionInfo]]) {
        self.dataSource = dataSource
    }
}

// MARK: - CommonRecommendResultTableViewDataSource
extension CommonQuotationPreviewTableViewModel: CommonQuotationPreviewAdapterDataSource {
    func cellItem(in section: Int, _ row: Int) -> OptionInfo {
        return dataSource[section][row]
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource[section].count
    }
    
    var numberOfSections: Int {
        dataSource.count
    }
}
