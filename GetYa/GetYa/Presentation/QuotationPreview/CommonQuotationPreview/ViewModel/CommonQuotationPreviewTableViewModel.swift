//
//  CommonQuotationPreviewTableViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

// MARK: - View model
struct DetailRecommendCarProductOptionModel {
    let optionImage: String?
    let optionName: String?
    let optionPrice: Int?
    let optionReview: String?
}

// MARK: - ViewModel
class CommonQuotationPreviewTableViewModel {
    // MARK: - Properties
    private var dataSource: [[DetailRecommendCarProductOptionModel]]
    
    // MARK: - Lifecycles
    init(dataSource: [[DetailRecommendCarProductOptionModel]]) {
        self.dataSource = dataSource
    }
    
    init() {
        dataSource = DetailRecommendCarProductOptionModel.mocks
    }
    
    // MARK: - Functions
    func setDataSource(with dataSource: [[DetailRecommendCarProductOptionModel]]) {
        self.dataSource = dataSource
    }
}

// MARK: - CommonRecommendResultTableViewDataSource
extension CommonQuotationPreviewTableViewModel: CommonQuotationPreviewTableViewAdapterDataSource {
    func cellItem(in section: Int, _ row: Int) -> DetailRecommendCarProductOptionModel {
        return dataSource[section][row]
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource[section].count
    }
    
    var numberOfSections: Int {
        dataSource.count
    }
}
