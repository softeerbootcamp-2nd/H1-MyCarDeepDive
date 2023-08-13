//
//  CommonRecommendCarResultTableViewAdapterDataSource.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/14.
//

protocol CommonRecommendCarResultTableViewAdapterDataSource {
    func cellItem(in section: Int, _ row: Int) -> DetailRecommendCarProductOptionModel
    func numberOfRows(in section: Int) -> Int
    var numberOfSections: Int { get }
}
