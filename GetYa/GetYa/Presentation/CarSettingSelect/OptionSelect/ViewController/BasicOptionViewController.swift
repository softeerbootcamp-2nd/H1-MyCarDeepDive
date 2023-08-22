//
//  BasicOptionViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import UIKit

class BasicOptionViewController: UIViewController {
    // MARK: - UI properties
    private let collectionView = BasicCollectionView()
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureUI()
        collectionView.updateCategorySnapShot(types: TagCategoryType.allCases)
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        view.addSubview(collectionView)
    }
    
    private func configureUI() {
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
}
