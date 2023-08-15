//
//  ColorSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class ColorSelectViewController: UIViewController {
    enum Constants {
        enum RotationView {
            static let height: CGFloat = .toScaledHeight(value: 185)
        }
    }
    
    // MARK: - UI properties
    private let rotationView = RotationView(type: .abyss)
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureUI()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        view.addSubviews([
            rotationView
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureRotationView()
    }
    
    private func configureRotationView() {
        NSLayoutConstraint.activate([
            rotationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rotationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rotationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rotationView.heightAnchor.constraint(
                equalToConstant: Constants.RotationView.height)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions

}
