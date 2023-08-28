//
//  QuotationFinishEndpoint.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

struct QuotationFinishEndpoint {
    private init() {}
    static let shared = QuotationFinishEndpoint()
    
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
    
    func fetchPdfURL(with request: String) -> Endpoint<PdfUrlDTO> {
        return Endpoint<PdfUrlDTO>(
            method: .get,
            responseType: .pdfURL(pdfID: request))
    }
}
