//
//  OptionSelectEndpoint.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

struct OptionSelectEndpoint {
    private init() {}
    static let shared = OptionSelectEndpoint()
    
    func fetchAdditionalOption(with carSpecID: Int) -> Endpoint<AdditionalOptionInqueryDTO> {
        return Endpoint(
            method: .get,
            responseType: .carSpecAdditionalOption(carSpecId: carSpecID)
        )
    }
    func fetchAdditionalOptionByTag(
        carSpecID: Int,
        tagID: Int
    ) -> Endpoint<AdditionalTagOptionInqueryDTO> {
        return Endpoint(
            method: .get,
            responseType: .optionCarSpecIdTagsTagId(carSpecID: carSpecID, tagID: tagID)
        )
    }
}
