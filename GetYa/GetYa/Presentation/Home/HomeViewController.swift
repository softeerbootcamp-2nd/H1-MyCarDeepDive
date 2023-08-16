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
    private var contentView: HomeContentView!
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let contentView { contentView.player.play() }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewSafeAreaInsetsDidChange() {
        setupViews()
    }
    
    // MARK: - Functions
    private func setupViews() {
        contentView = HomeContentView(frame: view.safeAreaLayoutGuide.layoutFrame)
        contentView.delegate = self
        view.addSubview(contentView)
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let image = UIImage(named: "Logo")
        self.navigationItem.title = ""
        self.navigationItem.titleView = UIImageView(image: image)
    }
}

extension HomeViewController: HomeContentDelegate {
    func touchUpRecomandButton() {
        self.navigationController?.pushViewController(
            CharacterSelectViewController(),
            animated: true)
    }
    
    func touchUpCustomButton() {
        self.navigationController?.pushViewController(
            CarSettingSelectViewController(),
            animated: true)
    }
}
