//
//  QuotationPreviewMainHeaderModel+Mock.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/10.
//

import Foundation

extension QuotationPreviewMainHeaderModel {
    fileprivate static let recommendThumbnailKeywords = ["1년 이하", "1인", "출퇴근용", "디자인", "4200만원"]
    
    fileprivate static let sectionHeader = QuotationPreviewHeaderTitleList.first.rawValue
    
    static let mock: Self = .init(
        thumbnailKeywords: recommendThumbnailKeywords,
        recommendCarProductOption: QuotationPreviewCarInfoModel.palisadeMock,
        firstSectionTitle: sectionHeader)
}
