//
//  CharacterDetailSelectViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import Foundation
import Combine

// MARK: - View model
struct QuestionDescriptionLabelModel {
    var defaultText: String
    var highlightText: String
}

struct QuestionListTextModel {
    var questionTexts: [String]
    
    var count: Int {
        questionTexts.count
    }
}

struct QuestionSliderViewModel {
    var minimumCarPrice: Int
    var maximumCarPrice: Int
    
    func description() -> String {
        "\(minimumCarPrice.toPriceFormat)만원 ~ \(maximumCarPrice.toPriceFormat)만원"
    }
}

// 고민TODO: - 선택 정보를 저장해야하는데 골라야 할 목차가 5개가 아니라 여러개가된다면?..
final class CharacterDetailSelectViewModel {
    // MARK: - Properties
    private var questionDescriptionTexts: [QuestionDescriptionLabelModel] = QuestionDescriptionLabelModel.mock
    private var questionListTexts: [QuestionListTextModel] = QuestionListTextModel.mock
    private var questionSliderViewModel: QuestionSliderViewModel = .mock
    private let fetchCompleted = PassthroughSubject<Void, Never>()
    private lazy var userSelectionItems = Array(
        repeating: "",
        count: questionDescriptionTexts.count)
}

extension CharacterDetailSelectViewModel: CharacterDetailSelectViewModelabe {
    func transform(input: Input) -> Output {
        
        return Publishers.MergeMany([
            touchUpNextButtonStream(input: input),
            touchUpCompletionButtonStream(input: input),
            viewLoadStream(input: input),
            fetchCompletedStream()
        ]).eraseToAnyPublisher()
    }
    private func touchUpNextButtonStream(input: Input) -> Output {
        return input.touchUpNextButton.map { [weak self] (curPageIndex: Int, itemIndex: Int?) -> State in
            guard let itemIndex, let self else { return .none }
            userSelectionItems[curPageIndex] = questionListTexts[curPageIndex].questionTexts[itemIndex]
            return .gotoNextQuestionPage
        }.eraseToAnyPublisher()
    }
    
    private func touchUpCompletionButtonStream(input: Input) -> Output {
        return input.touchUpCompletionButton
            .map { [weak self] (maxPrice: Int?) -> State in
                guard let self else { return .none }
                // 태그 표시는 항상 최소가로
                userSelectionItems[questionDescriptionTexts.count - 1] = "\(questionSliderViewModel.minimumCarPrice)만원"
                // TODO: 서버한테 maxPrice 포함 사용자의 선택 5개 전송
                return .gotoDetailQuotationPreviewPage(userSelection: userSelectionItems)
            }.eraseToAnyPublisher()
    }
    
    private func viewLoadStream(input: Input) -> Output {
        return input.viewLoad
            .map { [weak self] in
                // TODO: 서버에서 question title 및 dscription, question list 받아와야 합니다.
                // fetch 로직 후 아래 함수 호출
                self?.fetchCompleted.send()
                return .none
            }.eraseToAnyPublisher()
    }
    
    private func fetchCompletedStream() -> Output {
        return fetchCompleted.map { [weak self] _ -> State in
            guard let self else { return .none }
            return .makeQuestions(
                numberOfSteps: questionDescriptionTexts.count,
                questionList: questionListTexts,
                questionDescriptions: questionDescriptionTexts,
                priceRange: questionSliderViewModel)
        }.eraseToAnyPublisher()
    }
}
