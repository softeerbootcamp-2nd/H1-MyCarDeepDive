//
//  CharacterSelectSuccessStubDataSource.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/10.
//

import Foundation

// TODO: 서버에서 받아와야 하는 데이터
struct CharacterSelectSuccessStubDataSource {
    // header에서 필요한 데이터
    let reccomendCarInfo: RecommendCarInfoModel = .init(
        carKrName: "펠러세이드",
        carEnTrimName: "Prestige",
        carPrice: "43,460,000"+"원",
        carOptions: "가솔린 ・ 2WD ・ 8인승")
    
    // 추천에 의한 결과 데이터
    let recommendCarThumbnailKeywords = ["1년 이하", "1인", "출퇴근용", "디자인", "4200만원"]
    
    // 추천된 차량의 옵션들
    lazy var recommendCarOptionsDataSource: [[RecommendCarProductOptionModel]] = {
        return [sectionOneRecommendColorItems, sectionTwoRecommendOptionItems]
    }()
    
    let sectionHeaderDataSource: [String] = ["색상", "옵션"]
    
    private let sectionOneRecommendColorItems: [RecommendCarProductOptionModel] = [
        .init(optionImage: "recommendOptionBlackColor",
              optionName: "외장 - 크리미 화이트 펄",
              optionPrice: 0,
              optionReview: "75%의 20~30대 구매자들이 선택했어요"),
        .init(optionImage: "recommendOptioncolorchip",
              optionName: "내장 - 인조가죽 (블랙)",
              optionPrice: 2000000,
              optionReview: "75%의 20~30대 구매자들이 선택했어요")]
    
    private let sectionTwoRecommendOptionItems: [RecommendCarProductOptionModel] = [
        .init(optionImage: "recommendOptioncolorchip",
              optionName: "컴포트 II",
              optionPrice: 1090000,
              optionReview: "해당 옵션이 후석 승객 알림이 있어서 좋아요. 뒷자리 아이들을 확인할 수 있거든요."),
        .init(optionImage: "recommendCarOption",
              optionName: "현대 스마트센스 I",
              optionPrice: 790000,
              optionReview: "전방 충돌 방지 보조 기능이 있어 안전을 위해서라면 무조건 추가해야 하는 옵션이에요."),
        .init(optionImage: "recommendOptioncolorchip",
              optionName: "컴포트 II",
              optionPrice: 1090000,
              optionReview: "해당 옵션이 후석 승객 알림이 있어서 좋아요. 뒷자리 아이들을 확인할 수 있거든요."),
        .init(optionImage: "recommendCarOption",
              optionName: "현대 스마트센스 I",
              optionPrice: 790000,
              optionReview: "전방 충돌 방지 보조 기능이 있어 안전을 위해서라면 무조건 추가해야 하는 옵션이에요.")]
}
