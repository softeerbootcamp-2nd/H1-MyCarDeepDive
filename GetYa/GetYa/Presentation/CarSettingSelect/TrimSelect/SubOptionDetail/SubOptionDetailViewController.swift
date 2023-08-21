//
//  SubOptionDetailViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class SubOptionDetailViewController: UIViewController {
    enum Constants {
        enum SegmentedControl {
            static let height: CGFloat = .toScaledHeight(value: 40)
        }
    }
    
    // MARK: - UI properties
    private lazy var segmentedControl = SubOptionDetailSegmentedControl(
        items: ["엔진", "바디", "구동방식"]
    ).set {
        $0.addTarget(
            self,
            action: #selector(changeSegmentedValue),
            for: .valueChanged)
    }
    private lazy var pageViewController: UIPageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    ).set {
        $0.view.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
        $0.setViewControllers([viewControllers[0]], direction: .forward, animated: true)
    }
    
    // MARK: - Properties
    private let viewControllers: [UIViewController] = [
        EngineDetailViewController(),
        EngineDetailViewController(),
        EngineDetailViewController()
    ]
    private var currentPageIndex: Int = 0 {
        didSet {
            let direction: UIPageViewController.NavigationDirection = oldValue <= currentPageIndex ? .forward : .reverse
            self.pageViewController.setViewControllers(
                [viewControllers[currentPageIndex]],
                direction: direction,
                animated: true,
                completion: nil)
        }
    }
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureUI()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        configureSegmentedControl()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        view.addSubviews([
            segmentedControl,
            pageViewController.view
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureNavigationBar()
        configurePageViewContoller()
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
    
    private func configureSegmentedControl() {
        let safeLayoutFrame = view.safeAreaLayoutGuide.layoutFrame
        segmentedControl.frame = CGRect(
            x: safeLayoutFrame.minX,
            y: safeLayoutFrame.minY,
            width: safeLayoutFrame.width,
            height: Constants.SegmentedControl.height)
        segmentedControl.configureBottomBorder()
    }
    
    private func configurePageViewContoller() {
        currentPageIndex = 0
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.SegmentedControl.height),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
    @objc private func changeSegmentedValue(sender: UISegmentedControl) {
        currentPageIndex = sender.selectedSegmentIndex
    }
}

// MARK: - UIPageViewController Datasource
extension SubOptionDetailViewController: UIPageViewControllerDataSource {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController),
              index - 1 >= 0 else { return nil }
        return viewControllers[index - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController),
              index + 1 < viewControllers.count else { return nil }
        return viewControllers[index + 1]
    }
}

// MARK: - UIPageViewController Delegate
extension SubOptionDetailViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard let viewController = pageViewController.viewControllers?[0],
              let index = viewControllers.firstIndex(of: viewController) else { return }
      currentPageIndex = index
      segmentedControl.selectedSegmentIndex = index
    }
}
