//
//  RecommendQuotationThumbnailView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import UIKit

class RecommendQuotationThumbnailView: UIView {
    enum Constants {
        enum ContentView {
            static let topMargin: CGFloat = .toScaledHeight(value: 29)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 38)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -38)
            static let height: CGFloat = .toScaledHeight(value: 419)
        }
        enum LogoImage {
            static let topMargin: CGFloat = .toScaledHeight(value: 17)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 19)
            static let width: CGFloat = .toScaledWidth(value: 25)
        }
        enum TitleLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 30)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -30)
        }
        enum TagLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 29)
            static let height: CGFloat = .toScaledHeight(value: 28)
            static let width: CGFloat = .toScaledWidth(value: 133)
        }
        enum CarImageView {
            static let topMargin: CGFloat = .toScaledHeight(value: -7)
            static let leading: CGFloat = .toScaledWidth(value: 50)
            static let height: CGFloat = .toScaledHeight(value: 220)
            static let width: CGFloat = .toScaledWidth(value: 300)
        }
        enum TooltipView {
            static let topMargin: CGFloat = .toScaledHeight(value: 5)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 21)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -21)
            static let height: CGFloat = .toScaledHeight(value: 63)
            static let tooltipWidth: CGFloat = 8
            static let tooltipHeight: CGFloat = 6
        }
    }
    
    // MARK: - UI properties
    private let contentView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialLight)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = $0.frame
        $0.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
        $0.layer.cornerRadius = 16
        $0.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        $0.layer.borderWidth = 2
        $0.clipsToBounds = true
    }
    
    private let logoImageView: UIImageView = UIImageView(image: UIImage(named: "Blue_Logo")).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
    }
    private let tagLabel: CommonPaddingLabel = CommonPaddingLabel(
        padding: UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12),
        fontType: .custom(
            size: 12,
            kern: -0.5,
            lineHeight: 16,
            nameType: .boldText),
        color: .white,
        text: "펠리세이드 - Prestige"
    ).set {
        $0.layer.backgroundColor = UIColor.GetYaPalette.primary.cgColor
        $0.layer.cornerRadius = Constants.TagLabel.height / 2
    }
    private let titleLabel: UILabel = UILabel().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 2
        $0.font = GetYaFont.regularHead2.uiFont
        $0.textColor = .black
        $0.textAlignment = .center
    }
    private let carImageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    private let tooltipView = RecommendTooltipView()
    
    // MARK: - Properties
    private var isAddedGradient = false
    override var bounds: CGRect {
        didSet {
            if !isAddedGradient {
                isAddedGradient.toggle()
                layer.insertSublayer(
                    CAGradientLayer().set {
                        $0.frame = bounds
                        $0.colors = [
                            UIColor(red: 0.447, green: 0.512, blue: 0.667, alpha: 1).cgColor,
                            UIColor(red: 0.791, green: 0.818, blue: 0.883, alpha: 1).cgColor]
                        $0.locations = [0, 1]
                        $0.startPoint = CGPoint(x: 0.5, y: 0.35)
                        $0.endPoint = CGPoint(x: 0.5, y: 1)
                    },
                    at: 0)
            }
        }
    }
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
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
            logoImageView,
            titleLabel,
            tagLabel,
            carImageView,
            tooltipView
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureContentView()
        configureLogoImageView()
        configureTagLabel()
        configureTitleLabel()
        configureCarImageView()
        configureTooltipView()
    }
    
    private func configureContentView() {
        typealias Const = Constants.ContentView
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: Const.topMargin),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leadingMargin),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Const.trailingMargin),
            contentView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureLogoImageView() {
        typealias Const = Constants.LogoImage
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.topMargin),
            logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
            logoImageView.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    private func configureTagLabel() {
        typealias Const = Constants.TagLabel
        
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.topMargin),
            tagLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tagLabel.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureTitleLabel() {
        typealias Const = Constants.TitleLabel
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: Const.topMargin),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin)
        ])
    }
    
    private func configureCarImageView() {
        typealias Const = Constants.CarImageView
        
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Const.topMargin),
            carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leading),
            carImageView.heightAnchor.constraint(equalToConstant: Const.height),
            carImageView.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    private func configureTooltipView() {
        typealias Const = Constants.TooltipView
        
        NSLayoutConstraint.activate([
            tooltipView.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: Const.topMargin),
            tooltipView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
            tooltipView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin),
            tooltipView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    // MARK: - Functions
    func setTag(text: String) {
        tagLabel.text = text
    }
    
    func setTitle(text: String, partText: String) {
        titleLabel.text = text
        titleLabel.attributedText = NSMutableAttributedString(string: text).set {
            $0.configureHyundaiSans(
                type: GetYaFont.regularHead2,
                otherType: .custom(
                    size: 20,
                    kern: -0.3,
                    lineHeight: 28,
                    nameType: .boldHead),
                text: partText)
            $0.addAttributes(
                [.foregroundColor: UIColor.GetYaPalette.primary],
                range: (text as NSString).range(of: partText))
        }
    }
    
    func setCarImage(imageURL: String) {
        carImageView.setImage(urlString: imageURL)
    }
    
    func setReviewLabel(text: String) {
        tooltipView.setText(text: text)
    }
    
    // MARK: - Objc Functions
}
