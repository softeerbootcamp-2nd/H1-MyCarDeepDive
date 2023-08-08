//
//  CharacterSSTableViewAdapterDataSource.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

protocol CharacterSSTableViewAdapterDataSource: AnyObject {
    var numberOfFirstSectionItems: Int { get }
    var numberOfSectionSectionItems: Int { get }
    func firstSectionCellItem(
        at index: Int
    ) -> RecommendCarProductOptionEntity
    func secondSectionCellItem(
        at index: Int
    ) -> RecommendCarProductOptionEntity
    var mainSectionHeaderItem: (
        thumbnailKeywords: [String],
        recommendCarProductOption: RecommendCarInfoEntity,
        firstSectionTitle: String) { get }
}
