//
//  TrimSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit

class TrimSelectViewController: UIViewController {
    enum Constants {
        enum HeaderView {
            static let height: CGFloat = CGFloat(185).scaledHeight
        }
        enum DifficultSelectButton {
            static let topMargin: CGFloat = CGFloat(20).scaledHeight
            static let trailingMargin: CGFloat = CGFloat(-16).scaledWidth
            static let width: CGFloat = CGFloat(112).scaledWidth
        }
        enum TrimSubOptionContentView {
            static let topMarign: CGFloat = CGFloat(12).scaledHeight
            static let leadingMargin: CGFloat = CGFloat(16).scaledWidth
            static let trailingMargin: CGFloat = CGFloat(-16).scaledWidth
        }
        enum TrimOptionContentCollectionView {
            static let tooltipTopMargin: CGFloat = CGFloat(16).scaledHeight
            static let topMarign: CGFloat = CGFloat(12).scaledHeight
            static let bottomMargin: CGFloat = CGFloat(-145).scaledHeight
        }
        enum SubOptionAreaTooltipView {
            static let topMargin: CGFloat = CGFloat(16).scaledHeight
            static let leadingMargin: CGFloat = CGFloat(16).scaledWidth
            static let trailingMargin: CGFloat = CGFloat(-16).scaledWidth
            static let height: CGFloat = CGFloat(74).scaledHeight
        }
        enum TrimAreaTooltipView {
            static let topMargin: CGFloat = CGFloat(8).scaledHeight
            static let leadingMargin: CGFloat = CGFloat(16).scaledWidth
            static let trailingMargin: CGFloat = CGFloat(-16).scaledWidth
            static let height: CGFloat = CGFloat(74).scaledHeight
        }
        enum LineView {
            static let tooltipTopMargin: CGFloat = CGFloat(16).scaledHeight
            static let topMargin: CGFloat = CGFloat(25).scaledHeight
            static let height: CGFloat = 8
        }
        enum TrimLabel {
            static let topMargin: CGFloat = CGFloat(16).scaledHeight
            static let leadingMargin: CGFloat = CGFloat(16).scaledWidth
        }
    }
    
    // MARK: - UI properties
    private let scrollView = UIScrollView().set {
        $0.showsVerticalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let contentView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let headerView = TrimHeaderView()
    private lazy var trimSubOptionContentStackView = TrimSubOptionContentStackView().set {
        $0.delegate = self
    }
    private lazy var trimOptionContentCollectionView = TrimOptionContentCollectionView().set {
        $0.learnMoreViewDelegate = self
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didTappedCollectionView))
        $0.addGestureRecognizer(tapGesture)
    }
    private var collectionViewHeightConstarint: NSLayoutConstraint!
    private var collectionViewTopConstarint: NSLayoutConstraint!
    private lazy var difficultSelectButton: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(
            UIImage(systemName: "questionmark.circle")?.withTintColor(
                .GetYaPalette.acriveBlue,
                renderingMode: .alwaysOriginal),
            for: .normal)
        $0.titleLabel?.font = GetYaFont.mediumBody4.uiFont
        $0.setTitleColor(.GetYaPalette.acriveBlue, for: .normal)
        let text = "고르기 어렵다면?"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: text.count)
        )
        $0.setAttributedTitle(attributedString, for: .normal)
        $0.addTarget(
            self,
            action: #selector(touchUpDifficultSelectButton),
            for: .touchUpInside)
    }
    private let subOptionAreaTooltipView = TrimTooltipView().set {
        $0.isHidden = true
    }
    private let trimAreaTooltipView = TrimTooltipView(
        text: "트림은 등급이에요. 등급이 올라갈수록 기본 포함 옵션들이 점점 추가되고 내부 시트의 퀄리티가 높아져요.."
    ).set {
        $0.isHidden = true
    }
    private let lineView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .GetYaPalette.gray900
    }
    private var lineViewTopConstarint: NSLayoutConstraint!
    private let trimLabel = CommonLabel(
        fontType: .mediumHead3,
        color: .GetYaPalette.gray200,
        text: "트림")
    
    // MARK: - Properties
    private let titleTexts = ["Exclusive", "Le Blanc (르블랑)", "Prestige", "Caligraphy"]
    private let tagTexts = [
        ["디젤 2.2", "7인승", "2WD"],
        ["디젤 2.2", "7인승", "2WD"],
        ["디젤 2.2", "7인승", "2WD"],
        ["디젤 2.2", "7인승", "2WD"]]
    private let descriptionTexts = ["합리적인 가격의 인기 옵션", "필수적인 옵션만 모은", "가치있는 드라이빙 경험을 주는", "남들과 차별화된 경험"]
    private let priceValues = [43460000, 40440000, 47720000, 52540000]
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureUI()
        setOptionContentData()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([
            headerView,
            difficultSelectButton,
            trimSubOptionContentStackView,
            trimOptionContentCollectionView,
            subOptionAreaTooltipView,
            trimAreaTooltipView,
            lineView,
            trimLabel
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureViewTapGesture()
        configureScrollView()
        configureContentView()
        configureHeaderView()
        configureDifficultSelectButton()
        configureTrimSubOptionContentView()
        configureTrimOptionContentCollectionView()
        configureSubOptionAreaTooltipView()
        configureTrimAreaTooltipView()
        configureLineView()
        configureTrimLabel()
    }
    
    private func configureViewTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(didTappedView)))
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
            contentView.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func configureHeaderView() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Constants.HeaderView.height)
        ])
    }
    
    private func configureDifficultSelectButton() {
        NSLayoutConstraint.activate([
            difficultSelectButton.topAnchor.constraint(
                equalTo: headerView.bottomAnchor,
                constant: Constants.DifficultSelectButton.topMargin),
            difficultSelectButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.DifficultSelectButton.trailingMargin),
            difficultSelectButton.widthAnchor.constraint(
                equalToConstant: Constants.DifficultSelectButton.width)
        ])
    }
    
    private func configureTrimSubOptionContentView() {
        NSLayoutConstraint.activate([
            trimSubOptionContentStackView.topAnchor.constraint(
                equalTo: difficultSelectButton.bottomAnchor,
                constant: Constants.TrimSubOptionContentView.topMarign),
            trimSubOptionContentStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.TrimSubOptionContentView.leadingMargin),
            trimSubOptionContentStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.TrimSubOptionContentView.trailingMargin)
        ])
    }
    
    private func configureTrimOptionContentCollectionView() {
        let const = Constants.TrimOptionContentCollectionView.self
        let height = createTrimOptionContentCollectionViewHeight()
        collectionViewHeightConstarint = trimOptionContentCollectionView
            .heightAnchor
            .constraint(equalToConstant: height)
        configureCollectionViewTopConstraint()
        NSLayoutConstraint.activate([
            trimOptionContentCollectionView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            trimOptionContentCollectionView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            trimOptionContentCollectionView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: const.bottomMargin),
            collectionViewHeightConstarint
        ])
    }
    
    private func configureSubOptionAreaTooltipView() {
        NSLayoutConstraint.activate([
            subOptionAreaTooltipView.topAnchor.constraint(
                equalTo: trimSubOptionContentStackView.bottomAnchor,
                constant: Constants.SubOptionAreaTooltipView.topMargin),
            subOptionAreaTooltipView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.SubOptionAreaTooltipView.leadingMargin),
            subOptionAreaTooltipView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.SubOptionAreaTooltipView.trailingMargin),
            subOptionAreaTooltipView.heightAnchor.constraint(
                equalToConstant: Constants.SubOptionAreaTooltipView.height)
        ])
    }
    
    private func configureTrimAreaTooltipView() {
        NSLayoutConstraint.activate([
            trimAreaTooltipView.topAnchor.constraint(
                equalTo: trimLabel.bottomAnchor,
                constant: Constants.TrimAreaTooltipView.topMargin),
            trimAreaTooltipView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.TrimAreaTooltipView.leadingMargin),
            trimAreaTooltipView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.TrimAreaTooltipView.trailingMargin),
            trimAreaTooltipView.heightAnchor.constraint(
                equalToConstant: Constants.TrimAreaTooltipView.height)
        ])
    }
    
    private func configureLineView() {
        configureLineViewTopConstraint()
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: Constants.LineView.height)
        ])
    }
    
    private func configureTrimLabel() {
        NSLayoutConstraint.activate([
            trimLabel.topAnchor.constraint(
                equalTo: lineView.bottomAnchor,
                constant: Constants.TrimLabel.topMargin),
            trimLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.TrimLabel.leadingMargin)
        ])
    }
    
    private func createTrimOptionContentCollectionViewHeight() -> CGFloat {
        let expandedCount = trimOptionContentCollectionView.expandedIndexPath.count
        let height = TrimOptionContentCollectionView.Constants.Cell.height *
        CGFloat(titleTexts.count - expandedCount) +
        TrimOptionContentCollectionView.Constants.Cell.expandedHeight *
        CGFloat(expandedCount)
        
        return height
    }
    
    private func setOptionContentData() {
        trimOptionContentCollectionView.setTitleTexts(texts: titleTexts)
        trimOptionContentCollectionView.setTagTexts(texts: tagTexts)
        trimOptionContentCollectionView.setDescriptionTexts(texts: descriptionTexts)
        trimOptionContentCollectionView.setPrice(values: priceValues)
    }

    // MARK: - Functions
    
    // MARK: - Objc Functions
    @objc private func touchUpDifficultSelectButton() {
        navigationController?.pushViewController(TrimDetailViewController(), animated: true)
    }
    
    @objc private func didTappedView() {
        setSubOptionAreaToolTipViewIsHidden(isHidden: true)
        setTrimAreaToolTipViewIsHidden(isHidden: true)
    }
    
    @objc private func didTappedCollectionView() {
        setSubOptionAreaToolTipViewIsHidden(isHidden: true)
        setTrimAreaToolTipViewIsHidden(isHidden: false)
    }
}

// MARK: - configure Constraints By Tooltip isHidden
extension TrimSelectViewController {
    private func setSubOptionAreaToolTipViewIsHidden(isHidden: Bool) {
        subOptionAreaTooltipView.isHidden = isHidden
        configureLineViewTopConstraint()
        self.view.updateConstraints()
    }
    
    private func setTrimAreaToolTipViewIsHidden(isHidden: Bool) {
        trimAreaTooltipView.isHidden = isHidden
        configureCollectionViewTopConstraint()
        self.view.updateConstraints()
    }
    
    private func configureCollectionViewTopConstraint() {
        if let collectionViewTopConstarint {
            collectionViewTopConstarint.isActive = false
        }
        if trimAreaTooltipView.isHidden {
            collectionViewTopConstarint = trimOptionContentCollectionView
                .topAnchor
                .constraint(
                    equalTo: trimLabel.bottomAnchor,
                    constant: Constants.TrimOptionContentCollectionView.topMarign)
        } else {
            collectionViewTopConstarint = trimOptionContentCollectionView
                .topAnchor
                .constraint(
                    equalTo: trimAreaTooltipView.bottomAnchor,
                    constant: Constants.TrimOptionContentCollectionView.tooltipTopMargin)
        }
        collectionViewTopConstarint.isActive = true
    }
    
    private func configureLineViewTopConstraint() {
        if let lineViewTopConstarint {
            lineViewTopConstarint.isActive = false
        }
        if subOptionAreaTooltipView.isHidden {
            lineViewTopConstarint = lineView.topAnchor.constraint(
                equalTo: trimSubOptionContentStackView.bottomAnchor,
                constant: Constants.LineView.topMargin)
        } else {
            lineViewTopConstarint = lineView.topAnchor.constraint(
                equalTo: subOptionAreaTooltipView.bottomAnchor,
                constant: Constants.LineView.tooltipTopMargin)
        }
        lineViewTopConstarint.isActive = true
    }
}

// MARK: - TrimSubOptionContentStackViewDelegate {
extension TrimSelectViewController: TrimSubOptionContentStackViewDelegate {
    func transferOptionText(type: TrimSubOptionContentStackView.OptionType) {
        var text = ""
        switch type {
        case .engine:
            text = "디젤은 연비가 좋고 가솔린은 승차감이 더 부드럽고 조용해요."
        case .body:
            text = "7인승의 경우 2열의 가운데에 시트가 없어 통행이 편하고 8인승의 경우 2열 가운데에 시트가 존재해요."
        case .system:
            text = "2WD는 두개의 모터로 구성되어 가볍고 효율이 좋고 4WD는 네개의 모터로 구성되어 주행 안정성이 높아요."
        }
        subOptionAreaTooltipView.configureText(text: text)
        setSubOptionAreaToolTipViewIsHidden(isHidden: false)
        setTrimAreaToolTipViewIsHidden(isHidden: true)
    }
}

// MARK: - TrimOptionContentCollectionViewDelegate
extension TrimSelectViewController: TrimOptionContentCollectionViewDelegate {
    func touchUpLearnMoreViewButton() {
        collectionViewHeightConstarint.isActive = false
        let height = createTrimOptionContentCollectionViewHeight()
        collectionViewHeightConstarint = trimOptionContentCollectionView
            .heightAnchor
            .constraint(equalToConstant: height)
        collectionViewHeightConstarint.isActive = true
        
        self.view.layoutIfNeeded()
    }
}
