//
//  CommonRecommendResultTableViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

// MARK: - View model
struct RecommendCarProductOptionModel {
    let optionImage: String?
    let optionName: String?
    let optionPrice: Int?
    let optionReview: String?
}

// MARK: - ViewModel
class CommonRecommendResultTableViewModel {
    // MARK: - Properties
    private(set) var dataSource: [[RecommendCarProductOptionModel]]
    
    // MARK: - Lifecycles
    init(dataSource: [[RecommendCarProductOptionModel]]) {
        self.dataSource = dataSource
    }
    
    init() {
        dataSource = RecommendCarProductOptionModel.mocks
    }
}

// MARK: - CommonRecommendResultTableViewDataSource
extension CommonRecommendResultTableViewModel: CommonRecommendResultTableViewAdapterDataSource {
    func cellItem(in section: Int, _ row: Int) -> RecommendCarProductOptionModel {
        return dataSource[section][row]
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource[section].count
    }
    
    var numberOfSections: Int {
        dataSource.count
    }
}
