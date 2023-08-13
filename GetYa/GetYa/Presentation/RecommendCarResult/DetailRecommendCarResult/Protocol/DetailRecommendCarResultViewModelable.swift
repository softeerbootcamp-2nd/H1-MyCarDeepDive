//
//  DetailRecommendCarResultViewModelable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/09.
//

import Combine

struct DetailRecommendCarResultViewControllerInput {
    let viewDidLoad: AnyPublisher<Void, Never>
    // 이 경우 화면에서 추천된 데이터들을 기반으로 2-1, 3-1화면으로 이동해야 합니다..
    let customButtonEvent: AnyPublisher<Void, Never>
    let quickQuoteEvent: AnyPublisher<Void, Never>
}

enum DetailRecommendCarResultViewControllerState {
    case none
    case updateRecommendThumbnailKeywords
    case gotoCustomPage
    case gotoCompletionPage
}

protocol CharacterSelectSuccessViewModelable: ViewModelable 
where Input == DetailRecommendCarResultViewControllerInput,
      State == DetailRecommendCarResultViewControllerState,
      Output == AnyPublisher<State, Never> { }
