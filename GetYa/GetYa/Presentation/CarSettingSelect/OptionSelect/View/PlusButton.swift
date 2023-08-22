//
//  PlusButton.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import UIKit

class PlusButton: UIButton {
    // MARK: - UI properties
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureUI()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        let deSelectConfig = UIImage.SymbolConfiguration(paletteColors: [
            .white,
            .init(hexString: "ACB8C8").withAlphaComponent(0.7)
        ])
        let selectConfig = UIImage.SymbolConfiguration(paletteColors: [
            .white,
            .GetYaPalette.acriveBlue.withAlphaComponent(0.7)
        ])
        setImage(
            UIImage(systemName: "plus.circle.fill")?.applyingSymbolConfiguration(deSelectConfig),
            for: .normal)
        setImage(
            UIImage(systemName: "plus.circle.fill")?.applyingSymbolConfiguration(selectConfig),
            for: .selected)
    }
    
    // MARK: - Functions
    func addAction(handler: @escaping () -> Void) {
        addAction(UIAction(handler: { _ in
            handler()
        }), for: .touchUpInside)
    }
    
    // MARK: - Objc Functions
}
