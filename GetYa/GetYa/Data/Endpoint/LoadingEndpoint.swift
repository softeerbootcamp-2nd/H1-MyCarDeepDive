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
    
    func fetchPdfID(with request: ContractionQuotation) -> Endpoint<PdfIdDTO> {
        return Endpoint(
            method: .post,
            responseType: .pdfID,
            bodyParameters: request.toDTO())
    }
}
