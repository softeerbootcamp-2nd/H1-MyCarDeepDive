//
//  DefaultQuotationPreviewThumbnailView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/15.
//

import UIKit

final class DefaultQuotationPreviewThumbnailView: UIView {
    enum Constants {
        static let intrinsicContentHeight: CGFloat = {
            typealias ConstThumbnailCardView = DefaultQuotationPreviewThumbnailCardView.Constants
            let thumbnailCardViewHeight = ConstThumbnailCardView.intrinsicContentHegiht
            return (thumbnailCardViewHeight +
                    ThumbnailCardView.topMargin -
                    ThumbnailCardView.bottomMargin)
        }()
        enum ThumbnailCardView {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 38)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -38)
            static let topMargin: CGFloat = .toScaledHeight(value: 29)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -46)
        }
    }
    
    // MARK: - UI properties
    private let thumbnailView = DefaultQuotationPreviewThumbnailCardView(frame: .zero)
    private var isAddedGradient = false
    
    // MARK: - Properties
    override var bounds: CGRect {
        didSet {
            if !isAddedGradient {
                isAddedGradient.toggle()
                layer.addSublayer(CAGradientLayer().set {
                    $0.frame = bounds
                    $0.colors = [
                        UIColor(red: 0.447, green: 0.512, blue: 0.667, alpha: 1).cgColor,
                        UIColor(red: 0.791, green: 0.818, blue: 0.883, alpha: 1).cgColor]
                    $0.locations = [0, 1]
                    $0.startPoint = CGPoint(x: 0.5, y: 0.35)
                    $0.endPoint = CGPoint(x: 0.5, y: 1)
                })
                bringSubviewToFront(thumbnailView)
            }
        }
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    // MARK: - Functions
    func showAnimation() {
        thumbnailView.setInitialCarImageForAnimation()
        thumbnailView.showCarImageAnimation()
    }
    
    func configure(carName: String, carImageUrl: String) {
        thumbnailView.configure(carName: carName, carImageUrl: carImageUrl)
    }
}

extension DefaultQuotationPreviewThumbnailView: LayoutSupportable {
    func setupViews() {
        addSubviews([thumbnailView])
    }
    
    func setupConstriants() {
        thumbnailViewContraints()
    }
    
    private func thumbnailViewContraints() {
        typealias Const = Constants.ThumbnailCardView
        NSLayoutConstraint.activate([
            thumbnailView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            thumbnailView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            thumbnailView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Const.topMargin),
            thumbnailView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Const.bottomMargin)])

    }
}
