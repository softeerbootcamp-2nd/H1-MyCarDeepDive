//
//  SubOptionDetailViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class SubOptionDetailViewController: UIViewController {
    // MARK: - UI properties
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureUI()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let image = UIImage(named: "Black_Logo")
        navigationItem.title = ""
        navigationItem.titleView = UIImageView(image: image)
        navigationController?.navigationBar.backIndicatorImage = UIImage(
            systemName: "arrow.left")?.withTintColor(
                .GetYaPalette.gray0,
                renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(
            systemName: "arrow.left")?.withTintColor(
                .GetYaPalette.gray0,
                renderingMode: .alwaysOriginal)
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions

}
