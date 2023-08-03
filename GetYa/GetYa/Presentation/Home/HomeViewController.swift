//
//  HomeViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/01.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {

    // MARK: - UI Properties
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewSafeAreaInsetsDidChange() {
        setupViews()
    }
    
    // MARK: - Functions
    private func setupViews() {
        let contentView = HomeContentView(frame: view.safeAreaLayoutGuide.layoutFrame)
        view.addSubview(contentView)
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let image = UIImage(named: "Logo")
        self.navigationItem.titleView = UIImageView(image: image)
    }
}
