//
//  ColorContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/15.
//

import UIKit

protocol ColorContentViewDelegate: AnyObject {
    func touchUpCell(type: ColorType, color: Color)
    func touchUpLearnMoreViewButton(type: ColorType, isExpanded: Bool)
}

class ColorContentView: UIView {
    enum Constants {
        enum HeaderView {
            static let height: CGFloat = .toScaledHeight(value: 185)
        }
        enum TitleLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 24)
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
    private var titleLabelTopConstraint: NSLayoutConstraint!
    private let titleLabel = CommonLabel(
        fontType: .mediumHead3,
        color: .GetYaPalette.gray0)
    private let colorNameLabel = CommonLabel(
        fontType: .mediumBody4,
        color: .GetYaPalette.gray100)
    private let adoptionRateLabel = CommonLabel(
        fontType: .mediumCaption1,
        color: .GetYaPalette.gray300)
    private lazy var collectionView = ColorSelectColorCollectionView().set {
        $0.colorSelectDelegate = self
    }
    private lazy var learnMoreView = ColorLearnMoreView().set {
        $0.colorLearnMoreViewDelegate = self
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
            
            setLearnMoreContentData(colorArray: trimColor.otherTrimColors)
        }
    }
    
    // MARK: - Lifecycles
    init(type: ColorType, headerView: UIView) {
        super.init(frame: .zero)
        
        setupViews()
        setupHeaderView(view: headerView)
        configureUI()
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
    
    private func setupHeaderView(view: UIView) {
        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: Constants.HeaderView.height)
        ])
        if let titleLabelTopConstraint {
            titleLabelTopConstraint.isActive = false
        }
        titleLabelTopConstraint = titleLabel.topAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: Constants.TitleLabel.topMargin)
        titleLabelTopConstraint.isActive = true
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
                constant: Constants.TitleLabel.leadingMargin)
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
        collectionView.selectItem(at: [0, 0], animated: false, scrollPosition: .init())
        collectionView.collectionView(collectionView.self, didSelectItemAt: [0, 0])
        
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
    
    // MARK: - Functions
    func setTrimColor(color: TrimColor) {
        trimColor = color
    }
    
    func setLearnMoreContentData(colorArray: [Color]) {
        learnMoreView.setColor(colorArray: colorArray)
    }
    
    // MARK: - Objc Functions
}

// MARK: - LearnMoreViewDelegate
extension ColorContentView: LearnMoreViewDelegate {
    func touchUpExpandButtonByIsSelected(sender: LearnMoreView, isSelected: Bool) {
        delegate?.touchUpLearnMoreViewButton(type: colorType, isExpanded: isSelected)
    }
}

// MARK: - ColorLearnMoreViewDelegate
extension ColorContentView: ColorLearnMoreViewDelegate {
    func touchUpMoreColorCell(color: Color) {
        delegate?.touchUpCell(type: colorType, color: color)
    }
}

// MARK: - ColorSelectColorCollectionViewDelegate
extension ColorContentView: ColorSelectColorDelegate {
    func touchUpColorCell(index: Int, isAvailable: Bool) {
        guard let trimColor else { return }
        let color = isAvailable ? trimColor.availableColors[index] : trimColor.unAvailableColors[index]
        delegate?.touchUpCell(type: colorType, color: color)
        colorNameLabel.text = color.name
        adoptionRateLabel.text = "\(color.selectRate)%의 구매자가 선택한"
        adoptionRateLabel.configurePartTextColor(
            partText: "\(color.selectRate)%",
            partTextColor: .GetYaPalette.acriveBlue)
    }
}
