//
//  AgeViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/07.
//

import UIKit

// TODO: 다음 버튼으로 이동한다는 것은 리스트가 선택됬다는 것. 이때 CheckListStackView의 selectedItemIndex를 반환해서
// id를 넘겨주는게 좋을 것 같습니다!! (서버랑 합을 맞춰야겠습니닷)
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
    override func loadView() {
        contentView.delegate = self
        contentView.configureDetail(
            descriptionText: "나이를 알려주세요.",
            partText: "나이",
            questionNumber: 1,
            questionCount: 2,
            buttonTitle: "다음"
        )
        view = contentView
    }
    
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
