//
//  DefaultQuotationFinishUseCase.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation
import Combine

class DefaultQuotationFinishUseCase: QuotationFinishUseCase {
    // MARK: - Dependency
    
    // MARK: - Properties
    private let repository: QuotationFinishRepository
    private var cancellabels = Set<AnyCancellable>()
    var pdfID = CurrentValueSubject<String, Never>("")
    var carInquery = PassthroughSubject<QuotationFinish, Never>()
    var emailResult = PassthroughSubject<Bool, Never>()
    var pdfURL = PassthroughSubject<String, Never>()
    
    // MARK: - LifeCycle
    init(pdfID: String, repository: QuotationFinishRepository) {
        self.repository = repository
        self.pdfID.send(pdfID)
    }
    
    // MARK: - Functions
    func fetchCarInquery() {
        Task(operation: {
            do {
                let carInquery = try await repository.fetchCarInquery(with: pdfID.value)
                self.carInquery.send(carInquery)
            } catch {
                print("carInquery 데이터를 받아오지 못하였습니다.")
            }
        })
    }
    
    func fetchEmail(email: String) {
        Task(operation: {
            do {
                let emailResult = try await repository.fetchPdfEmail(with: PdfEmail(
                    pdfID: pdfID.value,
                    emailName: email))
                self.emailResult.send(emailResult)
            } catch {
                print("이메일 전송을 실패하였습니다.")
            }
        })
    }
    
    func fetchPdfURL() {
        Task(operation: {
            do {
                let pdfURL = try await repository.fetchPdfURL(with: pdfID.value)
                guard let pdfURL else { return }
                self.pdfURL.send(pdfURL)
            } catch {
                print("PDF 파일 다운로드를 실패하였습니다.")
            }
        })
    }
}
