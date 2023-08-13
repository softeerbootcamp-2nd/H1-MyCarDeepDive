//
//  CharacterSelectSuccessViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/09.
//

import Foundation
import Combine

// MARK: - View Model
struct RecommendCarInfoModel {
    var carKrName: String
    var carEnTrimName: String
    var carPrice: String
    var carOptions: String
}

struct MainSectionHeaderModel {
    var thumbnailKeywords: [String]
    var recommendCarProductOption: RecommendCarInfoModel
    var firstSectionTitle: String
}

final class CharacterSelectSuccessViewModel: CommonRecommendResultTableViewModel {
    // TODO: 서버에서 받아와야 할 데이터
    // MARK: - Properties
    private var mainSectionHeader: MainSectionHeaderModel
    private var sectionHeaders: [String]
    private var secondSectionFooter: String
    
    override init() {
        mainSectionHeader = .mock
        sectionHeaders = CharacterSelectSuccessSectionHeaders.lists
        secondSectionFooter = "48,120,000원"
        super.init(dataSource: RecommendCarProductOptionModel.mocks)
    }
}

// MARK: - CharacterSelectSuccessViewModelable
extension CharacterSelectSuccessViewModel: CharacterSelectSuccessViewModelable {
    func transform(input: Input) -> Output {
        return Publishers.MergeMany(
            customButtonEventChains(input),
            quickQuoteEventChains(input),
            viewDidLoadChains(input)
        ).eraseToAnyPublisher()
    }
}

// MARK: - CharacterSelectSuccessViewModelable private function
private extension CharacterSelectSuccessViewModel {
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
extension CharacterSelectSuccessViewModel: CharacterSSTableViewAdapterDataSource {
    var secondSectionFooterItem: String {
        secondSectionFooter
    }
    
    var mainSectionHeaderItem: MainSectionHeaderModel {
        mainSectionHeader
    }
    
    var secondSectionHeaderItem: String {
        sectionHeaders[1]
    }
}
