//
//  TrimOptionDetailView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/12.
//

import UIKit

class TrimOptionDetailView: UIView, UICollectionViewDelegate {
    enum Constants {
        enum ExteriorColorCollectionview {
            static let topMargin = CGFloat(4).scaledHeight
            static let height = CGFloat(24).scaledHeight
        }
        enum InteriorLabel {
            static let topMargin = CGFloat(20).scaledHeight
        }
        enum InteriorColorCollectionview {
            static let topMargin = CGFloat(4).scaledHeight
            static let height = CGFloat(24).scaledHeight
        }
        enum OptionLabel {
            static let topMargin = CGFloat(20).scaledHeight
        }
        enum OptionCollectionView {
            static let topMargin = CGFloat(4).scaledHeight
            static let bottomMargin = CGFloat(-8).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let exteriorLabel = CommonLabel(
        fontType: .regularCaption1,
        color: .GetYaPalette.gray300,
        text: "외장")
    private lazy var exteriorColorCollectionview = TrimOptionDetailColorCollectionView(
        colorArray: exteriorColorArray)
    private let interiorLabel = CommonLabel(
        fontType: .regularCaption1,
        color: .GetYaPalette.gray300,
        text: "내장")
    private lazy var interiorColorCollectionView = TrimOptionDetailColorCollectionView(
        colorArray: interiorColorArray)
    private let optionlabel = CommonLabel(
        fontType: .regularCaption1,
        color: .GetYaPalette.gray300,
        text: "기본 포함 옵션")
    private lazy var optionCollectionView = TrimOptionDetailOptionCollectionView(
        optionImages: optionImages,
        optionDescriptionTexts: optionDescriptionTexts)
    
    // MARK: - Properties
    private var exteriorColorArray: [UIColor] = [] {
        didSet {
            exteriorColorCollectionview.setColorArray(colorArray: exteriorColorArray)
        }
    }
    private var interiorColorArray: [UIColor] = [] {
        didSet {
            interiorColorCollectionView.setColorArray(colorArray: interiorColorArray)
        }
    }
    private var optionImages: [UIImage?] = [] {
        didSet {
            optionCollectionView.setOptionImages(images: optionImages)
        }
    }
    private var optionDescriptionTexts: [String] = [] {
        didSet {
            optionCollectionView.setDescriptionTexts(texts: optionDescriptionTexts)
        }
    }
    
    // MARK: - Lifecycles
    init(
        exteriorColorArray: [UIColor],
        interiorColorArray: [UIColor],
        optionImages: [UIImage?],
        optionDescriptionTexts: [String]
    ) {
        super.init(frame: .zero)
        
        setupViews()
        configureUI()
        setExteriorColorArray(colorArray: exteriorColorArray)
        setInteriorColorArray(colorArray: interiorColorArray)
        setOptionImages(images: optionImages)
        setOptionDescriptionTexts(texts: optionDescriptionTexts)
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
            exteriorLabel,
            exteriorColorCollectionview,
            interiorLabel,
            interiorColorCollectionView,
            optionlabel,
            optionCollectionView
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureExteriorLabel()
        configureExteriorColorCollectionView()
        configureInteriorLabel()
        configureInteriorColorCollectionView()
        configureOptionLabel()
        configureOptionCollectionView()
    }
    
    private func configureExteriorLabel() {
        NSLayoutConstraint.activate([
            exteriorLabel.topAnchor.constraint(equalTo: topAnchor),
            exteriorLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func configureExteriorColorCollectionView() {
        NSLayoutConstraint.activate([
            exteriorColorCollectionview.topAnchor.constraint(
                equalTo: exteriorLabel.bottomAnchor,
                constant: Constants.ExteriorColorCollectionview.topMargin),
            exteriorColorCollectionview.leadingAnchor.constraint(equalTo: leadingAnchor),
            exteriorColorCollectionview.trailingAnchor.constraint(equalTo: trailingAnchor),
            exteriorColorCollectionview.heightAnchor.constraint(
                equalToConstant: Constants.ExteriorColorCollectionview.height)
        ])
    }
    
    private func configureInteriorLabel() {
        NSLayoutConstraint.activate([
            interiorLabel.topAnchor.constraint(
                equalTo: exteriorColorCollectionview.bottomAnchor,
                constant: Constants.InteriorLabel.topMargin),
            interiorLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func configureInteriorColorCollectionView() {
        NSLayoutConstraint.activate([
            interiorColorCollectionView.topAnchor.constraint(
                equalTo: interiorLabel.bottomAnchor,
                constant: Constants.InteriorColorCollectionview.topMargin),
            interiorColorCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            interiorColorCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            interiorColorCollectionView.heightAnchor.constraint(
                equalToConstant: Constants.InteriorColorCollectionview.height)
        ])
    }
    
    private func configureOptionLabel() {
        NSLayoutConstraint.activate([
            optionlabel.topAnchor.constraint(
                equalTo: interiorColorCollectionView.bottomAnchor,
                constant: Constants.OptionLabel.topMargin),
            optionlabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func configureOptionCollectionView() {
        NSLayoutConstraint.activate([
            optionCollectionView.topAnchor.constraint(
                equalTo: optionlabel.bottomAnchor,
                constant: Constants.OptionCollectionView.topMargin),
            optionCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionCollectionView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.OptionCollectionView.bottomMargin)
        ])
    }
    
    // MARK: - Functions
    func setExteriorColorArray(colorArray: [UIColor]) {
        exteriorColorArray = colorArray
    }
    
    func setInteriorColorArray(colorArray: [UIColor]) {
        interiorColorArray = colorArray
    }
    
    func setOptionImages(images: [UIImage?]) {
        optionImages = images
    }
    
    func setOptionDescriptionTexts(texts: [String]) {
        optionDescriptionTexts = texts
    }
}
