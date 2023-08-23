//
//  DefaultQuotationPreviewViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/18.
//

import Foundation
import Combine

// MARK: - View Model
struct DefaultQuotationPreviewMainHeaderModel {
    var carName: String
    var carImageUrl: String
    var recommendCarProductOption: QuotationPreviewCarInfoModel
    var firstSectionTitle: String
}

extension DefaultQuotationPreviewMainHeaderModel {
    static let mock: Self = .init(
        carName: "펠리세이드 - Prestige",
        carImageUrl: "characterSelectSuccessCar",
        recommendCarProductOption: .palisadeMock,
        firstSectionTitle: "색상")
}

final class DefaultQuotationPreviewViewModel: CommonQuotationPreviewTableViewModel {
    // TODO: 서버에서 받아와야 할 데이터
    // MARK: - Properties
    private var mainSectionHeader: DefaultQuotationPreviewMainHeaderModel
    private var sectionHeaders: [String]
    private var secondSectionFooter: String
    override init(dataSource: [[OptionInfo]]) {
        mainSectionHeader = .mock
        sectionHeaders = QuotationPreviewHeaderTitleList.lists
        secondSectionFooter = "48,120,000원"
        super.init(dataSource: dataSource)
    }
}

// MARK: - CharacterSelectSuccessViewModelable
extension DefaultQuotationPreviewViewModel: DefaultQuotationPreviewViewModelable {
    func transform(input: Input) -> Output {
        return Publishers.MergeMany(
            customButtonEventChains(input),
            quickQuoteEventChains(input),
            viewDidLoadChains(input)
        ).eraseToAnyPublisher()
    }
}

// MARK: - CharacterSelectSuccessViewModelable private function
private extension DefaultQuotationPreviewViewModel {
    func customButtonEventChains(_ input: Input) -> Output {
        return input.customButtonEvent
            .map { _ -> State in return .gotoCustomPage }
            .eraseToAnyPublisher()
    }
    
    // 서버에서 받아와서 업데이트?!
    func quickQuoteEventChains(_ input: Input) -> Output {
        return input.quickQuoteEvent
            .map { _ -> State in return .updateViewWithData }
            .eraseToAnyPublisher()
    }
    
    func viewDidLoadChains(_ input: Input) -> Output {
        return input.viewDidLoad
            .map { _ -> State in return .none }
            .eraseToAnyPublisher()
    }
}

// MARK: - CharacterSSTableViewAdapterDataSource
extension DefaultQuotationPreviewViewModel: DefaultQuotationPreviewAdapterDataSource {
    var secondSectionFooterItem: String {
        secondSectionFooter
    }
    
    var mainSectionHeaderItem: DefaultQuotationPreviewMainHeaderModel {
        mainSectionHeader
    }
    
    var secondSectionHeaderItem: String {
        sectionHeaders[1]
    }
}
