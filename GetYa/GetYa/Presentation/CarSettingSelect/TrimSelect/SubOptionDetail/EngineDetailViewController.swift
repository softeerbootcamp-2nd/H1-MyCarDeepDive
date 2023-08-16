//
//  EngineDetailViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class EngineDetailViewController: UIViewController {
    enum Constants {
        enum LearnMoreView {
            static let topMargin: CGFloat = .toScaledHeight(value: 20)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 78)
            static let expandedHeight: CGFloat = .toScaledHeight(value: 384)
        }
    }
    
    // MARK: - UI properties
    private let scrollView: UIScrollView = UIScrollView().set {
        $0.showsVerticalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let contentView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var firstLearnMoreView = EngineLearnMoreView(
        titleText: "디젤 2.2",
        descriptionText: "강한 성능과 높은 연비 효율"
    ).set {
        $0.delegate = self
        $0.setContentView(view: EngineDetailContentView())
    }
    private lazy var secondLearnMoreView = EngineLearnMoreView(
        titleText: "가솔린 3.8",
        descriptionText: "부드럽고 안정적인 주행"
    ).set {
        $0.delegate = self
        $0.setContentView(view: EngineDetailContentView())
    }
    
    // MARK: - Properties
    private var firstLearnMoreViewHeightConstraint: NSLayoutConstraint!
    private var secondLearnMoreViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureUI()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([
            firstLearnMoreView,
            secondLearnMoreView
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureScrollView()
        configureContentView()
        configureFirstLearnMoreView()
        configureSecondLearnMoreView()
    }
    
    private func configureScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func configureFirstLearnMoreView() {
        firstLearnMoreViewHeightConstraint = firstLearnMoreView.heightAnchor.constraint(
            equalToConstant: Constants.LearnMoreView.height)
        
        NSLayoutConstraint.activate([
            firstLearnMoreView.topAnchor.constraint(
                equalTo: contentView.topAnchor
                , constant: Constants.LearnMoreView.topMargin),
            firstLearnMoreView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.LearnMoreView.leadingMargin),
            firstLearnMoreView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.LearnMoreView.trailingMargin),
            firstLearnMoreViewHeightConstraint
        ])
    }
    
    private func configureSecondLearnMoreView() {
        secondLearnMoreViewHeightConstraint = secondLearnMoreView.heightAnchor.constraint(
            equalToConstant: Constants.LearnMoreView.height)
        
        NSLayoutConstraint.activate([
            secondLearnMoreView.topAnchor.constraint(
                equalTo: firstLearnMoreView.bottomAnchor,
                constant: Constants.LearnMoreView.topMargin),
            secondLearnMoreView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.LearnMoreView.leadingMargin),
            secondLearnMoreView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.LearnMoreView.trailingMargin),
            secondLearnMoreViewHeightConstraint,
            secondLearnMoreView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
}

// MARK: - LearnMoreView Delegate
extension EngineDetailViewController: LearnMoreViewDelegate {
    func touchUpExpandButtonByIsSelected(sender: LearnMoreView, isSelected: Bool) {
        let const = Constants.LearnMoreView.self
        
        if sender == firstLearnMoreView {
            firstLearnMoreViewHeightConstraint.isActive = false
            firstLearnMoreViewHeightConstraint.constant = isSelected ? const.expandedHeight : const.height
            firstLearnMoreViewHeightConstraint.isActive = true
        } else {
            secondLearnMoreViewHeightConstraint.isActive = false
            secondLearnMoreViewHeightConstraint.constant = isSelected ? const.expandedHeight : const.height
            secondLearnMoreViewHeightConstraint.isActive = true
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
