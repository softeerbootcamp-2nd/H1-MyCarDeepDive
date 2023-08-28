//
//  OptionSelectImageCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit

class OptionSelectTagItemCell: UICollectionViewCell {
    enum Constants {
        enum ImageView {
            static let height: CGFloat = .toScaledHeight(value: 240)
        }
        enum CollectionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 20)
            static let height: CGFloat = .toScaledHeight(value: 76)
            static let spacing: CGFloat = .toScaledWidth(value: 12)
        }
        enum DescriptionLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 32)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
        }
        enum TooltipView {
            static let topMarign: CGFloat = .toScaledHeight(value: 11)
            static let bottomMarign: CGFloat = .toScaledHeight(value: -11)
            static let height: CGFloat = .toScaledWidth(value: 106)
            static let width: CGFloat = .toScaledWidth(value: 270)
        }
        enum PlusButton {
            static let height: CGFloat = .toScaledHeight(value: 28)
            static let width: CGFloat = .toScaledHeight(value: 28)
        }
    }
    
    // MARK: - UI properties
    private let imageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
    }
    private lazy var collectionView = OptionSelectImageCollectionView()
    private let descriptionLabel = CommonLabel(
        fontType: .regularCaption1,
        color: .GetYaPalette.gray500,
        text: "*상기 이미지는 이해를 돕기 위한 이미지로 실제 옵션 사진은 상세보기에서 확인해주세요.")
    private var tooltipViews: [OptionSelectTooltipView] = []
    private var plusButtons: [PlusButton] = []
    
    // MARK: - Properties
    static let identifier = "OptionSelectImageCell"
    
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
        addSubviews([
            imageView,
            collectionView,
            descriptionLabel
        ])
    }
    
    private func configureUI() {
        configureImageView()
        configureCollectionView()
        configureDescriptionLabel()
    }
    
    private func configureImageView() {
        typealias Const = Constants.ImageView
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureCollectionView() {
        typealias Const = Constants.CollectionView
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Const.topMargin),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureDescriptionLabel() {
        typealias Const = Constants.DescriptionLabel
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: collectionView.bottomAnchor,
                constant: Const.topMargin),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.leadingMargin)
        ])
    }
    
    private func calculateTooltipPosition(
        xPosition: CGFloat,
        yPosition: CGFloat
    ) -> (startX: CGFloat, tooltipX: CGFloat, tooltipY: CGFloat, tooltipYType: TooltipView.TipYType) {
        typealias Const = Constants.TooltipView
        
        var viewXPosition: CGFloat = 0
        var tooltipXposition: CGFloat = 0
        var tooltipYposition: CGFloat = 0
        var tooltipYType: TooltipView.TipYType = .bottom
        
        let startX: CGFloat = .toScaledWidth(value: 16)
        let endX: CGFloat = frame.width - startX
        
        if xPosition >= startX && xPosition < startX + Const.width / 2 {
            tooltipXposition = xPosition
            viewXPosition = 6
        } else if xPosition >= startX + Const.width / 2 && xPosition <= endX - Const.width / 2 {
            tooltipXposition = Const.width / 2
            viewXPosition = xPosition - Const.width / 2
        } else {
            viewXPosition = frame.width - Const.width - CGFloat(10).scaledWidth
            tooltipXposition = xPosition - viewXPosition
        }
        
        if yPosition <= Constants.ImageView.height / 2 {
            tooltipYType = .top
            tooltipYposition = 0
        } else {
            tooltipYType = .bottom
            tooltipYposition = Constants.TooltipView.height
        }
        
        return (viewXPosition, tooltipXposition, tooltipYposition, tooltipYType)
    }
    
    // MARK: - Functions
    func setData(inqeury: AdditionalTagOptionInquery, tagName: String) {
        plusButtons.forEach {
            $0.removeFromSuperview()
        }
        tooltipViews.forEach {
            $0.removeFromSuperview()
        }
        
        imageView.setImage(urlString: inqeury.tagImageURL)
        collectionView.setImageURLArray(URLArray: inqeury.options.map { $0.optionImageURL })
        inqeury.options.forEach { item in
            let calculatePositions = calculateTooltipPosition(
                xPosition: item.xPosition.scaledWidth,
                yPosition: item.yPosition.scaledHeight)
            var tooltipView: OptionSelectTooltipView!
            if calculatePositions.tooltipYType == .bottom {
                tooltipView = OptionSelectTooltipView(
                    frame: CGRect(
                        x: calculatePositions.startX,
                        y: item.yPosition + Constants.TooltipView.bottomMarign - Constants.TooltipView.height,
                        width: Constants.TooltipView.width,
                        height: Constants.TooltipView.height))
            } else {
                tooltipView = OptionSelectTooltipView(
                    frame: CGRect(
                        x: calculatePositions.startX,
                        y: item.yPosition + Constants.PlusButton.width + Constants.TooltipView.topMarign,
                        width: Constants.TooltipView.width,
                        height: Constants.TooltipView.height))
            }
            tooltipView.setTooltipPosition(
                startX: calculatePositions.tooltipX,
                startY: calculatePositions.tooltipY,
                tipYType: calculatePositions.tooltipYType)
            tooltipView.setData(
                imageURL: item.optionImageURL,
                tagName: tagName,
                optionName: item.optionName,
                optionPrice: item.price)
            let plusButton = PlusButton(frame: CGRect(
                x: item.xPosition,
                y: item.yPosition,
                width: Constants.PlusButton.width,
                height: Constants.PlusButton.height))
            plusButton.addAction(handler: {
                self.plusButtons.filter { $0 != plusButton}.forEach { $0.isSelected = false }
                self.tooltipViews.filter { $0 != tooltipView }.forEach { $0.alpha = 0 }
                
                UIView.animate(withDuration: 0.5, animations: {
                    plusButton.isSelected.toggle()
                    tooltipView.alpha = plusButton.isSelected ? 1.0 : 0.0
                })
            })
            addSubview(plusButton)
            plusButtons.append(plusButton)
            tooltipViews.append(tooltipView)
        }
        addSubviews(tooltipViews)
    }
}
