//
//  DetailQuotationPreviewThumbnailView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class DetailQuotationPreviewThumbnailView: UIView {
    enum Constants {
        static let layerColors: [UIColor] = [
            UIColor(red: 0.9, green: 0.92, blue: 0.94, alpha: 1),
            UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1)]
        static let intrinsicContentHeight: CGFloat = .toScaledHeight(value: 348)
        enum RecommendDiscriptionView {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(16).scaledHeight
            static let font: GetYaFont = .mediumHead1
            static let fontColor: UIColor = .GetYaPalette.gray0
        }
        enum KeywordCollectionView {
            static let itemHeight: CGFloat = .toScaledHeight(value: 28)
            static let itemInterSpacing: CGFloat = .toScaledHeight(value: 6)
            static let maximumGroupHeight: CGFloat = .toScaledHeight(
                value: itemHeight*2 + itemInterSpacing)
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(41).scaledHeight
            static let trailingMargin = CGFloat(-16).scaledWidth
        }
        enum RecommendSubDiscriptionView {
            static let leadingMargin = CGFloat(16).scaledWidth
            static let topMargin = CGFloat(3).scaledHeight
            static let bottomMargin = CGFloat(79).scaledHeight
            static let font: GetYaFont = .regularBody4
            static let fontColor: UIColor = .GetYaPalette.gray200
        }
        enum RecommendCarImageView {
            static let leadingMargin = CGFloat(162).scaledWidth
            static let topMargin = CGFloat(25).scaledHeight
            static let bottomMargin = CGFloat(11).scaledHeight
            static let height = CGFloat(250).scaledHeight
        }
        enum RecommendCarBackgroundView {
            static let height = CGFloat(131).scaledHeight
            static let bgColor: UIColor = .GetYaPalette.gray300
        }
    }
    
    // MARK: - UI properties
    private let recommendDiscriptionView: CommonLabel = .init(
        fontType: Constants.RecommendDiscriptionView.font,
        color: Constants.RecommendDiscriptionView.fontColor,
        text: "질문에 기반한 추천 차량이에요"
    )
    private let recommendSubDiscriptionView: CommonLabel = .init(
        fontType: Constants.RecommendSubDiscriptionView.font,
        color: Constants.RecommendSubDiscriptionView.fontColor,
        text: "전국의 Car master 분들이 엄선하여 추천했어요"
    )
    private let recommendCarImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
    }
    private let recommendCarBackgroundView = UIView(frame: .zero).set {
        let const = Constants.RecommendCarBackgroundView.self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = const.bgColor
    }
    private lazy var keywordCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: tagLayout
    ).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .none
        $0.register(
            TagViewCell.self,
            forCellWithReuseIdentifier: TagViewCell.identifier)
        $0.dataSource = self
    }
    
    // MARK: - Properties
    var dataSource: [String] = []
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    override var bounds: CGRect {
        didSet {
            let gradient = CAGradientLayer()
            gradient.frame = bounds
            gradient.colors = Constants.layerColors.map { $0.cgColor }
            layer.insertSublayer(gradient, at: 0)
        }
    }
    
    convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Private
    private var tagLayout: UICollectionViewCompositionalLayout {
        typealias Const = Constants.KeywordCollectionView
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(45),
            heightDimension: .absolute(Const.itemHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(Const.maximumGroupHeight))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        group.interItemSpacing = .fixed(Const.itemInterSpacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = Const.itemInterSpacing
        return .init(section: section)
    }

    // MARK: - Helper
    func configureUI() {
        setupUI()
        bringSubviewToFront(recommendCarImageView)
    }
    
    func configure(imageUrl: String) {
        recommendCarImageView.setImage(urlString: imageUrl)
    }
    
    func configureRecommendKeywordStackView(_ texts: [String]) {
        dataSource = texts
        keywordCollectionView.reloadData()
    }
    
    func setInitialCarImageForAnimation() {
        _=recommendCarImageView.set {
            $0.alpha = 0.777
            $0.transform = .init(translationX: 27, y: 0.777)
        }
    }
    
    func showCarImageAnimation() {
        UIView.animate(
            withDuration: 0.7,
            delay: 0,
            options: [.curveEaseOut]
        ) {
            _=self.recommendCarImageView.set {
                $0.alpha = 1
                $0.transform = .identity
            }
        }
    }
}

// MARK: - LayoutSupportable
extension DetailQuotationPreviewThumbnailView: LayoutSupportable {
    func setupViews() {
        addSubviews([
            keywordCollectionView,
            recommendDiscriptionView,
            recommendSubDiscriptionView,
            recommendCarImageView,
            recommendCarBackgroundView])
    }
    
    func setupConstriants() {
        configureKeywordCollectionView()
        configureRecommendDiscriptionView()
        configureRecommendSubDiscriptionView()
        configurerecommendCarImageView()
        configureRecommendCarBackgroundView()
    }
}

// MARK: - UICollectionViewDataSource
extension DetailQuotationPreviewThumbnailView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TagViewCell.identifier,
            for: indexPath
        ) as? TagViewCell else { return .init() }
        cell.configure(with: dataSource[indexPath.row])
        return cell
    }
}

// MARK: - Layout supportable private helper
private extension DetailQuotationPreviewThumbnailView {
    func configureKeywordCollectionView() {
        typealias Const = Constants.KeywordCollectionView
        NSLayoutConstraint.activate([
            keywordCollectionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            keywordCollectionView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            keywordCollectionView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            keywordCollectionView
                .heightAnchor
                .constraint(greaterThanOrEqualToConstant: Const.itemHeight)])
    }
    
    func configureRecommendDiscriptionView() {
        typealias Const = Constants.RecommendDiscriptionView
        NSLayoutConstraint.activate([
            recommendDiscriptionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            recommendDiscriptionView.topAnchor.constraint(
                equalTo: keywordCollectionView.bottomAnchor,
                constant: Const.topMargin),
            recommendDiscriptionView.heightAnchor.constraint(
                lessThanOrEqualToConstant: Const.font.lineHeight)])
    }
    
    func configureRecommendSubDiscriptionView() {
        typealias Const = Constants.RecommendSubDiscriptionView
        NSLayoutConstraint.activate([
            recommendSubDiscriptionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            recommendSubDiscriptionView.topAnchor.constraint(
                equalTo: recommendDiscriptionView.bottomAnchor,
                constant: Const.topMargin),
            recommendSubDiscriptionView.bottomAnchor.constraint(
                equalTo: recommendCarBackgroundView.topAnchor,
                constant: -Const.bottomMargin),
            recommendSubDiscriptionView.heightAnchor.constraint(
                equalToConstant: Const.font.lineHeight)])
    }
    
    func configurerecommendCarImageView() {
        typealias Const = Constants.RecommendCarImageView
        NSLayoutConstraint.activate([
            recommendCarImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            recommendCarImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -Const.bottomMargin),
            recommendCarImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            recommendCarImageView.topAnchor.constraint(
                equalTo: recommendDiscriptionView.bottomAnchor),
            recommendCarImageView.heightAnchor.constraint(
                lessThanOrEqualToConstant: Const.height)])
    }
    
    func configureRecommendCarBackgroundView() {
        typealias Const = Constants.RecommendCarBackgroundView
        NSLayoutConstraint.activate([
            recommendCarBackgroundView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            recommendCarBackgroundView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            recommendCarBackgroundView.bottomAnchor.constraint(
                equalTo: bottomAnchor)])
    }
}
