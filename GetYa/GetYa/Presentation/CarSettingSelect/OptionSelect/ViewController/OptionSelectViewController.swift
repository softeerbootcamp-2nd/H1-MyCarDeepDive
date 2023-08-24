//
//  OptionSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class OptionSelectViewController: UIViewController {
    enum Constants {
        enum SegmentedControl {
            static let height: CGFloat = .toScaledHeight(value: 52)
        }
    }
    
    // MARK: - UI properties
    private lazy var segmentedControl = OptionSelectSegmentedControl(items: ["추가 옵션", "기본 포함 옵션"]).set {
        $0.addTarget(self, action: #selector(changeSegmentedValue), for: .valueChanged)
    }
    private var pageViewController: UIPageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal)
    
    // MARK: - Properties
    private var viewControllers: [UIViewController] = []
    private var currentSegmentedIndex: Int = 0 {
        didSet {
            let direction: UIPageViewController.NavigationDirection = oldValue <= currentSegmentedIndex
            ? .forward
            : .reverse
            self.pageViewController.setViewControllers(
                [viewControllers[currentSegmentedIndex]],
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
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        viewControllers = [AdditionalOptionViewController(), BasicOptionViewController()]
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configurePageViewController()
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
    
    private func configurePageViewController() {
        if let firstViewController = viewControllers.first {
            pageViewController.setViewControllers(
                [firstViewController],
                direction: .forward,
                animated: true)
        }
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
    @objc private func changeSegmentedValue(sender: UISegmentedControl) {
        currentSegmentedIndex = sender.selectedSegmentIndex
    }
}
