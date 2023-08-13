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

struct RecommendCarProductOptionModel {
    let optionImage: String?
    let optionName: String?
    let optionPrice: Int?
    let optionReview: String?
}

struct MainSectionHeaderModel {
    var thumbnailKeywords: [String]
    var recommendCarProductOption: RecommendCarInfoModel
    var firstSectionTitle: String
}

final class CharacterSelectSuccessViewModel {
    // TODO: 서버에서 받아와야 할 데이터
    // MARK: - Properties
    private var dataSource: [[RecommendCarProductOptionModel]]
    private var mainSectionHeader: MainSectionHeaderModel
    private var sectionHeaders: [String]
    private var secondSectionFooter: String
    
    init() {
        mainSectionHeader = .mock
        dataSource = RecommendCarProductOptionModel.mocks
        sectionHeaders = CharacterSelectSuccessSectionHeaders.lists
        secondSectionFooter = "48,120,000원"
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
    
    // TODO: 이거도 나중에 섹션 헤더만 주는 함수 합쳐버리자,, 리빌딩해야함
    var secondSectionHeaderItem: String {
        sectionHeaders[1]
    }
    
    var numberOfSections: Int {
        dataSource.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource[section].count
    }
    
    func cellItem(in section: Int, _ row: Int) -> RecommendCarProductOptionModel {
        return dataSource[section][row]
    }
}
