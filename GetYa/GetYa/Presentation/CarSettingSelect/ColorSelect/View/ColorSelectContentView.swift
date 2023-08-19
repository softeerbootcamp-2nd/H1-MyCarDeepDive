//
//  ColorSelectContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/16.
//

import UIKit

class ColorSelectContentView: UIScrollView {
    enum Constnats {
        enum InteriorContentView {
            static let topMargin: CGFloat = .toScaledHeight(value: 56)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -147)
        }
        static let contentViewHeight: CGFloat = .toScaledHeight(value: 401)
    }
    
    // MARK: - UI properties
    private let contentView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var exteriorContentView = ColorContentView(
        type: .exterior,
        headerView: RotationView(type: .abyss),
        dataArray: exteriorDataArray
    ).set {
        $0.delegate = self
    }
    private var exteriorContentViewHeightContraint: NSLayoutConstraint!
    private lazy var interiorContentView = ColorContentView(
        type: .interior,
        headerView: UIImageView(image: UIImage(named: "LifeStylePeekTitle")).set {
            $0.translatesAutoresizingMaskIntoConstraints = false
        },
        dataArray: interiorDataArray
    ).set {
        $0.delegate = self
    }
    private var interiorContentViewHeightContraint: NSLayoutConstraint!
    
    // MARK: - Properties
    private let exteriorDataArray: [ColorSelectData] = [
        ColorSelectData(name: "크리미 화이트 펄", colorImageURL: "", carImageURL: "", adoptionRate: 75),
        ColorSelectData(name: "쉬머링실버 메탈릭", colorImageURL: "", carImageURL: "", adoptionRate: 30),
        ColorSelectData(name: "문라이트 블루 펄", colorImageURL: "", carImageURL: "", adoptionRate: 50),
        ColorSelectData(name: "어비스 블랙펄", colorImageURL: "", carImageURL: "", adoptionRate: 15),
        ColorSelectData(name: "로버스트 에메랄드 펄", colorImageURL: "", carImageURL: "", adoptionRate: 15),
        ColorSelectData(name: "가이아 브라운 펄", colorImageURL: "", carImageURL: "", adoptionRate: 15)
    ]
    private let interiorDataArray: [ColorSelectData] = [
        ColorSelectData(name: "크리미 화이트 펄", colorImageURL: "", carImageURL: "", adoptionRate: 75),
        ColorSelectData(name: "쉬머링실버 메탈릭", colorImageURL: "", carImageURL: "", adoptionRate: 30),
        ColorSelectData(name: "문라이트 블루 펄", colorImageURL: "", carImageURL: "", adoptionRate: 50),
        ColorSelectData(name: "어비스 블랙펄", colorImageURL: "", carImageURL: "", adoptionRate: 15),
        ColorSelectData(name: "로버스트 에메랄드 펄", colorImageURL: "", carImageURL: "", adoptionRate: 15),
        ColorSelectData(name: "가이아 브라운 펄", colorImageURL: "", carImageURL: "", adoptionRate: 15)
    ]
    
    // MARK: - Lifecycles
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
        addSubview(contentView)
        
        contentView.addSubviews([
            exteriorContentView,
            interiorContentView
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        backgroundColor = .white
        
        configureContentView()
        configureExteriorContentView()
        configureInteriorContentView()
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
    
    private func configureExteriorContentView() {
        exteriorContentViewHeightContraint = exteriorContentView.heightAnchor.constraint(
            equalToConstant: Constnats.contentViewHeight)
        
        NSLayoutConstraint.activate([
            exteriorContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            exteriorContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            exteriorContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            exteriorContentViewHeightContraint
        ])
    }
    
    private func configureInteriorContentView() {
        let const = Constnats.InteriorContentView.self
        interiorContentViewHeightContraint = interiorContentView.heightAnchor.constraint(
            equalToConstant: Constnats.contentViewHeight)
        
        NSLayoutConstraint.activate([
            interiorContentView.topAnchor.constraint(
                equalTo: exteriorContentView.bottomAnchor,
                constant: const.topMargin),
            interiorContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            interiorContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            interiorContentViewHeightContraint,
            interiorContentView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: const.bottomMargin)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
}

// MARK: - ColorContentViewDelegate
extension ColorSelectContentView: ColorContentViewDelegate {
    func touchUpLearnMoreViewButton(type: ColorContentView.ColorType, isExpanded: Bool) {
        typealias Const = ColorContentView.Constants.LearnMoreView.ContentView
        let basicHeight = Constnats.contentViewHeight
        let exteriorMoreColorCount = 6
        let interiorMoreColorCount = 6
        var exteriorExpandedHeight = basicHeight + Const.collectionViewHeight * CGFloat(exteriorMoreColorCount / 4)
        exteriorExpandedHeight += exteriorMoreColorCount == 0 ? Const.emptyLabelHeight : Const.collectionViewHeight
        var interiorExpandedHeight = basicHeight + Const.collectionViewHeight * CGFloat(interiorMoreColorCount / 4)
        interiorExpandedHeight += interiorMoreColorCount == 0 ? Const.emptyLabelHeight : Const.collectionViewHeight
        switch type {
        case .exterior:
            exteriorContentViewHeightContraint.isActive = false
            exteriorContentViewHeightContraint.constant = isExpanded ? exteriorExpandedHeight : basicHeight
            exteriorContentViewHeightContraint.isActive = true
        case .interior:
            interiorContentViewHeightContraint.isActive = false
            interiorContentViewHeightContraint.constant = isExpanded ? interiorExpandedHeight : basicHeight
            interiorContentViewHeightContraint.isActive = true
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutIfNeeded()
        })
    }
}
