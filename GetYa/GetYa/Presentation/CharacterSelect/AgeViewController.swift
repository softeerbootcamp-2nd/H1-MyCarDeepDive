//
//  AgeViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/07.
//

import UIKit

protocol AgeViewControllerDelegate: AnyObject {
    func touchUpNextButton(sender: UIButton)
}

class AgeViewController: UIViewController {
    // MARK: - UI Properties
    private let contentView = QuestionContentView()
    private let checkListStackView = CheckListStackView()
    
    // MARK: - Properties
    weak var delegate: AgeViewControllerDelegate?
    private let checkListStackViewLayoutConstant = UILayout(
        leadingMargin: 16,
        topMargin: 72,
        trailingMargin: -16)
    private let checkListTexts: [String] = [
        "20대",
        "30대",
        "40대",
        "50대 이상"
    ]
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureUI()
    }
    
    // MARK: - Functions
    private func setupViews() {
        contentView.addSubview(checkListStackView)
    }
    
    private func configureUI() {
        self.view.backgroundColor = .white
        contentView.delegate = self
        contentView.configureDetail(
            descriptionText: "나이를 알려주세요.",
            partText: "나이",
            questionNumber: 1,
            questionCount: 2,
            buttonTitle: "다음",
            buttonIsEnabled: true
        )
        view = contentView
        configureCheckListStackView()
    }
    
    private func configureCheckListStackView() {
        checkListStackView.setupItem(textArray: checkListTexts)
        
        NSLayoutConstraint.activate([
            checkListStackView.topAnchor.constraint(
                equalTo: contentView.descriptionLabel.bottomAnchor,
                constant: checkListStackViewLayoutConstant.topMargin),
            checkListStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: checkListStackViewLayoutConstant.leadingMargin),
            checkListStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: checkListStackViewLayoutConstant.trailingMargin)
        ])
    }
}

// MARK: - QuestionContentView Delegate
extension AgeViewController: QuestionContentViewDelegate {
    func touchUpButton(sender: UIButton) {
        delegate?.touchUpNextButton(sender: sender)
    }
}
