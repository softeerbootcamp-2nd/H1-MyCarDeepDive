//
//  QuestionListTextModel+Mock.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import Foundation

extension QuestionListTextModel {
    static let mock: [Self] = [
        .init(questionTexts: ["1년 이하", "1년 이상 - 5년 미만", "5년 이상"]),
        .init(questionTexts: ["1인", "2인", "3-4인", "5인 이상"]),
        .init(questionTexts: ["출퇴근용", "레저용", "가정용", "업무용"]),
        .init(questionTexts: ["디자인", "성능", "안전", "편의성"])]
}
