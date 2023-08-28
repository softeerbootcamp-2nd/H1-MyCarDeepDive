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

struct QuestionSlider {
    var minimumCarPrice: Int
    var maximumCarPrice: Int
    
    func description() -> String {
        "\(minimumCarPrice.toPriceFormat)만원 ~ \(maximumCarPrice.toPriceFormat)만원"
    }
}

// 질문은 로컬에서 고정
final class CharacterDetailSelectViewModel {
    // MARK: - Properties
    private var questionDescriptionTexts: [QuestionDescriptionLabelModel] = QuestionDescriptionLabelModel.mock
    private var questionListTexts: [QuestionListTextModel] = QuestionListTextModel.mock
    private var questionSliderViewModel: QuestionSlider = .mock
    private let fetchCompleted = PassthroughSubject<Void, Never>()
    private lazy var userSelectionItems = Array(
        repeating: "",
        count: questionDescriptionTexts.count)
    private lazy var userSelectionIdxList = Array(
        repeating: 0,
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
            userSelectionIdxList[curPageIndex] = itemIndex + 1
            userSelectionItems[curPageIndex] = questionListTexts[curPageIndex].questionTexts[itemIndex]
            return .gotoNextQuestionPage
        }.eraseToAnyPublisher()
    }
    
    private func touchUpCompletionButtonStream(input: Input) -> Output {
        return input.touchUpCompletionButton
            .map { [weak self] (maxPrice: Int?) -> State in
                guard let self else { return .none }
                userSelectionIdxList[questionDescriptionTexts.count-1] = maxPrice ?? 4200
                userSelectionItems[questionDescriptionTexts.count - 1] = "\(questionSliderViewModel.minimumCarPrice)만원"
                return .gotoDetailQuotationPreviewPage(
                    userSelection: userSelectionItems,
                    userSelectIndexList: userSelectionIdxList)
            }.eraseToAnyPublisher()
    }
    
    private func viewLoadStream(input: Input) -> Output {
        return input.viewLoad
            .map { [weak self] in
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
