//
//  CarSettingSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class CarSettingSelectViewController: UIViewController {
    enum Constatns {
        enum SettingProgressView {
            static let leadingMargin: CGFloat = CGFloat(16).scaledWidth
            static let height: CGFloat = CGFloat(34).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal)
    private let settingProgressView = SettingProgressView()
    private lazy var bottomSheetView = BottomSheetView(frame: .zero).set {
        $0.delegate = self
    }
    private var bottomSheetViewHeightConstaint: NSLayoutConstraint!
    
    // MARK: - Properties
    private var trimSubOptionSelect: TrimSubOptionSelect
    private var viewControllers: [UIViewController] = []
    private var currentPageIndex: Int = 0
    
    // MARK: - LifeCycles
    init(trimSubOptionSelect: TrimSubOptionSelect) {
        self.trimSubOptionSelect = trimSubOptionSelect
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureUI()
    }
    
    // MARK: - Functions
    private func setupViews() {
        addChild(pageViewController)
        view.addSubviews([
            settingProgressView,
            pageViewController.view,
            bottomSheetView
        ])
        pageViewController.didMove(toParent: self)
        
        let useCase = DefaultCarSettingUseCase(repository: DefaultTrimSelectRepository(provider: SessionProvider()))
        let trimSelectViewController = TrimSelectViewController(
            viewModel: TrimSelectViewModel(
                trimSubOptionSelect: trimSubOptionSelect,
                useCase: useCase))
        
        viewControllers = [
            trimSelectViewController,
            ColorSelectViewController(),
            OptionSelectViewController()]
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureNavigationBar()
        configureSettingProgressView()
        configurePageViewController()
        configureBottomSheetView()
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
    
    private func configureSettingProgressView() {
        settingProgressView.setCurrentSettingProgress(index: currentPageIndex)
        NSLayoutConstraint.activate([
            settingProgressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingProgressView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constatns.SettingProgressView.leadingMargin),
            settingProgressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingProgressView.heightAnchor.constraint(equalToConstant: Constatns.SettingProgressView.height)
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
            pageViewController.view.topAnchor.constraint(equalTo: settingProgressView.bottomAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureBottomSheetView() {
        bottomSheetViewHeightConstaint = bottomSheetView.heightAnchor.constraint(
            equalToConstant: CGFloat(104).scaledHeight)
        NSLayoutConstraint.activate([
            bottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetViewHeightConstaint
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
    @objc private func touchUpNavigationBackButton() {
        if currentPageIndex != 0 {
            currentPageIndex -= 1
            settingProgressView.setCurrentSettingProgress(index: currentPageIndex)
            pageViewController.setViewControllers(
                [viewControllers[currentPageIndex]],
                direction: .reverse,
                animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - BottomSheetDelegate
extension CarSettingSelectViewController: BottomSheetDelegate {
    func contractedBottomSheet(completion: @escaping () -> Void) {
        bottomSheetViewHeightConstaint.isActive = false
        bottomSheetViewHeightConstaint = bottomSheetView.heightAnchor.constraint(
            equalToConstant: BottomSheetView.Constants.SmallContentView.height)
        bottomSheetViewHeightConstaint.isActive = true
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            guard let self else { return }
            view.layoutIfNeeded()
        }, completion: { _ in
            completion()
        })
    }
    
    func expandedBottomSheet(completion: @escaping () -> Void) {
        bottomSheetViewHeightConstaint.isActive = false
        bottomSheetViewHeightConstaint = bottomSheetView.heightAnchor.constraint(
            equalToConstant: BottomSheetView.Constants.LargeContentView.height)
        bottomSheetViewHeightConstaint.isActive = true
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            guard let self else { return }
            view.layoutIfNeeded()
        }, completion: { _ in
            completion()
        })
    }
    
    func transitionNextSettingSelect() {
        if currentPageIndex + 1 < viewControllers.count {
            currentPageIndex += 1
            settingProgressView.setCurrentSettingProgress(index: currentPageIndex)
            pageViewController.setViewControllers(
                [viewControllers[currentPageIndex]],
                direction: .forward,
                animated: true)
        }
    }
}
