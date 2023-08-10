//
//  CharacterSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit

class CharacterSelectViewController: UIViewController {
    enum Constants {
        enum ProgressView {
            static let height = CGFloat(4).scaledHeight
        }
    }
    
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
    
    // MARK: - Functions
    private func setupViews() {
        addChild(pageViewController)
        view.addSubviews([progressView, pageViewController.view])
        pageViewController.didMove(toParent: self)
        
        let ageViewController = AgeViewController().set {
            $0.delegate = self
        }
        let lifeStyleViewController = LifeStyleViewController().set {
            $0.delegate = self
        }
        viewControllers = [ageViewController, lifeStyleViewController]
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
        configureProgressView()
        configurePageViewController()
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
        progressView.configureProgressTotalStep(with: viewControllers.count)
        progressView.transform = progressView.transform.scaledBy(
            x: 1,
            y: Constants.ProgressView.height)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configurePageViewController() {
        if let firstViewController = viewControllers.first {
            pageViewController.setViewControllers(
                [firstViewController],
                direction: .forward,
                animated: true)
        }
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: progressView.bottomAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
        // TODO: CharacterSelectSuccessViewController로 화면 전환
    }
}
