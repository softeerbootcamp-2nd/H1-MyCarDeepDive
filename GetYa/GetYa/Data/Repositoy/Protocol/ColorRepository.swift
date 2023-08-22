//
//  ColorRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

protocol ColorRepository {
    func fetchTrimInquery(with trimID: Int) async throws -> TrimColorInquery
}
