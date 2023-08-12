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
        configureExteriorColorArray(colorArray: exteriorColorArray)
        configureInteriorColorArray(colorArray: interiorColorArray)
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
            optionlabel
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureExteriorLabel()
        configureInteriorLabel()
        configureExteriorColorCollectionView()
        configureInteriorColorCollectionView()
        configureOptionLabel()
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
    
    // MARK: - Functions
    func configureExteriorColorArray(colorArray: [UIColor]) {
        exteriorColorArray = colorArray
    }
    
    func configureInteriorColorArray(colorArray: [UIColor]) {
        interiorColorArray = colorArray
    }
}
