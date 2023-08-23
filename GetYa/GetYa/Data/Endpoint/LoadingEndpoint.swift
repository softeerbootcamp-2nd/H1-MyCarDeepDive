//
//  LoadingEndpoint.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/24.
//

import Foundation

struct LoadingEndpoint {
    private init() {}
    static let shared = LoadingEndpoint()
    
    func fetchCarInquery(
        with request: String
    ) -> Endpoint<QuotationFinishDTO> {
        return Endpoint<QuotationFinishDTO>(
            method: .get,
            responseType: .pdfCarInfomation(pdfID: request))
    }
    
    func fetchPdfEmail(with request: PdfEmail) -> Endpoint<Bool> {
        return Endpoint<Bool>(
            method: .get,
            responseType: .pdfEmail(pdfEmail: request))
    }
}
