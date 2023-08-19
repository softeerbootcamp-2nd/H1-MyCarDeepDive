//
//  QuestionContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/07.
//

import UIKit

protocol QuestionContentViewDelegate: AnyObject {
    func touchUpButton(sender: UIButton)
}

class QuestionContentView: UIView {
    // MARK: - UI Properties
    private let button = CommonButton(
        font: GetYaFont.mediumBody3.uiFont,
        buttonBackgroundColorType: .primary
    )
    let descriptionLabel = CommonLabel(
        fontType: GetYaFont.regularHead2,
        color: .GetYaPalette.gray0
    )
    private let questionNumberView = QuestionNumberView()
    
    // MARK: - Properties
    weak var delegate: QuestionContentViewDelegate?
    private let descriptionLabelLayoutConstant = UILayout(leadingMargin: 16, topMargin: 29)
    private let questionNumberViewLayoutConstant = UILayout(
        topMargin: 24,
        trailingMargin: -16,
        height: 40,
        width: 65)
    private let buttonLayoutConstant = UILayout(
        leadingMargin: 17,
        trailingMargin: -17,
        bottomMargin: -32,
        height: 52)
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
        setupViews()
        configureUI()
    }
    
    init(
        descriptionText: String,
        partText: String,
        questionNumber: Int,
        questionCount: Int,
        buttonTitle: String
    ) {
            super.init(frame: .zero)
            setupViews()
            configureUI()
            configureDetail(
                descriptionText: descriptionText,
                partText: partText,
                questionNumber: questionNumber,
                questionCount: questionCount,
                buttonTitle: buttonTitle)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        configureUI()
    }
    
    // MARK: - Functions
    private func setupViews() {
        addSubviews([
            descriptionLabel,
            questionNumberView,
            button
        ])
    }
    
    private func configureUI() {
        self.backgroundColor = .white
        
        configureDescriptionLabel()
        configureQuestionNumberView()
        configureButton()
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: descriptionLabelLayoutConstant.topMargin),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: descriptionLabelLayoutConstant.leadingMargin)
        ])
    }
    
    private func configureQuestionNumberView() {
        NSLayoutConstraint.activate([
            questionNumberView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: questionNumberViewLayoutConstant.topMargin),
            questionNumberView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: questionNumberViewLayoutConstant.trailingMargin),
            questionNumberView.heightAnchor.constraint(
                equalToConstant: questionNumberViewLayoutConstant.height),
            questionNumberView.widthAnchor.constraint(
                equalToConstant: questionNumberViewLayoutConstant.width)
        ])
    }
    
    private func configureButton() {
        button.addTarget(self, action: #selector(touchUpButton(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: buttonLayoutConstant.leadingMargin),
            button.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: buttonLayoutConstant.trailingMargin),
            button.bottomAnchor.constraint(
                equalTo: self.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: buttonLayoutConstant.height)
        ])
    }
    
    func configureDetail(
        descriptionText: String,
        partText: String,
        questionNumber: Int,
        questionCount: Int,
        buttonTitle: String
    ) {
        button.setTitle(buttonTitle, for: .normal)
        questionNumberView.setText(text: "\(questionNumber)/\(questionCount)")
        descriptionLabel.text = descriptionText
        descriptionLabel.configurePartTextFont(
            otherFontType: .mediumHead2,
            partText: partText)
    }
    
    func setButtonIsEnabled(isEnabled: Bool) {
        button.isEnabled = isEnabled
    }
    
    @objc private func touchUpButton(_ sender: UIButton) {
        delegate?.touchUpButton(sender: sender)
    }
}
