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
            static let height = CGFloat(185).scaledHeight
        }
        enum DifficultSelectButton {
            static let topMargin = CGFloat(20).scaledHeight
            static let trailingMargin = CGFloat(-16).scaledWidth
            static let width = CGFloat(112).scaledWidth
        }
        enum TrimSubOptionContentView {
            static let topMarign = CGFloat(12).scaledHeight
            static let leadingMargin = CGFloat(16).scaledWidth
            static let trailingMargin = CGFloat(-16).scaledWidth
        }
        enum TrimOptionContentCollectionView {
            static let topInset = CGFloat(8).scaledHeight
            static let topMarign = CGFloat(25).scaledHeight
            static let bottomMargin = CGFloat(-145).scaledHeight
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
    private let difficultSelectButton: UIButton = UIButton().set {
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
    }
    private let trimSubOptionContentStackView = TrimSubOptionContentStackView()
    private lazy var trimOptionContentCollectionView = TrimOptionContentCollectionView().set {
        $0.contentInset = UIEdgeInsets(
            top: Constants.TrimOptionContentCollectionView.topInset,
            left: 0,
            bottom: 0,
            right: 0)
        $0.learnMoreViewDelegate = self
    }
    private var collectionViewHeightConstarint: NSLayoutConstraint!
    
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
            trimOptionContentCollectionView
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureScrollView()
        configureContentView()
        configureHeaderView()
        configureDifficultSelectButton()
        configureTrimSubOptionContentView()
        configureTrimOptionContentCollectionView()
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
        
        NSLayoutConstraint.activate([
            trimOptionContentCollectionView.topAnchor.constraint(
                equalTo: trimSubOptionContentStackView.bottomAnchor,
                constant: const.topMarign),
            trimOptionContentCollectionView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            trimOptionContentCollectionView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            trimOptionContentCollectionView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: const.bottomMargin),
            collectionViewHeightConstarint
        ])
    }
    
    private func createTrimOptionContentCollectionViewHeight() -> CGFloat {
        let expandedCount = trimOptionContentCollectionView.expandedIndexPath.count
        let height = TrimOptionContentCollectionView.Constants.HeaderView.height +
        TrimOptionContentCollectionView.Constants.Cell.height *
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
