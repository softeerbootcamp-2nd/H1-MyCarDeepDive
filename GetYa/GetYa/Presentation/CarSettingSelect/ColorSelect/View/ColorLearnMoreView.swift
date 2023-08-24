//
//  ColorLearnMoreView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/16.
//

import UIKit

protocol ColorLearnMoreViewDelegate: AnyObject {
    func touchUpMoreColorCell(color: Color)
}

class ColorLearnMoreView: LearnMoreView {
    enum Constants {
        enum Label {
            static let topMargin: CGFloat = .toScaledHeight(value: 12)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
        }
        enum EmptyLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
        }
        enum CollectionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 12)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 26)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -26)
            static let height: CGFloat = .toScaledWidth(value: 108)
        }
    }
    
    // MARK: - UI properties
    private let label = CommonLabel(fontType: .mediumBody4, color: .GetYaPalette.primary)
    private lazy var collectionView = ColorSelectMoreColorCollectionView().set {
        $0.colorSelectDelegate = self
        $0.isHidden = true
    }
    private var collectionViewHeightConstraint: NSLayoutConstraint!
    private let emptyLabel = CommonLabel(
        fontType: .mediumBody3,
        color: .GetYaPalette.gray0,
        text: "다른 색상이 없습니다."
    ).set {
        $0.isHidden = true
    }
    
    // MARK: - Properties
    private var colorArray: [Color] = []
    weak var colorLearnMoreViewDelegate: ColorLearnMoreViewDelegate?
    
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
            label,
            collectionView,
            emptyLabel
        ])
    }
    
    private func configureUI() {
        clipsToBounds = true
        
        configureLabel()
        configureEmptyLabel()
        configureCollectionView()
        configureButton(view: label)
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.Label.topMargin),
            label.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.Label.leadingMargin)
        ])
    }
    
    private func configureEmptyLabel() {
        typealias Const = Constants.EmptyLabel
        
        NSLayoutConstraint.activate([
            emptyLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Const.topMargin),
            emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func configureCollectionView() {
        typealias Const = Constants.CollectionView
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: Const.height)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: label.bottomAnchor,
                constant: Const.topMargin),
            collectionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            collectionView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            collectionViewHeightConstraint
        ])
    }
    
    // MARK: - Functions
    func configureText(type: ColorType) {
        switch type {
        case .exterior:
            label.text = "다른 외장 색상을 찾고 있나요?"
        case .interior:
            label.text = "다른 내장 색상을 찾고 있나요?"
        }
    }
    
    func configureTextColor(color: UIColor) {
        label.textColor = color
    }
    
    func setColor(colorArray: [Color]) {
        typealias Const = Constants.CollectionView
        self.colorArray = colorArray
        
        if colorArray.count == 0 {
            collectionView.isHidden = true
            emptyLabel.isHidden = false
        } else {
            emptyLabel.isHidden = true
            collectionView.setColorArray(colorArray: colorArray)
            collectionView.isHidden = false

            collectionViewHeightConstraint.isActive = false
            collectionViewHeightConstraint.constant = Const.height * ceil(CGFloat(colorArray.count) / 4)
            collectionViewHeightConstraint.isActive = true
        }
    }
    
    func setColorType(colorType: ColorType) {
        collectionView.setColorType(type: colorType)
    }
    
    // MARK: - Objc Functions
}

// MARK: - ColorSelectMoreColorDelegate
extension ColorLearnMoreView: ColorSelectMoreColorDelegate {
    func touchUpMoreColorCell(index: Int) {
        colorLearnMoreViewDelegate?.touchUpMoreColorCell(color: colorArray[index])
    }
}
