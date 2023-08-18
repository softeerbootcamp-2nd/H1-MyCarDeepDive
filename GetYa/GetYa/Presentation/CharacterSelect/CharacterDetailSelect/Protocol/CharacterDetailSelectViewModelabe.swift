//
//  CharacterDetailSelectViewModelabe.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/17.
//

import Combine

struct CharacterDetailSelectInput {
    typealias PageData = (index: Int, itemData: String)
    let touchUpButton: AnyPublisher<PageData, Never>
}

enum CharacterDetailSelectState {
    case gotoDetailQuotationPreviewPage(userSelection: [String])
    case gotoNextQuestionPage
    case none
}

protocol CharacterDetailSelectViewModelabe: ViewModelable
where Input == CharacterDetailSelectInput,
      State == CharacterDetailSelectState,
      Output == AnyPublisher<State, Never> { }
