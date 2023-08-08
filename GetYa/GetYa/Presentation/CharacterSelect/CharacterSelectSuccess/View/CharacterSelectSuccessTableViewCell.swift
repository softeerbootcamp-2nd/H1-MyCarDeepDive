//
//  CharacterSelectSuccessTableViewCell.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

import UIKit

final class CharacterSelectSuccessTableViewCell: UITableViewCell {
    static let id = String(describing: CharacterSelectSuccessTableViewCell.self)
    
    // MARK: - UI properties
    // MARK: - Properties
    // MARK: - Lifecycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemPink.withAlphaComponent(0.8)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Functions
    // MARK: - Functions
    // MARK: - Objc Functions
}
