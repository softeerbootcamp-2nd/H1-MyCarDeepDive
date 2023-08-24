//
//  TrimChangeModel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/25.
//

import Foundation

struct TrimChangeModel {
    let trimSelectModel: TrimSelectModel?
    let otherSelectModel: TrimSelectModel?
    let exteriorColorSelectModel: ColorSelectModel?
    let interiorColorSelectModel: ColorSelectModel?
    let optionSelectModel: OptionSelectModel?
    
    init(
        trimSelectModel: TrimSelectModel? = nil,
        otherSelectModel: TrimSelectModel? = nil,
        exteriorColorSelectModel: ColorSelectModel? = nil,
        interiorColorSelectModel: ColorSelectModel? = nil,
        optionSelectModel: OptionSelectModel? = nil) {
        self.trimSelectModel = trimSelectModel
        self.otherSelectModel = otherSelectModel
        self.exteriorColorSelectModel = exteriorColorSelectModel
        self.interiorColorSelectModel = interiorColorSelectModel
        self.optionSelectModel = optionSelectModel
    }
}
