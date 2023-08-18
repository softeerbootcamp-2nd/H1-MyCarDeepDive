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
    
    // MARK: - Properties
    private var viewControllers: [UIViewController] = []
    private let checkListTexts: [String] = [
        "20대",
        "30대",
        "40대",
        "50대 이상"]
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
        
        let ageViewController = {
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
        let lifeStyleViewController = LifeStyleViewController().set {
            $0.delegate = self
        }
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
    
    override func didTapNavigationBackButton() {
        if let viewControler = pageViewController.viewControllers?.first {
            guard !(viewControler is BaseCharacterSelectPageViewController) else {
                super.didTapNavigationBackButton()
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
        // TODO: 서버한테 보낼 지정된 텍스트
        guard let selectedIdx = viewController.selectedItemIndex else { return }
        let selectedItemString = checkListTexts[selectedIdx]
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
