//
//  OptionSelectRepository.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

protocol OptionSelectRepository {
    func fetchAdditionalOption(with carSpecID: Int) async throws -> AdditionalOptionInquery
    func fetchAdditionalOptionByTag(carSpecID: Int, tagID: Int) async throws -> AdditionalTagOptionInquery
}
