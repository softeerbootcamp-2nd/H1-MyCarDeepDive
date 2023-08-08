//
//  CharacterSelectSuccessContentView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class CharacterSelectSuccessTableView: UITableView {
    // MARK: - Lifecycles
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        register(
            CharacterSelectSuccessMainHeader.self,
            forHeaderFooterViewReuseIdentifier: CharacterSelectSuccessMainHeader.id)
        register(
            CharacterSelectSuccessTableViewCell.self,
            forCellReuseIdentifier: CharacterSelectSuccessTableViewCell.id)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
