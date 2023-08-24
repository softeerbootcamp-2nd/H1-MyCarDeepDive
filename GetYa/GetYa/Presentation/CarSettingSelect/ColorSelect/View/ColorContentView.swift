//
//  ColorContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/15.
//

import UIKit

protocol ColorContentViewDelegate: AnyObject {
    func touchUpLearnMoreViewButton(type: ColorType, isExpanded: Bool)
}

class ColorContentView: UIView {
    enum Constants {
        enum HeaderView {
            static let height: CGFloat = .toScaledHeight(value: 185)
        }
        enum TitleLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 209)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
        }
        enum ColorNameLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 14)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
        }
        enum AdoptionRateLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
        }
        enum CollectionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 12)
            static let height: CGFloat = .toScaledHeight(value: 64)
        }
        enum LearnMoreView {
            static let topMargin: CGFloat = .toScaledHeight(value: 12)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            enum ContentView {
                static let collectionViewHeight: CGFloat = .toScaledHeight(value: 108)
                static let emptyLabelHeight: CGFloat = .toScaledHeight(value: 50)
            }
        }
    }
    
    // MARK: - UI properties
    private let titleLabel = CommonLabel(
        fontType: .mediumHead3,
        color: .GetYaPalette.gray0)
    private let colorNameLabel = CommonLabel(
        fontType: .mediumBody4,
        color: .GetYaPalette.gray100)
    private let adoptionRateLabel = CommonLabel(
        fontType: .mediumCaption1,
        color: .GetYaPalette.gray300)
    private lazy var collectionView = ColorSelectColorCollectionView()
    private lazy var learnMoreView = ColorLearnMoreView().set {
        $0.delegate = self
    }
    
    // MARK: - Properties
    weak var delegate: ColorContentViewDelegate?
    private var colorType: ColorType = .exterior
    private var trimColor: TrimColor? {
        didSet {
            guard let trimColor else { return }
            collectionView.setAvailableColorArray(colorArray: trimColor.availableColors)
            collectionView.setUnAvailableColorArray(colorArray: trimColor.unAvailableColors)
            collectionView.reloadData()
            setDataByTrimColor(color: trimColor.availableColors[0])
            setLearnMoreContentData(colorArray: trimColor.otherTrimColors)
        }
    }
    
    // MARK: - Lifecycles
    convenience init(type: ColorType) {
        self.init(frame: .zero)
        configureByColorType(type: type)
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
            titleLabel,
            colorNameLabel,
            adoptionRateLabel,
            collectionView,
            learnMoreView
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureTitleLabel()
        configureColorNameLabel()
        configureAdoptionRateLabel()
        configureCollectionView()
        configureLaernMoreView()
    }
    
    private func configureByColorType(type: ColorType) {
        collectionView.setColorType(type: type)
        self.colorType = type
        self.titleLabel.text = type == .exterior ? "외장 색상" : "내장 색상"
        self.learnMoreView.configureText(type: type)
    }
    
    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.TitleLabel.leadingMargin),
            titleLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.TitleLabel.topMargin)
        ])
    }
    
    private func configureColorNameLabel() {
        NSLayoutConstraint.activate([
            colorNameLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Constants.ColorNameLabel.topMargin),
            colorNameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.ColorNameLabel.leadingMargin)
        ])
    }
    
    private func configureAdoptionRateLabel() {
        NSLayoutConstraint.activate([
            adoptionRateLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Constants.AdoptionRateLabel.topMargin),
            adoptionRateLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.AdoptionRateLabel.trailingMargin)
        ])
    }
    
    private func configureCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: colorNameLabel.bottomAnchor,
                constant: Constants.CollectionView.topMargin),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(
                equalToConstant: Constants.CollectionView.height)
        ])
    }
    
    private func configureLaernMoreView() {
        NSLayoutConstraint.activate([
            learnMoreView.topAnchor.constraint(
                equalTo: collectionView.bottomAnchor,
                constant: Constants.LearnMoreView.topMargin),
            learnMoreView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.LearnMoreView.leadingMargin),
            learnMoreView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.LearnMoreView.trailingMargin),
            learnMoreView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func selectCollectionViewCell(index: Int) {
        collectionView.setSelectedIndexPath(index: index)
    }
    
    // MARK: - Functions
    func setupHeaderView(view: UIView) {
        subviews.forEach {
            if $0 is UIImageView || $0 is RotationView {
                $0.removeFromSuperview()
            }
        }
        
        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: Constants.HeaderView.height)
        ])
    }
    
    func setTrimColor(color: TrimColor, selectIndex: Int) {
        trimColor = color
        selectCollectionViewCell(index: selectIndex)
    }
    
    func setSelectIndex(index: Int) {
        selectCollectionViewCell(index: index)
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }
    
    func setDataByTrimColor(color: Color) {
        colorNameLabel.text = color.name
        adoptionRateLabel.text = "\(color.selectRate)%의 구매자가 선택한"
        adoptionRateLabel.configurePartTextColor(
            partText: "\(color.selectRate)%",
            partTextColor: .GetYaPalette.acriveBlue)
    }
    
    func setLearnMoreContentData(colorArray: [Color]) {
        learnMoreView.setColor(colorArray: colorArray)
        learnMoreView.setColorType(colorType: colorType)
    }
    
    // MARK: - Objc Functions
}

// MARK: - LearnMoreViewDelegate
extension ColorContentView: LearnMoreViewDelegate {
    func touchUpExpandButtonByIsSelected(sender: LearnMoreView, isSelected: Bool) {
        delegate?.touchUpLearnMoreViewButton(type: colorType, isExpanded: isSelected)
    }
}
