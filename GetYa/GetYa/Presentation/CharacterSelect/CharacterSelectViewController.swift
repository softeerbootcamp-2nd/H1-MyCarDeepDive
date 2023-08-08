//
//  CharacterSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit

class CharacterSelectViewController: UIViewController {
    // MARK: - UI Properties
    private let pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal)
    private lazy var progressView = ProgressView().set {
            $0.translatesAutoresizingMaskIntoConstraints = true
        }
    
    // MARK: - Properties
    private var viewControllers: [UIViewController] = []
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureUI()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        configureProgressView()
        configurePageViewController()
    }
    
    // MARK: - Functions
    private func setupViews() {
        addChild(pageViewController)
        view.addSubviews([progressView, pageViewController.view])
        pageViewController.didMove(toParent: self)
        
        let ageViewController = AgeViewController()
        let lifeStyleViewController = LifeStyleViewController()
        ageViewController.delegate = self
        lifeStyleViewController.delegate = self
        
        viewControllers = [ageViewController, lifeStyleViewController]
        progressView.configureProgressTotalStep(with: viewControllers.count)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let image = UIImage(named: "Black_Logo")
        self.navigationItem.title = ""
        self.navigationItem.titleView = UIImageView(image: image)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left")?.withTintColor(
                .GetYaPalette.gray0,
                renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(touchUpNavigationBackButton))
    }
    
    private func configureProgressView() {
        let safeAreaLayout = view.safeAreaLayoutGuide.layoutFrame
        progressView.frame = CGRect(
            x: 0,
            y: safeAreaLayout.minY,
            width: view.bounds.width,
            height: 4)
    }
    
    private func configurePageViewController() {
        let safeAreaLayout = view.safeAreaLayoutGuide.layoutFrame
        pageViewController.view.frame = CGRect(
            x: 0,
            y: safeAreaLayout.minY + 3,
            width: view.bounds.width,
            height: view.bounds.height - safeAreaLayout.minY)
        if let firstViewController = viewControllers.first {
            pageViewController.setViewControllers(
                [firstViewController],
                direction: .forward,
                animated: true)
        }
    }
    
    @objc private func touchUpNavigationBackButton() {
        if let viewControler = pageViewController.viewControllers?.first {
            if viewControler is AgeViewController {
                navigationController?.popViewController(animated: true)
            } else {
                if let firstViewController = viewControllers.first {
                    pageViewController.setViewControllers(
                        [firstViewController],
                        direction: .reverse,
                        animated: true)
                    progressView.decreaseOneStep()
                }
            }
        }
    }
}

// MARK: - PageViewController Delegate
extension CharacterSelectViewController: AgeViewControllerDelegate {
    func touchUpNextButton(sender: UIButton) {
        if let viewController = viewControllers.last {
            pageViewController.setViewControllers(
                [viewController],
                direction: .forward,
                animated: true)
            progressView.increaseOneStep()
        }
    }
}

// MARK: - LifeStyleViewController Delegate
extension CharacterSelectViewController: LifeStyleViewControllerDelegate {
    func touchUpSuccessButton(sender: UIButton) {
        
    }
}
