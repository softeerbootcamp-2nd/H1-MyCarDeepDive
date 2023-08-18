//
//  CharacterDetailSelectViewModelabe.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/17.
//

import Combine

struct CharacterDetailSelectInput {
    let touchUpCompletionButton: AnyPublisher<Int?, Never>
    let touchUpNextButton: AnyPublisher<(curPageIndex: Int, itemIndex: Int?), Never>
    let viewLoad: AnyPublisher<Void, Never>
}

enum CharacterDetailSelectState {
    case gotoDetailQuotationPreviewPage(userSelection: [String])
    case gotoNextQuestionPage
    case makeQuestions(
        numberOfSteps: Int,
        questionList: [QuestionListTextModel],
        questionDescriptions: [QuestionDescriptionLabelModel],
        priceRange: QuestionSliderViewModel)
    case none
}

protocol CharacterDetailSelectViewModelabe: ViewModelable
where Input == CharacterDetailSelectInput,
      State == CharacterDetailSelectState,
      Output == AnyPublisher<State, Never> { }
