//
//  ColorSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class ColorSelectViewController: UIViewController {
    // MARK: - UI properties
    private let contentView = ColorSelectContentView()
    
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
        view.backgroundColor = .white
        
        configureContentView()
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions

}
