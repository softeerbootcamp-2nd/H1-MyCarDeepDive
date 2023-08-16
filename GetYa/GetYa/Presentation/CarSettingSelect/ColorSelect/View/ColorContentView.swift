//
//  ColorContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/15.
//

import UIKit

// TODO: 서버에서 들어오는 데이터에 따라 모델 만들기
struct ColorSelectData {
    let name: String
    let colorImageURL: String
    let carImageURL: String
    let adoptionRate: Int
}

protocol ColorContentViewDelegate: AnyObject {
    func touchUpLearnMoreViewButton(type: ColorContentView.ColorType, isExpanded: Bool)
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
    
    enum ColorType {
        case exterior
        case interior
        
        var title: String {
            switch self {
            case .exterior:
                return "외장 색상"
            case .interior:
                return "내장 색상"
            }
        }
        
        var learnMoreText: String {
            switch self {
            case .exterior:
                return "다른 외장 색상을 찾고 있나요?"
            case .interior:
                return "다른 내장 색상을 찾고 있나요?"
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
        $0.delegate = self
    }
    
    // MARK: - Properties
    weak var delegate: ColorContentViewDelegate?
    private var colorType: ColorType = .exterior
    private var dataArray: [ColorSelectData] = [] {
        didSet {
            let names = dataArray.map { $0.name }
            let colorImages = dataArray.map { $0.colorImageURL }
            collectionView.setColorNames(names: names)
            collectionView.setColorImages(images: [
                UIImage(systemName: "house"),
                UIImage(systemName: "person"),
                UIImage(systemName: "airplane"),
                UIImage(systemName: "car"),
                UIImage(systemName: "bus"),
                UIImage(systemName: "ferry")
            ])
            collectionView.reloadData()
                        
            setLearnMoreContentData(
                trimNames: [
                    "Caligraphy",
                    "Caligraphy",
                    "Prestige",
                    "Exclusive",
                    "Prestige",
                    "Prestige"],
                images: [
                    UIImage(systemName: "house"),
                    UIImage(systemName: "person"),
                    UIImage(systemName: "airplane"),
                    UIImage(systemName: "car"),
                    UIImage(systemName: "bus"),
                    UIImage(systemName: "ferry")])
        }
    }
    
    // MARK: - Lifecycles
    
    // TODO: ColorArray가 서버에서 받을 데이터로 대체될 것임.
    init(type: ColorType, headerView: UIView, dataArray: [ColorSelectData]) {
        super.init(frame: .zero)
        
        setupViews()
        setDataArray(dataArray: dataArray)
//        setupLearnMoreContentView(
//            trimNames: [
//                "Caligraphy",
//                "Caligraphy",
//                "Prestige",
//                "Exclusive",
//                "Prestige",
//                "Prestige"],
//            images: [
//                UIImage(systemName: "house"),
//                UIImage(systemName: "person"),
//                UIImage(systemName: "airplane"),
//                UIImage(systemName: "car"),
//                UIImage(systemName: "bus"),
//                UIImage(systemName: "ferry")])
//        setupLearnMoreContentView(
//            trimNames: [],
//            images: [])
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
        self.titleLabel.text = type.title
        self.learnMoreView.configureText(text: type.learnMoreText)
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
    func setDataArray(dataArray: [ColorSelectData]) {
        self.dataArray = dataArray
    }
    
    func setLearnMoreContentData(trimNames: [String], images: [UIImage?]) {
        learnMoreView.setColorData(trimNames: trimNames, colorImages: images)
    }
    
    // MARK: - Objc Functions
}

// MARK: - LearnMoreViewDelegate
extension ColorContentView: LearnMoreViewDelegate {
    func touchUpExpandButtonByIsSelected(isSelected: Bool) {
        delegate?.touchUpLearnMoreViewButton(type: colorType, isExpanded: isSelected)
    }
}

// MARK: - ColorSelectColorCollectionViewDelegate
extension ColorContentView: ColorSelectColorDelegate {
    func touchUpColorCell(index: Int) {
        colorNameLabel.text = dataArray[index].name
        adoptionRateLabel.text = "\(dataArray[index].adoptionRate)"
    }
}
