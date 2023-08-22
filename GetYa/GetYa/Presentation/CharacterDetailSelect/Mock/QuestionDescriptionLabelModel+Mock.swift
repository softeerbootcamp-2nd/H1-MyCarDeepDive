//
//  QuestionDescriptionLabelModel+Mock.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import Foundation

extension QuestionDescriptionLabelModel {
    static let mock: [Self] = [
        .init(defaultText: "운전 경력이 어떻게 되세요?", highlightText: "운전 경력"),
        .init(defaultText: "가족 구성원이 몇 명인가요?", highlightText: "가족 구성원"),
        .init(defaultText: "어떤 목적으로 주로 차를 타시나요?", highlightText: "어떤 목적"),
        .init(defaultText: "자동차를 살 때 어떤 가치가\n가장 중요한가요?", highlightText: "어떤 가치"),
        .init(defaultText: "최대 예산이 얼마인가요?", highlightText: "최대 예산")]
}
