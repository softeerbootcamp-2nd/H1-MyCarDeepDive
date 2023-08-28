//
//  RecommendTooltipView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import UIKit

class RecommendTooltipView: UIView {
    enum Constants {
        enum TooltipView {
            static let tipWidth: CGFloat = .toScaledWidth(value: 8)
            static let tipheight: CGFloat = .toScaledHeight(value: 6)
            static let startX: CGFloat = .toScaledWidth(value: 12)
        }
        enum Label {
            static let topMargin: CGFloat = .toScaledHeight(value: 6)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 12)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -12)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -6)
        }
    }
    
    // MARK: - UI properties
    private let tooltipView = TooltipView()
    private let label = CommonLabel(fontType: .mediumBody4, color: .GetYaPalette.gray400)
    
    // MARK: - Properties
    
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
        addSubviews([
            tooltipView,
            label
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureTooltipView()
        configureLabel()
    }
    
    private func configureTooltipView() {
        typealias Const = Constants.TooltipView
        tooltipView.layer.backgroundColor = UIColor.white.cgColor
        tooltipView.configureTooltip(
            tipStartX: Const.startX,
            tipStartY: 0,
            tipWidth: Const.tipWidth,
            tipHeight: Const.tipheight)
        
        NSLayoutConstraint.activate([
            tooltipView.topAnchor.constraint(equalTo: topAnchor),
            tooltipView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tooltipView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tooltipView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureLabel() {
        typealias Const = Constants.Label
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: Const.topMargin),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leadingMargin),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Const.trailingMargin),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Const.bottomMargin)
        ])
    }
    
    // MARK: - Functions
    func setText(text: String) {
        label.text = text
    }
    
    // MARK: - Objc Functions 

}
