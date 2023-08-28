//
//  CustomOrQuoteSelectView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/11.
//

import UIKit

protocol CustomOrQuoteSelectViewDelegate: AnyObject {
    func gotoCustomPage()
    func gotoQuotePage()
}

final class CustomOrQuoteSelectView: UIView {
    enum Constants {
        static let intrinsicContentHeight: CGFloat = .init(94).scaledHeight
        static let leadingMargin: CGFloat = .init(16).scaledWidth
        static let trailingMargin = leadingMargin
        static let height: CGFloat = .init(52).scaledHeight
        static var gradientLayerHeight: CGFloat {
           intrinsicContentHeight - height
        }
        static let width: CGFloat = UIScreen.main.bounds.width
    }
    
    // MARK: - UI properties
    private lazy var customOrQuoteButtonsView = LeftAndRightButtonStackView().set {
        $0.setLeftButton(title: "커스텀하기", handler: {
            self.delegate?.gotoCustomPage()
        })
        $0.setRightButton(title: "빠른 견적내기", handler: {
            self.delegate?.gotoQuotePage()
        })
    }
    
    private var gradientView: UIView = UIView(frame: .init(
        x: 0,
        y: 0,
        width: Constants.width,
        height: Constants.gradientLayerHeight)
    ).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Properties
    weak var delegate: CustomOrQuoteSelectViewDelegate?
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setGradient()
    }
    
    convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        setGradient()
    }
    
    // MARK: - Private Functions
    func configureUI() {
        setupUI()
    }
    
    func setGradient() {
        gradientView.layer.addSublayer(CAGradientLayer().set {
            $0.frame = gradientView.bounds
            $0.colors = [
                UIColor.white.withAlphaComponent(0).cgColor,
                UIColor.white.cgColor]
            $0.locations = [0, 1]
            $0.startPoint = CGPoint(x: 0.5, y: 0.35)
            $0.endPoint = CGPoint(x: 0.5, y: 1)
            $0.position = gradientView.center
        })
    }
}

// MARK: - LayoutSupportable
extension CustomOrQuoteSelectView: LayoutSupportable {
    func setupViews() {
        addSubviews([gradientView, customOrQuoteButtonsView])
    }
    
    func setupConstriants() {
        configureCustomOrQuoteButtonsView()
        configureGradientView()
    }
    
    private func configureCustomOrQuoteButtonsView() {
        NSLayoutConstraint.activate([
            customOrQuoteButtonsView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.leadingMargin),
            customOrQuoteButtonsView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -Constants.trailingMargin),
            customOrQuoteButtonsView.bottomAnchor.constraint(
                equalTo: bottomAnchor),
            customOrQuoteButtonsView.heightAnchor.constraint(
                equalToConstant: Constants.height)])
    }
    
    private func configureGradientView() {
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.heightAnchor.constraint(
                equalToConstant: Constants.gradientLayerHeight),
            gradientView.bottomAnchor.constraint(
                equalTo: customOrQuoteButtonsView.topAnchor)])
    }
}
