//
//  DetailRecommendCarResultTableViewAdapterDataSource.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

protocol DetailRecommendCarResultTableViewAdapterDataSource: AnyObject {
    var mainSectionHeaderItem: DetailRecommendCarResultMainHeaderModel { get }
    var secondSectionHeaderItem: String { get }
    var secondSectionFooterItem: String { get }
}
