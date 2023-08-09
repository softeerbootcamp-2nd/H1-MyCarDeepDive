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
    let optionImage: String
    let optionName: String
    let optionPrice: String
    let optionReview: String
}

final class CharacterSelectSuccessViewModel {
    // TODO: 서버에서 받아와야 할 데이터
    // MARK: - Properties
    private let recommendCarInfoModel: RecommendCarInfoModel = .init(
        carKrName: "펠러세이드",
        carEnTrimName: "Prestige",
        carPrice: "43,460,000"+"원",
        carOptions: "가솔린 ・ 2WD ・ 8인승")
    private let recommendCarThumbnailKeywords = ["1년 이하", "1인", "출퇴근용", "디자인", "4200만원"]
    
    private var dataSource: [[RecommendCarProductOptionModel]] = [
        [.init(optionImage: "nil", optionName: "가", optionPrice: "나", optionReview: "다"),
         .init(optionImage: "nil", optionName: "라", optionPrice: "마", optionReview: "바")],
        [.init(optionImage: "nil", optionName: "사", optionPrice: "아", optionReview: "자"),
         .init(optionImage: "nil", optionName: "차", optionPrice: "카", optionReview: "파")]]
    
    private var sectionHeaderDataSource: [String] = ["색상", "옵션"]
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
    var numberOfSections: Int {
        dataSource.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource[section].count
    }
    
    func cellItem(in section: Int, _ row: Int) -> RecommendCarProductOptionModel {
        return dataSource[section][row]
    }
    
    var mainSectionHeaderItem: (thumbnailKeywords: [String], recommendCarProductOption: RecommendCarInfoModel, firstSectionTitle: String) {
        (recommendCarThumbnailKeywords, recommendCarInfoModel, sectionHeaderDataSource[0])
    }
}
