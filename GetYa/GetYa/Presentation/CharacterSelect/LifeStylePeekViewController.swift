//
//  LifeStyleDetailViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/08.
//

import UIKit

class LifeStylePeekViewController: UIViewController {
    
    // MARK: - UI properties
    private let contentView = LifeStylePeekContentView()
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureUI()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        view.addSubview(contentView)
    }
    
    private func configureUI() {
        self.view.backgroundColor = .white
        
        configureNavigationBar()
        configureContentView()
    }
    
    private func configureNavigationBar() {
        let image = UIImage(named: "Black_Logo")
        navigationItem.title = ""
        navigationItem.titleView = UIImageView(image: image)
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")?
            .withTintColor(
            .GetYaPalette.gray0,
            renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")?
            .withTintColor(
            .GetYaPalette.gray0,
            renderingMode: .alwaysOriginal)
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func setupContentView(tagTexts: [String], descriptionText: String, image: UIImage?) {
        contentView.setupTagViews(tagTexts: tagTexts)
        contentView.setupDescriptionText(text: descriptionText)
        contentView.setupPersonImageView(image: image)
    }
}
