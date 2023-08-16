//
//  CharacterDetailSelectDataSource.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

protocol CharacterDetailSelectDataSource {
    var questionCarRangeOfPrice: QuestionSliderViewModel { get }
    var numberOfSteps: Int { get }
    func questionDiscription(at index: Int) -> QuestionDescriptionLabelModel
    func questionList(at index: Int) -> QuestionListTextModel
    func numberOfQuestionListItems(_ index: Int) -> Int
}
