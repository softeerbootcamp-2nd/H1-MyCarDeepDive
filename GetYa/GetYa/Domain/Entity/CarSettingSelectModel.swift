//
//  CarSettingSelectModel.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/22.
//

import Foundation

struct CarSettingSelectModel {
    var trimSelect: TrimSelectModel
    var exteriorColorSelect: ColorSelectModel?
    var interiorColorSelect: ColorSelectModel?
    var optionSelectList: [OptionSelectModel]
}
