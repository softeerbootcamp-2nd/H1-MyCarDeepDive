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
            static let height: CGFloat = .toScaledHeight(value: 4)
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
    private var viewModel: (any CharacterDetailSelectViewModelabe)!
    private let touchUpCompletionButton = PassthroughSubject<Int?, Never>()
    private let touchUpNextButton = PassthroughSubject<(curPageIndex: Int, itemIndex: Int?), Never>()
    private let viewLoad = PassthroughSubject<Void, Never>()
    private var totalStep = 0
    private var currentPageViewIndex = 0
    private var subscription: AnyCancellable?
    
    // MARK: - Lifecycles
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        viewModel = CharacterDetailSelectViewModel()
    }
    
    init(viewModel: any CharacterDetailSelectViewModelabe) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel = CharacterDetailSelectViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
        viewLoad.send()
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
    
    private func configurePageViewControllers(
        numberOfSteps: Int,
        questionList: [QuestionListTextModel],
        questionDescriptions: [QuestionDescriptionLabelModel],
        priceRange: QuestionSliderViewModel
    ) {
        let questionListViewControllers = makeQuestionListViewControllers(
            numberOfSteps: numberOfSteps,
            questionList: questionList,
            questionDescriptions: questionDescriptions)
        let questionSliderViewController = makeQuestionCarPriceSlideViewController(
            priceRange: priceRange,
            questionInfo: questionDescriptions[totalStep-1])
        viewControllers = questionListViewControllers
        viewControllers.append(questionSliderViewController)
    }
    
    private func makeQuestionListViewControllers(
        numberOfSteps: Int,
        questionList: [QuestionListTextModel],
        questionDescriptions: [QuestionDescriptionLabelModel]
    ) -> [BaseCharacterSelectPageViewController] {
        totalStep = numberOfSteps
        return (0..<totalStep-1).map {
            let checkListQuestionView = CharacterDetailQuestionListView(
                textArray: questionList[$0].questionTexts)
            let questionInfo = questionDescriptions[$0]
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
    private func makeQuestionCarPriceSlideViewController(
        priceRange: QuestionSliderViewModel,
        questionInfo: QuestionDescriptionLabelModel
    ) -> BaseCharacterSelectPageViewController {
        let carPriceSliderAreaView = DetailQuestionCarPriceSelectView(frame: .zero).set {
            $0.configurePrice(
                minPrice: priceRange.minimumCarPrice,
                maxPrice: priceRange.maximumCarPrice,
                priceUnit: 300)
        }
        
        return BaseCharacterSelectPageViewController(
            curPageIndex: totalStep,
            totalPageIndex: totalStep,
            questionView: carPriceSliderAreaView
        ).set {
            $0.setQuestionIndexView(currentIndex: totalStep, totalIndex: totalStep)
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
    typealias Input = CharacterDetailSelectInput
    typealias State = CharacterDetailSelectState
    typealias ErrorType = Error
    
    func bind() {
        let input = Input(
            touchUpCompletionButton: touchUpCompletionButton.eraseToAnyPublisher(),
            touchUpNextButton: touchUpNextButton.eraseToAnyPublisher(),
            viewLoad: viewLoad.eraseToAnyPublisher())
        let output = viewModel.transform(input: input)
        subscription = output.sink { [weak self] in
            self?.render($0)
        }
    }

    func render(_ state: CharacterDetailSelectState) {
        switch state {
        case .none:
            break
        case .makeQuestions(let numberOfSteps, let questionList, let questionDescriptions, let priceRange):
            configurePageView()
            configurePageViewControllers(
                numberOfSteps: numberOfSteps,
                questionList: questionList,
                questionDescriptions: questionDescriptions,
                priceRange: priceRange)
            progressView.configureProgressTotalStep(with: totalStep)
            updatePageViewController()
        case .gotoNextQuestionPage:
            currentPageViewIndex += 1
            let viewController = viewControllers[currentPageViewIndex]
            progressView.increaseOneStep()
            pageViewController.setViewControllers(
                [viewController], direction: .forward,
                animated: true)
        case .gotoDetailQuotationPreviewPage(let userSelectionList):
            let quotationViewModel = DetailQuotationPreviewViewModel.init(keywords: userSelectionList)
            let presentedVC = DetailQuotationPreviewViewController(viewModel: quotationViewModel)
            navigationController?.pushViewController(presentedVC, animated: true)
        }
    }
}

// MARK: - BaseCharacterSelectpageViewDelegate
extension CharacterDetailSelectViewController: BaseCharacterSelectpageViewDelegate {
    func touchUpBaseCharacterSelectPageView(_ viewController: BaseCharacterSelectPageViewController) {
        if currentPageViewIndex == totalStep - 1 {
            let userSelectedMaxPrice = viewController.carPriceRange.maximumValue
            touchUpCompletionButton.send(userSelectedMaxPrice)
            return
        }
        let itemIndex = viewController.selectedItemIndex
        touchUpNextButton.send((currentPageViewIndex, itemIndex))
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
