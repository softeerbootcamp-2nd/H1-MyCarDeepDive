//
//  ColorSelectContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/16.
//

import UIKit

protocol ColorSelectContentViewDelegate: AnyObject {
    func touchUpColorCell(type: ColorType, color: Color)
}

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
    private lazy var exteriorContentView = ColorContentView(type: .exterior).set {
        $0.delegate = self
    }
    private var exteriorContentViewHeightContraint: NSLayoutConstraint!
    private lazy var interiorContentView = ColorContentView(type: .interior).set {
        $0.delegate = self
    }
    private var interiorContentViewHeightContraint: NSLayoutConstraint!
    
    // MARK: - Properties
    weak var contentDelegate: ColorSelectContentViewDelegate?
    private var exteriorColorSelectIndex: Int = 0
    private var interiorColorSelectIndex: Int = 0
    private var exteriorColor: TrimColor? {
        didSet {
            guard let exteriorColor else { return }
            exteriorContentView.setTrimColor(
                color: exteriorColor,
                selectIndex: exteriorColorSelectIndex)
            exteriorContentView.setupHeaderView(view: RotationView().set {
                $0.setImageURLArray(
                    imageURLArray: exteriorColor.availableColors[exteriorColorSelectIndex].carImageURLArray)
            })
        }
    }
    private var interiorColor: TrimColor? {
        didSet {
            guard let interiorColor else { return }
            interiorContentView.setTrimColor(
                color: interiorColor,
                selectIndex: interiorColorSelectIndex)
        }
    }
    
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
    func setData(exteriorColor: TrimColor, interiorColor: TrimColor) {
        self.exteriorColor = exteriorColor
        self.interiorColor = interiorColor
        exteriorContentView.setTrimColor(color: exteriorColor, selectIndex: 0)
        exteriorContentView.setupHeaderView(view: RotationView().set {
            $0.setImageURLArray(imageURLArray: exteriorColor.availableColors[0].carImageURLArray)
        })
        interiorContentView.setTrimColor(color: interiorColor, selectIndex: 0)
        interiorContentView.setupHeaderView(view: UIImageView().set {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setImage(urlString: interiorColor.availableColors[0].carImageURLArray[0])
        })
    }
    
    func setData(exteriorColorSelect: ColorSelectModel) {
        guard let colorAndIndex = exteriorColor?.availableColors
            .enumerated()
            .filter({ $0.element.colorID == exteriorColorSelect.colorID }).first else { return }
        exteriorContentView.setSelectIndex(index: colorAndIndex.offset)
        exteriorContentView.setDataByTrimColor(color: colorAndIndex.element)
        exteriorContentView.setupHeaderView(view: RotationView().set {
            $0.setImageURLArray(imageURLArray: colorAndIndex.element.carImageURLArray)
        })
        self.exteriorContentView.reloadCollectionView()
    }
    
    func setData(interiorColorSelect: ColorSelectModel) {
        guard let colorAndIndex = interiorColor?.availableColors
            .enumerated()
            .filter({ $0.element.colorID == interiorColorSelect.colorID }).first else { return }
        interiorContentView.setSelectIndex(index: colorAndIndex.offset)
        interiorContentView.setDataByTrimColor(color: colorAndIndex.element)
        interiorContentView.setupHeaderView(view: UIImageView().set {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setImage(urlString: colorAndIndex.element.carImageURLArray[0])
        })
        self.interiorContentView.reloadCollectionView()
    }
    
    func setData(
        exteriorColor: TrimColor,
        interiorColorSelect: ColorSelectModel,
        selectIndex: Int
    ) {
        self.exteriorColorSelectIndex = selectIndex
        self.exteriorColor = exteriorColor
        
        guard let colorAndIndex = interiorColor?.availableColors
            .enumerated()
            .filter({ $0.element.colorID == interiorColorSelect.colorID }).first else { return }
        interiorContentView.setSelectIndex(index: colorAndIndex.offset)
        interiorContentView.setDataByTrimColor(color: colorAndIndex.element)
        interiorContentView.setupHeaderView(view: UIImageView().set {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setImage(urlString: colorAndIndex.element.carImageURLArray[0])
        })
        self.interiorContentView.reloadCollectionView()
    }
    
    func setData(
        interiorColor: TrimColor,
        exteriorColorSelect: ColorSelectModel,
        selectIndex: Int
    ) {
        self.interiorColorSelectIndex = selectIndex
        self.interiorColor = interiorColor
        interiorContentView.setupHeaderView(view: UIImageView().set {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setImage(urlString: interiorColor.availableColors[selectIndex].carImageURLArray[0])
        })
        guard let colorAndIndex = exteriorColor?.availableColors
            .enumerated()
            .filter({ $0.element.colorID == exteriorColorSelect.colorID }).first else { return }
        exteriorContentView.setSelectIndex(index: colorAndIndex.offset)
        exteriorContentView.setDataByTrimColor(color: colorAndIndex.element)
        exteriorContentView.setupHeaderView(view: RotationView().set {
            $0.setImageURLArray(imageURLArray: colorAndIndex.element.carImageURLArray)
        })
        self.exteriorContentView.reloadCollectionView()
    }
    
    // MARK: - Objc Functions
}

// MARK: - ColorContentViewDelegate
extension ColorSelectContentView: ColorContentViewDelegate {
    func touchUpCell(type: ColorType, color: Color) {
        contentDelegate?.touchUpColorCell(type: type, color: color)
    }
    
    func touchUpLearnMoreViewButton(type: ColorType, isExpanded: Bool) {
        typealias Const = ColorContentView.Constants.LearnMoreView.ContentView
        let basicHeight = Constnats.contentViewHeight
        switch type {
        case .exterior:
            guard let exteriorMoreColorCount = exteriorColor?.otherTrimColors.count else { return }
            var exteriorExpandedHeight = basicHeight
            + Const.collectionViewHeight
            * CGFloat((exteriorMoreColorCount - 1) / 4)
            exteriorExpandedHeight += exteriorMoreColorCount == 0 ? Const.emptyLabelHeight : Const.collectionViewHeight
            
            exteriorContentViewHeightContraint.isActive = false
            exteriorContentViewHeightContraint.constant = isExpanded ? exteriorExpandedHeight : basicHeight
            exteriorContentViewHeightContraint.isActive = true
        case .interior:
            guard let interiorMoreColorCount = interiorColor?.otherTrimColors.count else { return }
            var interiorExpandedHeight = basicHeight
            + Const.collectionViewHeight
            * CGFloat((interiorMoreColorCount - 1) / 4)
            interiorExpandedHeight += interiorMoreColorCount == 0 ? Const.emptyLabelHeight : Const.collectionViewHeight
            
            interiorContentViewHeightContraint.isActive = false
            interiorContentViewHeightContraint.constant = isExpanded ? interiorExpandedHeight : basicHeight
            interiorContentViewHeightContraint.isActive = true
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutIfNeeded()
        })
    }
}
