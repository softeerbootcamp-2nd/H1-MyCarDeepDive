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
        let provider = SessionProvider()
        let useCase = DefaultCarSettingUseCase(
            trimSelectRepository: DefaultTrimSelectRepository(provider: provider),
            colorSelectRepository: DefaultColorSelectRepository(provider: provider),
            optionSelectRepository: DefaultOptionSelectRepository(provider: provider))
        let carSettingSelectViewController = CarSettingSelectViewController(
            viewModel: CarSettingSelectViewModel(useCase: useCase))
        let trimSelectViewController = TrimSelectViewController(
            viewModel: TrimSelectViewModel(
                trimSubOptionSelect: TrimSubOptionSelect(
                    engineID: 1,
                    bodyID: 1,
                    drivingSystemID: 1),
                useCase: useCase))
        let colorSelectViewController = ColorSelectViewController(
            viewModel: ColorSelectViewModel(useCase: useCase))
        let optionSelectViewController = OptionSelectViewController(
            viewModel: OptionSelectViewModel(useCase: useCase))
        
        carSettingSelectViewController.setViewControllers(
            viewControllers: [
                trimSelectViewController,
                colorSelectViewController,
                optionSelectViewController])
        
        self.navigationController?.pushViewController(carSettingSelectViewController, animated: true)
    }
}
