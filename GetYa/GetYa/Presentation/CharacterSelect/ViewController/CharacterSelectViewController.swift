//
//  CharacterSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit

class CharacterSelectViewController: BaseViewController {
    enum Constants {
        enum ProgressView {
            static let height: CGFloat = .toScaledHeight(value: 4)
        }
    }
    
    // MARK: - UI Properties
    private let pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal)
    private lazy var progressView = ProgressView().set {
            $0.translatesAutoresizingMaskIntoConstraints = true
    }
    lazy var ageViewController = {
        let questionView = CharacterDetailQuestionListView(textArray: checkListTexts)
        return BaseCharacterSelectPageViewController(
            curPageIndex: 1,
            totalPageIndex: 2,
            questionView: questionView
        ).set {
            $0.setQuestionIndexView(currentIndex: 1, totalIndex: 2)
            $0.setQuestionDescriptionLabel(
                defaultText: "나이를 알려주세요",
                highlightText: "나이")
            $0.delegate = self
        }
    }()
    lazy var lifeStyleViewController = LifeStyleViewController().set {
        $0.delegate = self
    }
    
    // MARK: - Properties
    private var viewControllers: [UIViewController] = []
    private let checkListTexts: [String] = [
        "20대",
        "30대",
        "40대",
        "50대 이상"]
    private var selectedAge: Int = 1
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
        
        viewControllers = [ageViewController, lifeStyleViewController]
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        configureProgressView()
        configurePageViewController()
    }
    
    private func configureProgressView() {
        typealias Const = Constants.ProgressView
        progressView.configureProgressTotalStep(with: viewControllers.count)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressView.heightAnchor.constraint(
                equalToConstant: Const.height)
        ])
    }
    
    private func configurePageViewController() {
        if let firstViewController = viewControllers.first {
            pageViewController.setViewControllers(
                [firstViewController],
                direction: .forward,
                animated: true)
            view.bringSubviewToFront(progressView)
        }
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: progressView.bottomAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func touchUpNavigationBackButton() {
        if let viewControler = pageViewController.viewControllers?.first {
            guard !(viewControler is BaseCharacterSelectPageViewController) else {
                super.touchUpNavigationBackButton()
                return
            }
            if let firstViewController = viewControllers.first {
                progressView.decreaseOneStep()
                pageViewController.setViewControllers(
                    [firstViewController],
                    direction: .reverse,
                    animated: true)
            }
        }
    }
}

// MARK: - BaseCharacterSelectpageViewDelegate
extension CharacterSelectViewController: BaseCharacterSelectpageViewDelegate {
    func touchUpBaseCharacterSelectPageView(_ viewController: BaseCharacterSelectPageViewController) {
        guard let selectedIdx = viewController.selectedItemIndex else { return }
        selectedAge = selectedIdx + 1
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
        guard let liftStyleIndex = lifeStyleViewController.selectedIndexPath?.row else { return }
        
        let viewController = RecommendQuotationViewController(
            viewModel: RecommendQuotationViewModel(
                characterSelectModel: CharacterSelectModel(
                    ageGroupId: selectedAge,
                    lifeStyleId: liftStyleIndex + 1),
                useCase: DefaultRecommendQuotationUseCase(
                    repository: DefaultRecommendQuotationRepository(provider: SessionProvider()))))
        navigationController?.pushViewController(viewController, animated: true)
    }
}
