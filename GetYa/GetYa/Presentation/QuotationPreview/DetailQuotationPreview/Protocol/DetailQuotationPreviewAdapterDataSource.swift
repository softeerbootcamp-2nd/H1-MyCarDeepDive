//
//  DetailQuotationPreviewAdapterDataSource.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

protocol DetailQuotationPreviewAdapterDataSource: AnyObject {
    var mainSectionHeaderItem: QuotationPreviewMainHeaderModel { get }
    var secondSectionHeaderItem: String { get }
    var secondSectionFooterItem: String { get }
}
