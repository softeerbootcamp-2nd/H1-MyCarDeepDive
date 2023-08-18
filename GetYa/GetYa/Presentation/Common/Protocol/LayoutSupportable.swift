//
//  LayoutSupportable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/04.
//

import UIKit

protocol LayoutSupportable {
    func setupViews()
    func setupConstriants()
}

extension LayoutSupportable {
    func setupUI() {
        setupViews()
        setupConstriants()
    }
}
