//
//  DefaultQuotationPreviewModelable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/19.
//

import Foundation
import Combine

struct DefaultQuotationPreviewViewInput {
    let viewDidLoad: AnyPublisher<Void, Never>
    let customButtonEvent: AnyPublisher<Void, Never>
    let quickQuoteEvent: AnyPublisher<Void, Never>
}

enum DefaultQuotationPreviewState {
    case none
    case updateViewWithData
    case gotoCustomPage
    case gotoCompletionPage
}

protocol DefaultQuotationPreviewViewModelable: ViewModelable
where Input == DefaultQuotationPreviewViewInput,
      State == DefaultQuotationPreviewState,
      Output == AnyPublisher<State, Never> { }
