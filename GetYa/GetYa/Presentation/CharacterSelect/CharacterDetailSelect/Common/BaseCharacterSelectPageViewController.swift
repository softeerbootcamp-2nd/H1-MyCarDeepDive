//
//  BaseCharacterSelectPageViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import UIKit

protocol BaseCharacterSelectpageViewDelegate: AnyObject {
    func touchUpBaseCharacterSelectPageView(_ viewController: BaseCharacterSelectPageViewController)
}

/// 다음 버튼 누를 때 데이터를 상위 뷰한테 저장하면됩니다.
class BaseCharacterSelectPageViewController: UIViewController {
    enum Constraints {
        enum QuestionPageIndexView {
            static let topMargin: CGFloat = .toScaledHeight(value: 24)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 40)
            static let width: CGFloat = .toScaledWidth(value: 65)
        }
        enum QuestionDescriptionLabel {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let topMargin: CGFloat = .toScaledHeight(value: 29)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let maximumBottomMargin: CGFloat = .toScaledHeight(value: -12)
        }
        
        enum QuestionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 66)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let maximumBottomMargin: CGFloat = .toScaledHeight(value: -12)
        }
        
        enum NextButton {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 52)
        }
    }
    // MARK: - UI properties
    
    private let questionPageIndexView = QuestionNumberView()
    private let questionDescriptionLabel = CommonLabel(
        fontType: GetYaFont.regularHead2,
        color: .GetYaPalette.gray0,
        text: "질문이 준비중입니다 ...")
    private let questionView: QuestionViewSendable
    private let nextButton = CommonButton(
        font: GetYaFont.mediumBody3.uiFont,
        buttonBackgroundColorType: .primary)
    
    // MARK: - Properties
    var carPriceRange: (minimumValue: Int?, maximumValue: Int?) {
        questionView.sendCarMinimumAndMaximumPrice()
    }
    var selectedItemIndex: Int? {
        questionView.selectedItemIndex
    }
    
    // MARK: - Properties
    private var curPageIndex: Int
    private var totalPageIndex: Int
    
    // MARK: - Lifecycles
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        questionView = CharacterQuestionDetailListView(textArray: [
            "문항이 준비중입니다..",
            "당신의 차를 위한 최적의 질문지가 준비중입니다.."])
        curPageIndex = 1
        totalPageIndex = 1
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setQuestionIndexView(currentIndex: curPageIndex, totalIndex: totalPageIndex)
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?,
        curPageIndex: Int,
        totalPageIndex: Int,
        questionView: QuestionViewSendable
    ) {
        self.questionView = questionView
        self.curPageIndex = curPageIndex
        self.totalPageIndex = totalPageIndex
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(
        curPageIndex: Int,
        totalPageIndex: Int,
        questionView: QuestionViewSendable
    ) {
        self.init(
            nibName: nil,
            bundle: nil,
            curPageIndex: curPageIndex,
            totalPageIndex: totalPageIndex,
            questionView: questionView)
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        questionView = CharacterQuestionDetailListView(textArray: [
            "문항이 준비중입니다..",
            "당신의 차를 위한 최적의 질문지가 준비중입니다.."])
        curPageIndex = 1
        totalPageIndex = 1
        super.init(coder: coder)
        setQuestionIndexView(currentIndex: curPageIndex, totalIndex: totalPageIndex)
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        configureSubviewUI(
            with: questionPageIndexView,
            questionDescriptionLabel,
            questionView,
            nextButton)
        nextButton.setTitle("다음", for: .normal)
    }
    
    // MARK: - Functions
    func setQuestionIndexView(currentIndex: Int, totalIndex: Int) {
        questionPageIndexView.setText(text: "\(currentIndex)/\(totalIndex)")
    }
    
    func setNextButtontitle(with title: String) {
        nextButton.setTitle(title, for: .normal)
    }
    
    func setQuestionDescriptionLabel(
        defaultText: String,
        otherFontType: GetYaFont = .mediumHead2,
        highlightText: String
    ) {
        questionDescriptionLabel.text = defaultText
        questionDescriptionLabel.configurePartTextFont(otherFontType: otherFontType, partText: highlightText)
    }
}

extension BaseCharacterSelectPageViewController: LayoutSupportable {
    func configureConstraints() {
        _=[questionIndexViewConstraints,
           questionDescriptionLabelConstraints,
           questionViewConstraints,
           nextButtonConstraints
        ].map { NSLayoutConstraint.activate($0) }
    }
    
    private var questionIndexViewConstraints: [NSConstraint] {
        typealias Const = Constraints.QuestionPageIndexView
        return [
            questionPageIndexView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Const.trailingMargin),
            questionPageIndexView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Const.topMargin),
            questionPageIndexView.widthAnchor.constraint(
                equalToConstant: Const.width),
            questionPageIndexView.heightAnchor.constraint(
                equalToConstant: Const.height)]
    }
    
    private var questionDescriptionLabelConstraints: [NSConstraint] {
        typealias Const = Constraints.QuestionDescriptionLabel
        return [
            questionDescriptionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Const.leadingMargin),
            questionDescriptionLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Const.topMargin),
            questionDescriptionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Const.trailingMargin),
            questionDescriptionLabel.bottomAnchor.constraint(
                lessThanOrEqualTo: questionView.topAnchor,
                constant: Const.maximumBottomMargin)]
    }
    
    private var questionViewConstraints: [NSConstraint] {
        typealias Const = Constraints.QuestionView
        return [
            questionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Const.leadingMargin),
            questionView.topAnchor.constraint(
                equalTo: questionPageIndexView.bottomAnchor,
                constant: Const.topMargin),
            questionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Const.trailingMargin),
            questionView.bottomAnchor.constraint(
                lessThanOrEqualTo: nextButton.topAnchor,
                constant: Const.maximumBottomMargin)]
    }
    
    private var nextButtonConstraints: [NSConstraint] {
        typealias Const = Constraints.NextButton
        return [
            nextButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Const.leadingMargin),
            nextButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Const.trailingMargin),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: Const.height)]
    }
}
