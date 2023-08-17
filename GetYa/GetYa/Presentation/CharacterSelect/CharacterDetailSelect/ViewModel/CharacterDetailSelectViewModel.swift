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
        "\(minimumCarPrice.insertCommas)만원 ~ \(maximumCarPrice.insertCommas)만원"
    }
}

// 고민TODO: - 선택 정보를 저장해야하는데 골라야 할 목차가 5개가 아니라 여러개가된다면?..
final class CharacterDetailSelectViewModel {
    // MARK: - Properties
    private var questionDescriptionTexts: [QuestionDescriptionLabelModel] = QuestionDescriptionLabelModel.mock
    private var questionListTexts: [QuestionListTextModel] = QuestionListTextModel.mock
    private var questionSliderViewModel: QuestionSliderViewModel = .mock
    private lazy var userSelectionItems = Array(
        repeating: "",
        count: questionDescriptionTexts.count)
}

extension CharacterDetailSelectViewModel: CharacterDetailSelectViewModelabe {
    func transform(input: Input) -> Output {
        return touchUpButtonChains(input: input)
    }
    
    private func touchUpButtonChains(input: Input) -> Output {
        return input.touchUpButton
            .map { [weak self] item -> State in
                guard let self else { return .none }
                userSelectionItems[item.index] = item.itemData
                if item.index == userSelectionItems.count - 1 {
                    // TODO: 서버에 userSelectionItems 데이터 전송
                    return .gotoDetailQuotationPreviewPage
                }
                return .gotoNextQuestionPage
            }.eraseToAnyPublisher()
    }
}

// MARK: - CharacterDetailSelectDataSource
extension CharacterDetailSelectViewModel: CharacterDetailSelectDataSource {
    
    var questionCarRangeOfPrice: QuestionSliderViewModel {
        questionSliderViewModel
    }
    
    var numberOfSteps: Int {
        questionListTexts.count + 1
    }
    
    func questionDiscription(at index: Int) -> QuestionDescriptionLabelModel {
        return questionDescriptionTexts[index]
    }
    
    func questionList(at index: Int) -> QuestionListTextModel {
        return questionListTexts[index]
    }
    
    func numberOfQuestionListItems(_ index: Int) -> Int {
        return questionListTexts[index].count
    }
}
