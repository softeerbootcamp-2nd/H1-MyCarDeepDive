//
//  ColorRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/23.
//

import Foundation

protocol ColorSelectRepository {
    func fetchTrimColorInquery(with trimID: Int) async throws -> TrimColorInquery
    func fetchInteriorColor(with exteriorColor: ColorSelectModel) async throws -> TrimColor
    func fetchExteriorColor(with interiorColor: ColorSelectModel) async throws -> TrimColor
}
