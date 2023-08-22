//
//  TrimTooltipView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/10.
//

import UIKit

class TrimTooltipView: UIView {
    enum Constants {
        enum TooltipView {
            static let startX = CGFloat(12).scaledWidth
            static let startY: CGFloat = 0
            static let tipWidth = CGFloat(8).scaledWidth
            static let tipheight = CGFloat(6).scaledWidth
            static let radius = CGFloat(8).scaledHeight
        }
        enum ImageView {
            static let leadingMargin = CGFloat(14).scaledWidth
            static let width = CGFloat(32).scaledHeight
            static let height = CGFloat(32).scaledHeight
        }
        enum Label {
            static let leadingMargin = CGFloat(10).scaledWidth
            static let topMargin = CGFloat(12).scaledWidth
            static let trailingMargin = CGFloat(-14).scaledWidth
            static let bottomMargin = CGFloat(-12).scaledWidth
        }
    }
    
    // MARK: - UI properties
    private let tooltipView = TooltipView(
        backgroundColor: .GetYaPalette.tooltip,
        tipStartX: Constants.TooltipView.startX,
        tipStartY: Constants.TooltipView.startY,
        tipYType: .top,
        tipWidth: Constants.TooltipView.tipWidth,
        tipHeight: Constants.TooltipView.tipheight)
    
    private let imageView: UIImageView = UIImageView().set {
        $0.image = UIImage(named: "TooltipBulb")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let label = CommonLabel(
        fontType: .regularBody4,
        color: .GetYaPalette.gray900)
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    convenience init(text: String) {
        self.init(frame: .zero)
        
        configureText(text: text)
    }
    
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
        addSubview(tooltipView)
        
        tooltipView.addSubviews([
            imageView,
            label
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureTooltipView()
        configureImageView()
        configureLabel()
    }
    
    private func configureTooltipView() {
        NSLayoutConstraint.activate([
            tooltipView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tooltipView.topAnchor.constraint(equalTo: topAnchor),
            tooltipView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tooltipView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureImageView() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(
                equalTo: tooltipView.leadingAnchor,
                constant: Constants.ImageView.leadingMargin),
            imageView.centerYAnchor.constraint(equalTo: tooltipView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Constants.ImageView.width),
            imageView.heightAnchor.constraint(equalToConstant: Constants.ImageView.height)
        ])
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: Constants.Label.leadingMargin),
            label.topAnchor.constraint(
                equalTo: tooltipView.topAnchor,
                constant: Constants.Label.topMargin),
            label.bottomAnchor.constraint(
                equalTo: tooltipView.bottomAnchor,
                constant: Constants.Label.bottomMargin),
            label.trailingAnchor.constraint(
                equalTo: tooltipView.trailingAnchor,
                constant: Constants.Label.trailingMargin)
        ])
    }
    
    // MARK: - Functions
    func configureText(text: String) {
        self.label.text = text
    }
}
