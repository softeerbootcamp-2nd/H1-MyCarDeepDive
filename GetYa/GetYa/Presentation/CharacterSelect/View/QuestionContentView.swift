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
    enum Constants {
        enum DescriptionLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 29)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
        }
        enum QuestionNumberView {
            static let topMargin: CGFloat = .toScaledHeight(value: 24)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 40)
            static let width: CGFloat = .toScaledWidth(value: 65)
        }
        enum Button {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 17)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -17)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -32)
            static let height: CGFloat = .toScaledHeight(value: 52)
        }
    }
    
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
        typealias Const = Constants.DescriptionLabel
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin)
        ])
    }
    
    private func configureQuestionNumberView() {
        typealias Const = Constants.QuestionNumberView
        
        NSLayoutConstraint.activate([
            questionNumberView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            questionNumberView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            questionNumberView.heightAnchor.constraint(
                equalToConstant: Const.height),
            questionNumberView.widthAnchor.constraint(
                equalToConstant: Const.width)
        ])
    }
    
    private func configureButton() {
        typealias Const = Constants.Button
        button.addTarget(self, action: #selector(touchUpButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            button.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            button.bottomAnchor.constraint(
                equalTo: bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: Const.height)
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
