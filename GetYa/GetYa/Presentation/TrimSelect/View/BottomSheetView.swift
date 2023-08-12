//
//  ButtomSheetView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/13.
//

import UIKit

class BottomSheetView: UIView {
    // MARK: - UI properties
    private let containerView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
        configureUI()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubview(containerView)
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = UIColor(hexString: "8E98A8").withAlphaComponent(0.4).cgColor
        layer.shadowOffset = CGSize(width: 0, height: -4)
        layer.shadowOpacity = 1
        layer.shadowRadius = CGFloat(14).scaledHeight
        
        configureContainerView()
    }
    
    private func configureContainerView() {
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = CGFloat(20).scaledHeight
        containerView.layer.backgroundColor = UIColor.white.cgColor
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
