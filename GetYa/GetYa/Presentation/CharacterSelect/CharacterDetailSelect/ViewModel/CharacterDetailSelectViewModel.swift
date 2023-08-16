//
//  CharacterDetailSelectViewModel.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import Foundation

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

// TODO: 선택 정보를 저장해야하는데 골라야 할 목차가 5개가 아니라 여러개가된다면?..
final class CharacterDetailSelectViewModel {
    // MARK: - Properties
    private var questionDescriptionTexts: [QuestionDescriptionLabelModel] = QuestionDescriptionLabelModel.mock
    private var questionListTexts: [QuestionListTextModel] = QuestionListTextModel.mock
    private var questionSliderViewModel: QuestionSliderViewModel = .mock
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
