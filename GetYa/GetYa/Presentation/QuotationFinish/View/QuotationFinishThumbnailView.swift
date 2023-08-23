//
//  QuotationFinishThumbnailView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/18.
//

import UIKit

class QuotationFinishThumbnailView: UIView {
    enum Constants {
        enum TitleLable {
            static let topMargin: CGFloat = .toScaledHeight(value: 30)
        }
        enum DescriptionLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 4)
        }
        enum ContainerView {
            static let topMargin: CGFloat = .toScaledHeight(value: 27)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 27)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -27)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -52)
        }
        enum ImageView {
            static let height: CGFloat = .toScaledHeight(value: 200)
        }
        enum CarNameLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 11)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
        }
        enum TrimNameLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 11)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
        }
        enum LogoImageView {
            static let topMargin: CGFloat = .toScaledHeight(value: 15)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let width: CGFloat = .toScaledWidth(value: 70)
            static let height: CGFloat = .toScaledHeight(value: 10)
        }
    }
    
    // MARK: - UI properties
    private let titleLable = CommonLabel(
        fontType: .mediumHead1,
        color: .GetYaPalette.gray0,
        text: "나만의 차가 완성되었어요!")
    private let descriptionLabel = CommonLabel(
        fontType: .regularBody4,
        color: .GetYaPalette.gray200,
        text: "만든 차는 저장하고 공유할 수 있어요.")
    private let containerView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.backgroundColor = UIColor.white.cgColor
    }
    private let carNameLabel = CommonLabel(
        fontType: .mediumBody4,
        color: .GetYaPalette.gray300)
    private let trimNameLabel = CommonLabel(
        fontType: .mediumHead4,
        color: .GetYaPalette.gray0)
    let imageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private let logoImageView: UIImageView = UIImageView(
        image: UIImage(named: "Black_Logo_Title")
    ).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Lifecycles
    init(image: UIImage?, carName: String, trimName: String) {
        super.init(frame: .zero)
        
        imageView.image = image
        carNameLabel.text = carName
        trimNameLabel.text = trimName
        setupViews()
        configureUI()
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
    
    override func draw(_ rect: CGRect) {
        let radius: CGFloat = .toScaledHeight(value: 8)
        let triangleLength: CGFloat = .toScaledHeight(value: 50)
        
        let maskLayer = CAShapeLayer()
        let backgroundPath = UIBezierPath(
            roundedRect: containerView.bounds,
            byRoundingCorners: [.topRight, .bottomLeft],
            cornerRadii: CGSize(width: radius, height: radius))
        
        let topTrianglePath = UIBezierPath()
        topTrianglePath.move(to: CGPoint(x: 0, y: 0))
        topTrianglePath.addLine(to: CGPoint(x: triangleLength, y: 0))
        topTrianglePath.addLine(to: CGPoint(x: 0, y: triangleLength))
        topTrianglePath.close()
        backgroundPath.append(topTrianglePath)

        let bottomTrianglePath = UIBezierPath()
        bottomTrianglePath.move(to: CGPoint(x: containerView.bounds.maxX, y: containerView.bounds.maxX))
        bottomTrianglePath.addLine(to: CGPoint(
            x: containerView.bounds.maxX - triangleLength,
            y: containerView.bounds.maxY))
        bottomTrianglePath.addLine(to: CGPoint(
            x: containerView.bounds.maxX,
            y: containerView.bounds.maxY - triangleLength))
        bottomTrianglePath.close()
        backgroundPath.append(bottomTrianglePath)
        maskLayer.fillColor = UIColor.white.cgColor
        maskLayer.path = backgroundPath.cgPath
        maskLayer.fillRule = .evenOdd

        containerView.layer.mask = maskLayer
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            titleLable,
            descriptionLabel,
            containerView
        ])
        
        containerView.addSubviews([
            imageView,
            carNameLabel,
            trimNameLabel,
            logoImageView
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(hexString: "E6EAEF")
        
        configureTitleLabel()
        configureDescriptionLabel()
        configureContainerView()
        configureImageView()
        configureCarNameLabel()
        configureTrimNameLabel()
        configureLogoImageView()
    }
    
    private func configureTitleLabel() {
        typealias Const = Constants.TitleLable
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            titleLable.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func configureDescriptionLabel() {
        typealias Const = Constants.DescriptionLabel
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: titleLable.bottomAnchor,
                constant: Const.topMargin),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func configureContainerView() {
        typealias Const = Constants.ContainerView
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Const.topMargin),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Const.bottomMargin)
        ])
    }
    
    private func configureImageView() {
        typealias Const = Constants.ImageView
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureCarNameLabel() {
        typealias Const = Constants.CarNameLabel
        
        NSLayoutConstraint.activate([
            carNameLabel.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Const.topMargin),
            carNameLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Const.leadingMargin)
        ])
    }
    
    private func configureTrimNameLabel() {
        typealias Const = Constants.TrimNameLabel
        
        NSLayoutConstraint.activate([
            trimNameLabel.topAnchor.constraint(
                equalTo: carNameLabel.bottomAnchor,
                constant: Const.topMargin),
            trimNameLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Const.leadingMargin)
        ])
    }
    
    private func configureLogoImageView() {
        typealias Const = Constants.LogoImageView
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Const.topMargin),
            logoImageView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Const.trailingMargin),
            logoImageView.heightAnchor.constraint(equalToConstant: Const.height),
            logoImageView.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    // MARK: - Functions
    func setImage(image: UIImage?) {
        imageView.image = image
    }
    
    func setCarName(text: String) {
        carNameLabel.text = text
    }
    
    func setTrimName(text: String) {
        trimNameLabel.text = text
    }
    
    // MARK: - Objc Functions
}
