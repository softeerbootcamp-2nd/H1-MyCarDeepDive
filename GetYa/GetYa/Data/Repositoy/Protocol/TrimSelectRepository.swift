//
//  TrimSelectRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation

protocol TrimSelectRepository {
    func fetchTrimInquery(with request: TrimSubOptionSelect) async throws -> TrimInquery
}
