//
//  DetailQuotationPreviewViewModelable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/09.
//

import Combine

protocol DetailQuotationPreviewViewModelable: ViewModelable
where Input == DetailQuotationPreviewViewModel.DetailQuotationPreviewInput,
      State == DetailQuotationPreviewViewModel.DetailQuotationPreviewState,
      Output == AnyPublisher<State, Never> { }
