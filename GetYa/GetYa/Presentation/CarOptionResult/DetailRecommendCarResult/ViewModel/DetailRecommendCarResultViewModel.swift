//
//  DetailRecommendCarResultViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/09.
//

import Foundation
import Combine

// MARK: - View Model
struct DetailRecommendCarInfoModel {
    var carKrName: String
    var carEnTrimName: String
    var carPrice: String
    var carOptions: String
}

struct DetailRecommendCarResultMainHeaderModel {
    var thumbnailKeywords: [String]
    var recommendCarProductOption: DetailRecommendCarInfoModel
    var firstSectionTitle: String
}

final class DetailRecommendCarResultViewModel: CommonRecommendResultTableViewModel {
    // TODO: 서버에서 받아와야 할 데이터
    // MARK: - Properties
    private var mainSectionHeader: DetailRecommendCarResultMainHeaderModel
    private var sectionHeaders: [String]
    private var secondSectionFooter: String
    
    override init() {
        mainSectionHeader = .mock
        sectionHeaders = DetailRecommendCarResultSectionHeaders.lists
        secondSectionFooter = "48,120,000원"
        super.init(dataSource: DetailRecommendCarProductOptionModel.mocks)
    }
}

// MARK: - CharacterSelectSuccessViewModelable
extension DetailRecommendCarResultViewModel: CharacterSelectSuccessViewModelable {
    func transform(input: Input) -> Output {
        return Publishers.MergeMany(
            customButtonEventChains(input),
            quickQuoteEventChains(input),
            viewDidLoadChains(input)
        ).eraseToAnyPublisher()
    }
}

// MARK: - CharacterSelectSuccessViewModelable private function
private extension DetailRecommendCarResultViewModel {
    func customButtonEventChains(_ input: Input) -> Output {
        return input.customButtonEvent
            .map { _ -> State in return .gotoCustomPage }
            .eraseToAnyPublisher()
    }
    
    // 서버에서 받아와서 업데이트?!
    func quickQuoteEventChains(_ input: Input) -> Output {
        return input.quickQuoteEvent
            .map { _ -> State in return .updateRecommendThumbnailKeywords }
            .eraseToAnyPublisher()
    }
    
    func viewDidLoadChains(_ input: Input) -> Output {
        return input.viewDidLoad
            .map { _ -> State in return .none }
            .eraseToAnyPublisher()
    }
}

// MARK: - CharacterSSTableViewAdapterDataSource
extension DetailRecommendCarResultViewModel: DetailRecommendCarResultTableViewAdapterDataSource {
    var secondSectionFooterItem: String {
        secondSectionFooter
    }
    
    var mainSectionHeaderItem: DetailRecommendCarResultMainHeaderModel {
        mainSectionHeader
    }
    
    var secondSectionHeaderItem: String {
        sectionHeaders[1]
    }
}
