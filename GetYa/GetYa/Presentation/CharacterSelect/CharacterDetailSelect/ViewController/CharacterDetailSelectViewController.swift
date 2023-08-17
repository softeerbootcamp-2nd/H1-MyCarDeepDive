//
//  CharacterDetailSelectViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import UIKit
import Combine

final class CharacterDetailSelectViewController: BaseViewController {
    enum Constants {
        enum ProgressView {
            static let height = CGFloat(4).scaledHeight
        }
        enum CarPriceSelect {
            static let height: CGFloat = .toScaledHeight(value: 105)
            static let topMargin: CGFloat = .toScaledHeight(value: 156)
        }
    }
    typealias PageData = (index: Int, itemData: String)
    
    // MARK: - UI properties
    private let progressView = ProgressView.init(
        frame: .zero,
        progressTotalStep: 0,
        style: .bar,
        animationDuration: 0.37
    ).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    ).set {
        $0.view.translatesAutoresizingMaskIntoConstraints = false
    }
    private var viewControllers: [BaseCharacterSelectPageViewController] = []
    
    // MARK: - Properties
    private var viewModel: (any CharacterDetailSelectViewModelabe &
                            CharacterDetailSelectDataSource)!
    private let touchUpButton = PassthroughSubject<PageData, Never>()
    private var currentPageViewIndex = 0
    private var subscription: AnyCancellable?
    private lazy var totalStep: Int = 1 {
        didSet {
            configurePageView()
            configurePageViewControllers()
            progressView.configureProgressTotalStep(with: totalStep)
            updatePageViewController()
        }
    }
    
    // MARK: - Lifecycles
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        viewModel = CharacterDetailSelectViewModel()
        configureUI()
        totalStep = viewModel.numberOfSteps
        bind()
    }
    
    init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?,
        viewModel: (any CharacterDetailSelectViewModelabe &
                    CharacterDetailSelectDataSource)
    ) {
        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureUI()
        totalStep = viewModel.numberOfSteps
        bind()
    }
    
    convenience init(
        viewModel: (any CharacterDetailSelectViewModelabe &
                    CharacterDetailSelectDataSource)
    ) {
        self.init(nibName: nil, bundle: nil, viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel = CharacterDetailSelectViewModel()
        configureUI()
        totalStep = viewModel.numberOfSteps
        bind()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        view.backgroundColor = .white
        setupUI()
    }
    
    private func updatePageViewController() {
        pageViewController.setViewControllers(
            [viewControllers[currentPageViewIndex]],
            direction: .forward,
            animated: false)
    }
    
    private func configurePageViewControllers() {
        let questionListViewControllers = makeQuestionListViewControllers()
        let questionSliderViewController = makeQuestionCarPriceSlideViewController()
        viewControllers = questionListViewControllers
        viewControllers.append(questionSliderViewController)
    }
    
    private func makeQuestionListViewControllers() -> [BaseCharacterSelectPageViewController] {
        let totalStep = viewModel.numberOfSteps
        return (0..<totalStep-1).map {
            let checkListQuestionView = CharacterDetailQuestionListView(
                textArray: viewModel.questionList(at: $0).questionTexts)
            let questionInfo = viewModel.questionDiscription(at: $0)
            let curPageIndex = $0+1
            
            return BaseCharacterSelectPageViewController(
                curPageIndex: curPageIndex,
                totalPageIndex: totalStep,
                questionView: checkListQuestionView
            ).set {
                $0.setQuestionIndexView(
                    currentIndex: curPageIndex,
                    totalIndex: totalStep)
                $0.setQuestionDescriptionLabel(
                    defaultText: questionInfo.defaultText,
                    highlightText: questionInfo.highlightText)
                $0.delegate = self
            }
        }
    }
    
    private func makeQuestionCarPriceSlideViewController() -> BaseCharacterSelectPageViewController {
        let priceRangeModel = viewModel.questionCarRangeOfPrice
        let curPageIndex = viewModel.numberOfSteps
        let questionInfo = viewModel.questionDiscription(at: curPageIndex-1)
        let carPriceSliderAreaView = DetailQuestionCarPriceSelectView(frame: .zero).set {
            $0.configurePrice(
                minPrice: priceRangeModel.minimumCarPrice,
                maxPrice: priceRangeModel.maximumCarPrice,
                priceUnit: 300)
        }
        
        return BaseCharacterSelectPageViewController(
            curPageIndex: curPageIndex,
            totalPageIndex: totalStep,
            questionView: carPriceSliderAreaView
        ).set {
            $0.setQuestionIndexView(currentIndex: curPageIndex, totalIndex: totalStep)
            $0.setQuestionDescriptionLabel(
                defaultText: questionInfo.defaultText,
                highlightText: questionInfo.highlightText)
            $0.configureHeightMargin(with: Constants.CarPriceSelect.height)
            $0.configureTopMargin(with: Constants.CarPriceSelect.topMargin)
            $0.setupNextButtonToCompletion()
            $0.delegate = self
        }
    }
    
    // MARK: - Functions
    
    override func didTapNavigationBackButton() {
        if currentPageViewIndex > 0 {
            currentPageViewIndex -= 1
            let viewController = viewControllers[currentPageViewIndex]
            pageViewController.setViewControllers(
                [viewController],
                direction: .reverse,
                animated: true)
            progressView.decreaseOneStep()
        } else {
            super.didTapNavigationBackButton()
        }
    }
    // MARK: - Objc Functions
}

// MARK: - ViewBindable
extension CharacterDetailSelectViewController: ViewBindable {
    func bind() {
        let input = Input(
            touchUpButton: touchUpButton.eraseToAnyPublisher())
        let output = viewModel.transform(input: input)
        subscription = output.sink { [weak self] in
            self?.render($0)
        }
    }
    
    func render(_ state: CharacterDetailSelectVCState) {
        switch state {
        case .none:
            break
        case .gotoNextQuestionPage:
            currentPageViewIndex += 1
            let viewController = viewControllers[currentPageViewIndex]
            progressView.increaseOneStep()
            pageViewController.setViewControllers(
                [viewController], direction: .forward,
                animated: true)

        case .gotoDetailQuotationPreviewPage:
            var userSelectItems = viewModel.userSelection
            /// 최소가로 고정
            userSelectItems[viewModel.numberOfSteps-1] = "4200만원"
            let quotationViewModel = DetailQuotationPreviewViewModel.init(keywords: userSelectItems)
            let presentedVC = DetailQuotationPreviewViewController(viewModel: quotationViewModel)
            navigationController?.pushViewController(presentedVC, animated: true)
        }
    }
    
    typealias Input = CharacterDetailSelectVCInput
    typealias State = CharacterDetailSelectVCState
    typealias ErrorType = Error
}

// MARK: - BaseCharacterSelectpageViewDelegate
extension CharacterDetailSelectViewController: BaseCharacterSelectpageViewDelegate {
    func touchUpBaseCharacterSelectPageView(_ viewController: BaseCharacterSelectPageViewController) {
        if currentPageViewIndex == totalStep - 1 {
            let userSelectedPrice = viewController.carPriceRange
            touchUpButton.send(
                (currentPageViewIndex,
                 "\((userSelectedPrice.maximumValue ?? 0).insertCommas)"+"만원"))
            return
        }
        let itemIndex = viewController.selectedItemIndex
        let questions = viewModel.questionList(at: currentPageViewIndex).questionTexts
        let selectedTitle = questions[itemIndex ?? 0]
        touchUpButton.send((currentPageViewIndex, selectedTitle))
    }
}

// MARK: - LayoutSupportable
extension CharacterDetailSelectViewController: LayoutSupportable {
    func setupViews() {
        view.addSubview(progressView)
    }
    
    func setupConstriants() {
        configureProgressView()
    }
    
    private func configureProgressView() {
        typealias Const = Constants.ProgressView
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            progressView.heightAnchor.constraint(
                equalToConstant: Const.height)])
    }
    
    private func configurePageView() {
        guard let pageView = pageViewController.view else {
            return
        }
        view.addSubview(pageView)
        NSLayoutConstraint.activate([
            pageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageView.topAnchor.constraint(equalTo: progressView.bottomAnchor),
            pageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        updateViewConstraints()
    }
}
