//
//  DefaultLoadingUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation
import Combine

class DefaultLoadingUseCase: LoadingUseCase {
    enum LoadingUseCaseError: Error {
        case wrongDecode
        case wrongPdfID
    }
    
    // MARK: - Dependency
    var pdfID = PassthroughSubject<String, Never>()
    
    // MARK: - Properties
    private let repository: LoadingRepository
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - LifeCycle
    init(repository: LoadingRepository) {
        self.repository = repository
    }
    
    // MARK: - Functions
    func fetchPdfID(contrationQuotation: ContractionQuotation) {
        Task(operation: {
            do {
                let pdfID = try await repository.fetchPdfID(with: contrationQuotation)
                guard let pdfID else { throw LoadingUseCaseError.wrongPdfID }
                self.pdfID.send(pdfID)
            } catch {
                print("PDF ID를 받아오지 못했습니다.")
            }
        })
    }
}
