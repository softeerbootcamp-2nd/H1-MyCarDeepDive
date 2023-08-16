//
//  CharacterDetailSelectViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import UIKit

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
    private var viewModel: CharacterDetailSelectDataSource!
    private var currentPageViewIndex = 0
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
    }
    
    init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?,
        viewModel: CharacterDetailSelectDataSource
    ) {
        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureUI()
        totalStep = viewModel.numberOfSteps
    }
    
    convenience init(viewModel: CharacterDetailSelectDataSource) {
        self.init(nibName: nil, bundle: nil, viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel = CharacterDetailSelectViewModel()
        configureUI()
        totalStep = viewModel.numberOfSteps
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
        let carPriceSliderAreaView = CharacterDetailQuestionCarPriceSelectView(frame: .zero).set {
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
            $0.configureHeightMargin(with: Constants.CarPriceSelect.topMargin)
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

// MARK: - BaseCharacterSelectpageViewDelegate
extension CharacterDetailSelectViewController: BaseCharacterSelectpageViewDelegate {
    func touchUpBaseCharacterSelectPageView(_ viewController: BaseCharacterSelectPageViewController) {
        if currentPageViewIndex == totalStep - 1 {
            // TODO: 서버에 string4개, min, max price보낸 후 1.5 결과 화면으로 가기
            print("hihi")
            return
        }
        let itemIndex = viewController.selectedItemIndex
        let questions = viewModel.questionList(at: currentPageViewIndex).questionTexts
        // TODO: 서버에 보내줄 item string
        let selectedTitle = questions[itemIndex ?? 0]
        print(selectedTitle)
        currentPageViewIndex += 1
        let viewController = viewControllers[currentPageViewIndex]
        progressView.increaseOneStep()
        pageViewController.setViewControllers(
            [viewController], direction: .forward,
            animated: true)
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
