//
//  LifeStylePeekContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/08.
//

import UIKit

class LifeStylePeekContentView: UIScrollView {
    enum Constants {
        enum TitleBackgroundImageView {
            static let height = CGFloat(350).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let contentView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let titleBackgroundImageView: UIImageView = UIImageView().set {
        $0.image = UIImage(named: "LifeStylePeek")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    init(tagTexts: [String], descriptionText: String) {
        super.init(frame: .zero)
        setupViews()
        configureUI()
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
        addSubviews([
            contentView
        ])
        
        contentView.addSubviews([
            titleBackgroundImageView
        ])
    }
    
    private func configureUI() {
        self.backgroundColor = .white
        self.showsVerticalScrollIndicator = false
        
        configureContentView()
        configureTitleBackgroundImageView()
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(
                equalTo: contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(
                equalTo: contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(
                equalTo: contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(
                equalTo: contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    private func configureTitleBackgroundImageView() {
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        titleBackgroundImageView.addSubview(visualEffectView)
        
        NSLayoutConstraint.activate([
            titleBackgroundImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            titleBackgroundImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            titleBackgroundImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            titleBackgroundImageView.heightAnchor.constraint(
                equalToConstant: Constants.TitleBackgroundImageView.height)
        ])
        
        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(
                equalTo: titleBackgroundImageView.topAnchor),
            visualEffectView.leadingAnchor.constraint(
                equalTo: titleBackgroundImageView.leadingAnchor),
            visualEffectView.trailingAnchor.constraint(
                equalTo: titleBackgroundImageView.trailingAnchor),
            visualEffectView.bottomAnchor.constraint(
                equalTo: titleBackgroundImageView.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
}
