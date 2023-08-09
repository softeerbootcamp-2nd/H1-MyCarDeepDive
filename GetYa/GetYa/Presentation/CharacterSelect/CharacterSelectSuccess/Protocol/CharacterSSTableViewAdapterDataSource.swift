//
//  CharacterSSTableViewAdapterDataSource.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

protocol CharacterSSTableViewAdapterDataSource: AnyObject {
    var numberOfSections: Int { get }
    func numberOfRows(in section: Int) -> Int
    func cellItem(in section: Int, _ row: Int) -> RecommendCarProductOptionModel
    var mainSectionHeaderItem: (
        thumbnailKeywords: [String],
        recommendCarProductOption: RecommendCarInfoModel,
        firstSectionTitle: String) { get }
    var seciondSectionHeaderItem: String { get }
}
