//
//  CharacterSelectSuccessFooter.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/10.
//

import UIKit

final class CharacterSelectSuccessFooter: UITableViewHeaderFooterView {
    static let id = String(describing: CharacterSelectSuccessFooter.self)
    
    // MARK: - UIProperties
    private let totalMoneyDescriptionLabel = CommonLabel(
        fontType: GetYaFont.mediumBody3, color: .GetYaPalette.gray400, text: "총 금액")
    private let paymentAmountLabel = CommonLabel(
        fontType: GetYaFont.mediumHead3, color: .black, text: "0원")
    
    // MARK: - Constant
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Function
    
    ///여기서해야할거는 CommonLabel이거 바꾸는 거다 이거 초기에 지정하는데 현대산스 폰트 적용안됨
    func configure(with paymentAmount: String) {
        
    }
}
