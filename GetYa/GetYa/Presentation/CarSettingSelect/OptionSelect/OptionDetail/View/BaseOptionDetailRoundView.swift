//
//  BaseOptionDetailRoundView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import UIKit
import Combine

class BaseOptionDetailRoundView: UIView {
    enum Constants {
        static let minimumHeight: CGFloat = ThumbnailView.height + ContentView.minimumHeight
        enum ThumbnailView {
            static let height: CGFloat = .toScaledHeight(value: 160)
        }
        enum CloseButton {
            static let width: CGFloat = .toScaledWidth(value: 24)
            static let height = width
            static let topMargin: CGFloat = .toScaledWidth(value: 20)
            static let trailingMargin = -topMargin
        }
        enum ContentView {
            static let minimumHeight: CGFloat = .toScaledHeight(value: 200)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 20)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -20)
            static let topMargin: CGFloat = .toScaledHeight(value: 20)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -16)
        }
    }
    
    // MARK: - UI properties
    private let thumbnailView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
    }
    
    private let closeButton: UIButton = UIButton().set {
        typealias Const = Constants.CloseButton
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.imageView?.contentMode = .scaleAspectFit
        let image = UIImage(named: "closeIcon")?.withTintColor(
            .white.withAlphaComponent(0.5),
            renderingMode: .alwaysOriginal)
        let resize = image?.resize(targetSize: .init(width: 16, height: 16))
        $0.setImage(resize, for: .normal)
        
        $0.layer.cornerRadius = Const.height/2
        $0.backgroundColor = .white.withAlphaComponent(0.15)
        $0.alpha = 0
    }
    
    private var  contentView: UIView
    
    private let backgroundView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Properties
    var closeButtonTapPublihser: AnyPublisher<Void, Never> {
        closeButton.tap
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        contentView = UIView()
        super.init(frame: frame)
        configureUI()
    }
    
    init(contentView: UIView) {
        self.contentView = contentView
        super.init(frame: .zero)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        contentView = UIView()
        super.init(coder: coder)
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = .toScaledHeight(value: 16)
        clipsToBounds = true
        setupUI()
    }
    
    private func animateCloseButton() {
        UIView.animate(
            withDuration: 0.25,
            delay: 0,
            options: .curveEaseOut
        ) {
            self.closeButton.alpha = 1
        }
    }
    
    // MARK: - Functoun
    func configure(image: UIImage?, closeButtonAlpha: CGFloat? = 1) {
        thumbnailView.image = image
        setCloseButton(with: closeButtonAlpha)
        guard backgroundView.backgroundColor != .white else {
            return
        }
        backgroundView.backgroundColor = .white
    }
    
    func setCloseButton(with alpha: CGFloat?) {
        guard alpha != nil else {
            closeButton.alpha = 0
            return
        }
        animateCloseButton()
    }
    
    func replaceContentView(with otherView: UIView) {
        contentView = otherView
    }
}

extension BaseOptionDetailRoundView: LayoutSupportable {
    func setupViews() {
        addSubviews([
            thumbnailView,
            closeButton,
            backgroundView,
            contentView])
    }
    
    func setupConstriants() {
        configureThumbnailView()
        configureCloseButton()
        configureBackgroundView()
        configureContentView()
        configureSubviewsPriority()
    }
    
    private func configureThumbnailView() {
        typealias Const = Constants.ThumbnailView
        NSLayoutConstraint.activate([
            thumbnailView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            thumbnailView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailView.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            thumbnailView.heightAnchor.constraint(equalToConstant: Const.height)])
    }
    
    private func configureCloseButton() {
        typealias Const = Constants.CloseButton
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            closeButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            closeButton.widthAnchor.constraint(equalToConstant: Const.width),
            closeButton.heightAnchor.constraint(equalToConstant: Const.height)])
    }
    
    private func configureBackgroundView() {
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.topAnchor.constraint(equalTo: thumbnailView.bottomAnchor)])
    }
    
    private func configureContentView() {
        typealias Const = Constants.ContentView
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            contentView.topAnchor.constraint(
                equalTo: thumbnailView.bottomAnchor,
                constant: Const.topMargin),
            contentView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            contentView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Const.bottomMargin)])
    }
    
    private func configureSubviewsPriority() {
        thumbnailView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        contentView.setContentHuggingPriority(.defaultLow, for: .vertical)
        backgroundView.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}
