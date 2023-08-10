//
//  LifeStylePeekContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/08.
//

import UIKit

// TODO: 뷰 분할 후 swiftLint file-length, type_body_length 룰 삭제
class LifeStylePeekContentView: UIScrollView {
    typealias Palette = UIColor.GetYaPalette
    
    enum Constants {
        enum TitleBackgroundImageView {
            static let height = CGFloat(350).scaledHeight
        }
        enum TitleImageView {
            static let topMargin = CGFloat(57).scaledHeight
            static let leadingMargin = CGFloat(16).scaledWidth
            static let trailingMargin = CGFloat(-16).scaledWidth
            static let height = CGFloat(374).scaledHeight
        }
        enum TagStackView {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let bottomMargin = CGFloat(-12).scaledHeight
            static let height = CGFloat(26).scaledHeight
        }
        enum DescriptionLabel {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let bottomMargin = CGFloat(-26).scaledHeight
        }
        enum PeekTagView {
            static let width = CGFloat(65).scaledWidth
        }
        enum PersonImageVIew {
            static let leadingMarign = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(20).scaledHeight
            static let width = CGFloat(48).scaledWidth
            static let height = CGFloat(48).scaledWidth
        }
        enum PersonNameLabel {
            static let leadingMarign = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(23).scaledHeight
        }
        enum PersonDescriptionLabel {
            static let leadingMarign = CGFloat(16).scaledWidth
        }
        enum PersonInterView {
            static let leadingMarign = CGFloat(16).scaledWidth
            static let trailingMarign = CGFloat(-16).scaledWidth
            static let topMargin = CGFloat(18).scaledHeight
            static let height = CGFloat(81).scaledHeight
        }
        enum ForYouLabel {
            static let leadingMarign = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(36).scaledHeight
        }
        enum ForYouImageView {
            static let height = CGFloat(290).scaledHeight
        }
        enum InterviewLabel {
            static let leadingMarign = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(72).scaledHeight
        }
        enum FirstQuestionView {
            static let leadingMarign = CGFloat(16).scaledWidth
            static let topMarign = CGFloat(16).scaledHeight
            static let height = CGFloat(24).scaledHeight
        }
        enum FirstAnswerView {
            static let topMargin = CGFloat(8).scaledHeight
            static let leadingMarign = CGFloat(16).scaledWidth
            static let trailingMarign = CGFloat(-16).scaledWidth
            static let height = CGFloat(68).scaledHeight
        }
        enum SecondQuestionView {
            static let leadingMarign = CGFloat(16).scaledWidth
            static let topMarign = CGFloat(24).scaledHeight
            static let height = CGFloat(24).scaledHeight
        }
        enum SecondAnswerView {
            static let topMargin = CGFloat(8).scaledHeight
            static let leadingMarign = CGFloat(16).scaledWidth
            static let trailingMarign = CGFloat(-16).scaledWidth
            static let bottomMargin = CGFloat(-80).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let contentView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let titleBackgroundImageView: UIImageView = UIImageView().set {
        $0.image = UIImage(named: "LifeStylePeekTitle")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let titleImageView: UIImageView = UIImageView().set {
        $0.image = UIImage(named: "LifeStylePeekTitle")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = CGFloat(8).scaledHeight
        $0.clipsToBounds = true
    }
    private let tagStackView: UIStackView = UIStackView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = CGFloat(11).scaledWidth
    }
    // TODO: 머지 후 medium Head1으로 폰트 변경해야함
    private let descriptionLabel = CommonLabel(
        fontType: .mediumHead2,
        color: UIColor.GetYaPalette.gray1000)
    private let personImageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = Constants.PersonImageVIew.width / 2
    }
    private let personNameLabel = CommonLabel(
        fontType: .mediumBody3,
        color: Palette.gray50,
        text: "김현대")
    private let personDescriptionLabel = CommonLabel(
        fontType: .regularCaption1,
        color: Palette.gray400,
        text: "두 아이의 엄마")
    private let personInterView = CommonTextView(
        backgroundColor: Palette.acriveBlue.withAlphaComponent(0.1),
        textColor: Palette.acriveBlue,
        fontType: .mediumBody2,
        textAlignment: .center
    ).set {
        $0.configureText(text: "\"우리 아이들과 함께 타는 차는 항상\n안전해야 한다고 생각해요.\"")
        $0.layer.cornerRadius = CGFloat(4).scaledHeight
    }
    private let forYouLabel = CommonLabel(
        fontType: .mediumHead3,
        color: Palette.gray50,
        text: "For You")
    private let forYouImageView: UIImageView = UIImageView().set {
        $0.image = UIImage(named: "LifeStylePeekForYou")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
    }
    private let interviewLabel = CommonLabel(
        fontType: .mediumHead3,
        color: Palette.gray50,
        text: "Interview")
    private let firstQuestionView = PeekQuestionView(text: "어떤 용도로 차를 사용하세요?")
    private let firstAnswerView = CommonTextView(
        backgroundColor: Palette.acriveBlue.withAlphaComponent(0.1),
        textColor: Palette.acriveBlue,
        fontType: .regularBody4
    ).set {
        $0.configureText(text: "저는 차를 타고 출퇴근도 하지만 주중에 아이들 픽업하거나 마트 갈 때도 자주 타곤 해요.")
        $0.layer.cornerRadius = 8
    }
    private let secondQuestionView = PeekQuestionView(text: "차를 살 때 가장 중요하게 생각하는 부분이 뭔가요?")
    private let secondAnswerView = CommonTextView(
        backgroundColor: Palette.acriveBlue.withAlphaComponent(0.1),
        textColor: Palette.acriveBlue,
        fontType: .regularBody4
    ).set {
        $0.configureText(
            text: "저는 차를 살 때 안전을 중요하게 생각해요."
            + "가족들이 같이 타는 차라 항상 사고에 경각심을 갖고 있죠."
            + "펠리세이드는 그 점에서 뒷자석 에어백도 터지는 모델이라 안심이 되는 편이에요.")
        $0.layer.cornerRadius = 8
    }
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(frame: .zero)
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
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            contentView
        ])
        
        contentView.addSubviews([
            titleBackgroundImageView,
            titleImageView,
            descriptionLabel,
            tagStackView,
            personImageView,
            personNameLabel,
            personDescriptionLabel,
            personInterView,
            forYouLabel,
            forYouImageView,
            interviewLabel,
            firstQuestionView,
            firstAnswerView,
            secondQuestionView,
            secondAnswerView
        ])
    }
    
    private func configureUI() {
        self.backgroundColor = .white
        self.showsVerticalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        
        configureContentView()
        configureTitleBackgroundImageView()
        configureTitleImageView()
        configureDescriptionLabel()
        configureTagStackView()
        configurePersonImageView()
        configurePersonNameLabel()
        configurePersonDescriptionLabel()
        configurePersonInterView()
        configureForYouLabel()
        configureForYouImageView()
        configureInterviewLabel()
        configureFirstQuestionView()
        configureFirstAnswerView()
        configureSecondQuestionView()
        configureSecondAnswerView()
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(
                equalTo: contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(
                equalTo: contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(
                equalTo: contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(
                equalTo: contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    private func configureTitleBackgroundImageView() {
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        titleBackgroundImageView.addSubview(visualEffectView)
        
        NSLayoutConstraint.activate([
            titleBackgroundImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            titleBackgroundImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            titleBackgroundImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            titleBackgroundImageView.heightAnchor.constraint(
                equalToConstant: Constants.TitleBackgroundImageView.height)
        ])
        
        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(
                equalTo: titleBackgroundImageView.topAnchor),
            visualEffectView.leadingAnchor.constraint(
                equalTo: titleBackgroundImageView.leadingAnchor),
            visualEffectView.trailingAnchor.constraint(
                equalTo: titleBackgroundImageView.trailingAnchor),
            visualEffectView.bottomAnchor.constraint(
                equalTo: titleBackgroundImageView.bottomAnchor)
        ])
    }
    
    private func configureTitleImageView() {
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.TitleImageView.topMargin),
            titleImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.TitleImageView.leadingMargin),
            titleImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.TitleImageView.trailingMargin),
            titleImageView.heightAnchor.constraint(
                equalToConstant: Constants.TitleImageView.height)
        ])
    }
    
    private func configureTagStackView() {
        NSLayoutConstraint.activate([
            tagStackView.leadingAnchor.constraint(
                equalTo: titleImageView.leadingAnchor,
                constant: Constants.TagStackView.leadingMargin),
            tagStackView.bottomAnchor.constraint(
                equalTo: descriptionLabel.topAnchor,
                constant: Constants.TagStackView.bottomMargin),
            tagStackView.heightAnchor.constraint(
                equalToConstant: Constants.TagStackView.height)
        ])
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(
                equalTo: titleImageView.leadingAnchor,
                constant: Constants.DescriptionLabel.leadingMargin),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: titleImageView.bottomAnchor,
                constant: Constants.DescriptionLabel.bottomMargin)
        ])
    }
    
    private func configurePersonImageView() {
        NSLayoutConstraint.activate([
            personImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.PersonImageVIew.leadingMarign),
            personImageView.topAnchor.constraint(
                equalTo: titleImageView.bottomAnchor,
                constant: Constants.PersonImageVIew.topMargin),
            personImageView.widthAnchor.constraint(equalToConstant: Constants.PersonImageVIew.width),
            personImageView.heightAnchor.constraint(equalToConstant: Constants.PersonImageVIew.height)
        ])
    }
    
    private func configurePersonNameLabel() {
        NSLayoutConstraint.activate([
            personNameLabel.topAnchor.constraint(
                equalTo: titleImageView.bottomAnchor,
                constant: Constants.PersonNameLabel.topMargin),
            personNameLabel.leadingAnchor.constraint(
                equalTo: personImageView.trailingAnchor,
                constant: Constants.PersonNameLabel.leadingMarign)
        ])
    }
    
    private func configurePersonDescriptionLabel() {
        NSLayoutConstraint.activate([
            personDescriptionLabel.topAnchor.constraint(
                equalTo: personNameLabel.bottomAnchor),
            personDescriptionLabel.leadingAnchor.constraint(
                equalTo: personImageView.trailingAnchor,
                constant: Constants.PersonDescriptionLabel.leadingMarign)
        ])
    }
    
    private func configurePersonInterView() {
        NSLayoutConstraint.activate([
            personInterView.topAnchor.constraint(
                equalTo: personImageView.bottomAnchor,
                constant: Constants.PersonInterView.topMargin),
            personInterView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.PersonInterView.leadingMarign),
            personInterView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.PersonInterView.trailingMarign),
            personInterView.heightAnchor.constraint(
                equalToConstant: Constants.PersonInterView.height)
        ])
    }
    
    private func configureForYouLabel() {
        NSLayoutConstraint.activate([
            forYouLabel.topAnchor.constraint(
                equalTo: personInterView.bottomAnchor,
                constant: Constants.ForYouLabel.topMargin),
            forYouLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.ForYouLabel.leadingMarign)
        ])
    }
    
    private func configureForYouImageView() {
        NSLayoutConstraint.activate([
            forYouImageView.topAnchor.constraint(equalTo: forYouLabel.bottomAnchor),
            forYouImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            forYouImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            forYouImageView.heightAnchor.constraint(
                equalToConstant: Constants.ForYouImageView.height)
        ])
    }
    
    private func configureInterviewLabel() {
        NSLayoutConstraint.activate([
            interviewLabel.topAnchor.constraint(
                equalTo: forYouImageView.bottomAnchor,
                constant: Constants.InterviewLabel.topMargin),
            interviewLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.InterviewLabel.leadingMarign)
        ])
    }
    
    private func configureFirstQuestionView() {
        NSLayoutConstraint.activate([
            firstQuestionView.topAnchor.constraint(
                equalTo: interviewLabel.bottomAnchor,
                constant: Constants.FirstQuestionView.topMarign),
            firstQuestionView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.FirstQuestionView.leadingMarign),
            firstQuestionView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            firstQuestionView.heightAnchor.constraint(
                equalToConstant: Constants.FirstQuestionView.height)
        ])
    }
    
    private func configureFirstAnswerView() {
        NSLayoutConstraint.activate([
            firstAnswerView.topAnchor.constraint(
                equalTo: firstQuestionView.bottomAnchor,
                constant: Constants.FirstAnswerView.topMargin),
            firstAnswerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.FirstAnswerView.leadingMarign),
            firstAnswerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.FirstAnswerView.trailingMarign),
            firstAnswerView.heightAnchor.constraint(
                equalToConstant: Constants.FirstAnswerView.height)
        ])
    }
    
    private func configureSecondQuestionView() {
        NSLayoutConstraint.activate([
            secondQuestionView.topAnchor.constraint(
                equalTo: firstAnswerView.bottomAnchor,
                constant: Constants.SecondQuestionView.topMarign),
            secondQuestionView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.SecondQuestionView.leadingMarign),
            secondQuestionView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            secondQuestionView.heightAnchor.constraint(
                equalToConstant: Constants.SecondQuestionView.height)
        ])
    }
    
    private func configureSecondAnswerView() {
        NSLayoutConstraint.activate([
            secondAnswerView.topAnchor.constraint(
                equalTo: secondQuestionView.bottomAnchor,
                constant: Constants.SecondAnswerView.topMargin),
            secondAnswerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.SecondAnswerView.leadingMarign),
            secondAnswerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.SecondAnswerView.trailingMarign),
            secondAnswerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.SecondAnswerView.bottomMargin)
        ])
    }
    
    // MARK: - Functions
    func setupTagViews(tagTexts: [String]) {
        tagTexts.forEach {
            let peekTagView = PeekTagView(text: $0)
            peekTagView.widthAnchor.constraint(
                equalToConstant: Constants.PeekTagView.width).isActive = true
            tagStackView.addArrangedSubview(peekTagView)
        }
    }
    
    func setupDescriptionText(text: String) {
        descriptionLabel.text = text
    }
    
    func setupPersonImageView(image: UIImage?) {
        personImageView.image = image
    }
}
