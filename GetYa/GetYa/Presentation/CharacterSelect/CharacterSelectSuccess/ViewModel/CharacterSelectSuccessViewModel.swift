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
    let optionPrice: Int
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
    
    private var dataSource: [[RecommendCarProductOptionModel]] = {
        let sectionOneStubItems: [RecommendCarProductOptionModel] = [
            .init(optionImage: "recommendOptionBlackColor",
                  optionName: "외장 - 크리미 화이트 펄",
                  optionPrice: 0,
                  optionReview: "75%의 20~30대 구매자들이 선택했어요"),
            .init(optionImage: "recommendOptioncolorchip",
                  optionName: "내장 - 인조가죽 (블랙)",
                  optionPrice: 2000000,
                  optionReview: "75%의 20~30대 구매자들이 선택했어요"),
            .init(optionImage: "recommendOptionBlackColor",
                  optionName: "내장 - 인조가죽 (블랙)",
                  optionPrice: 4000000,
                  optionReview: "75%의 20~30대 구매자들이 선택했어요")]
        let sectionSecondStubItems: [RecommendCarProductOptionModel] = [
            .init(optionImage: "recommendOptioncolorchip",
                  optionName: "컴포트 II",
                  optionPrice: 1090000,
                  optionReview: "해당 옵션이 후석 승객 알림이 있어서 좋아요. 뒷자리 아이들을 확인할 수 있거든요."),
            .init(optionImage: "recommendCarOption",
                  optionName: "현대 스마트센스 I",
                  optionPrice: 790000,
                  optionReview: "전방 충돌 방지 보조 기능이 있어 안전을 위해서라면 무조건 추가해야 하는 옵션이에요.")]
        
        return [sectionOneStubItems, sectionSecondStubItems]
    }()
    
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
    // TODO: 이거도 나중에 섹션 헤더만 주는 함수 합쳐버리자,, 리빌딩해야함
    var seciondSectionHeaderItem: String {
        sectionHeaderDataSource[1]
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
    
    var mainSectionHeaderItem: (
        thumbnailKeywords: [String],
        recommendCarProductOption: RecommendCarInfoModel,
        firstSectionTitle: String
    ) {
        (recommendCarThumbnailKeywords, recommendCarInfoModel, sectionHeaderDataSource[0])
    }
}
