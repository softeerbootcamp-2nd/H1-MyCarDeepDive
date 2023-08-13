//
//  RecommendCarProductOptionModel+Mock.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/10.
//

import Foundation

extension RecommendCarProductOptionModel {
    fileprivate static let colorProducts: [Self] = [
        RecommendCarProductOptionModel(optionImage: "recommendOptionBlackColor",
              optionName: "외장 - 크리미 화이트 펄",
              optionPrice: 0,
              optionReview: "75%의 20~30대 구매자들이 선택했어요"),
        RecommendCarProductOptionModel(optionImage: "recommendOptioncolorchip",
              optionName: "내장 - 인조가죽 (블랙)",
              optionPrice: 2000000,
              optionReview: "75%의 20~30대 구매자들이 선택했어요")]
    
    fileprivate static let optionProducts: [Self] = [
        .init(optionImage: "recommendOptioncolorchip",
              optionName: "컴포트 II",
              optionPrice: 1090000,
              optionReview: "해당 옵션이 후석 승객 알림이 있어서 좋아요. 뒷자리 아이들을 확인할 수 있거든요."),
        .init(optionImage: "recommendCarOption",
              optionName: "현대 스마트센스 III",
              optionPrice: 1190000,
              optionReview: "전방 충돌 방지 보조 기능이 있어 안전을 위해서라면 무조건 추가해야 하는 옵션이에요. 안전을 위해서라도 강력 추천 합니다. 후회하지 않는 선택이 되실거에요."),
        .init(optionImage: "recommendOptioncolorchip",
              optionName: "컴포트 III",
              optionPrice: 1390000,
              optionReview: "해당 옵션이 후석 승객 알림이 있어서 좋아요. 뒷자리 아이들을 확인할 수 있거든요."),
        .init(optionImage: "recommendCarOption",
              optionName: "현대 스마트센스 ㅌI",
              optionPrice: 790000,
              optionReview: "전방 충돌 방지 보조 기능이 있어 안전을 위해서라면 무조건 추가해야 하는 옵션이에요.")]
    
    static let mocks: [[Self]] = [
        RecommendCarProductOptionModel.colorProducts,
        RecommendCarProductOptionModel.optionProducts]
}
