//
//  OptionSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit
import Combine

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
    private let additionalOptionViewController = AdditionalOptionViewController()
    private let basicOptionViewController = BasicOptionViewController()
    
    // MARK: - Properties
    private let viewModel: OptionSelectViewModel
    private var cancellables = Set<AnyCancellable>()
    private let viewWillAppearEvent = PassthroughSubject<Void, Never>()
    private let touchUpCategoryEvent = PassthroughSubject<Int, Never>()
    private let selectedOptionNumberList = PassthroughSubject<[Int], Never>()
    private let selectedPackageOptionNumberList = PassthroughSubject<[Int], Never>()
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
    init(viewModel: OptionSelectViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
        setupViews()
        setNotification()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewWillAppearEvent.send()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        configureSegmentedControl()
    }
    
    // MARK: - Private Functions
    private func bind() {
        let input = OptionSelectViewModel.Input(
            viewWillAppearEvent: viewWillAppearEvent.eraseToAnyPublisher(),
            touchUpcategoryEvent: touchUpCategoryEvent.eraseToAnyPublisher(),
            selectedOptionNumberList: selectedOptionNumberList.eraseToAnyPublisher(),
            selectedPackageOptionNumberList: selectedPackageOptionNumberList.eraseToAnyPublisher()
        )
        
        let output = viewModel.transform(input: input)
        
        output.additionalOptionInquery
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                additionalOptionViewController.setOptionInquery(inquery: $0)
            })
            .store(in: &cancellables)
        
        output.additionalTagOptionInquery
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                additionalOptionViewController.setTagOptionInquery(inquery: $0)
            })
            .store(in: &cancellables)
    }
    
    private func setupViews() {
        view.addSubviews([
            segmentedControl,
            pageViewController.view
        ])
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        viewControllers = [additionalOptionViewController, basicOptionViewController]
    }
    
    private func setNotification() {
        NotificationCenter.default.publisher(for: Notification.Name("touchUpCategoryNotification"))
            .sink(receiveValue: { [weak self] in
                guard let self,
                      let tagNumber = $0.userInfo?["tagNumber"] as? Int else { return }
                touchUpCategoryEvent.send(tagNumber)
            })
            .store(in: &cancellables)
        
        NotificationCenter.default.publisher(for: Notification.Name("selectedOptionNotification"))
            .sink(receiveValue: { [weak self] in
                guard let self,
                      let optionNumbers = $0.userInfo?["optionNumbers"] as? [Int] else { return }
                selectedOptionNumberList.send(optionNumbers)
            })
            .store(in: &cancellables)
        
        NotificationCenter.default.publisher(for: Notification.Name("selectedPackageOptionNotification"))
            .sink(receiveValue: { [weak self] in
                guard let self,
                      let optionNumbers = $0.userInfo?["optionNumbers"] as? [Int] else { return }
                selectedPackageOptionNumberList.send(optionNumbers)
            })
            .store(in: &cancellables)
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
