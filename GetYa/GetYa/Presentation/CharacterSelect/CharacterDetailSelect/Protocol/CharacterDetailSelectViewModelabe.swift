//
//  CharacterDetailSelectViewModelabe.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/17.
//

import Combine

struct CharacterDetailSelectVCInput {
    typealias PageData = (index: Int, itemData: String)
    let touchUpButton: AnyPublisher<PageData, Never>
}

enum CharacterDetailSelectVCState {
    case gotoDetailQuotationPreviewPage
    case gotoNextQuestionPage
    case none
}

protocol CharacterDetailSelectViewModelabe: ViewModelable
where Input == CharacterDetailSelectVCInput,
      State == CharacterDetailSelectVCState,
      Output == AnyPublisher<State, Never> { }
