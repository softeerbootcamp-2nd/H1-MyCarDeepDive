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
    private let customOrQuoteButtonsView = LeftAndRightButtonsView(frame: .zero).set {
        $0.configureLeftButton(with: .init(
            text: "커스텀하기",
            fontType: .mediumBody3,
            backgroundColor: .white,
            borderColor: .GetYaPalette.gray600,
            textColor: .black))
        
        $0.configureRightButton(with: .init(
            text: "빠른 견적내기",
            fontType: .mediumBody3,
            backgroundColor: .GetYaPalette.acriveBlue,
            borderColor: .clear,
            textColor: .white))
        $0.backgroundColor = .white
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
        customOrQuoteButtonsView.delegate = self
        setGradient()
    }
    
    convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        customOrQuoteButtonsView.delegate = self
        setGradient()
    }
    
    // MARK: - Private Functions
    func configureUI() {
        configureSubviewUI(with: gradientView, customOrQuoteButtonsView)
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
    func configureConstraints() {
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
        
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.heightAnchor.constraint(
                equalToConstant: Constants.gradientLayerHeight),
            gradientView.bottomAnchor.constraint(
                equalTo: customOrQuoteButtonsView.topAnchor)])
    }
}

// MARK: - LeftAndRightButtonsViewDelegate
extension CustomOrQuoteSelectView: LeftAndRightButtonsViewDelegate {
    func didTapLeftButton() {
        delegate?.gotoCustomPage()
    }
    
    func didTapRightButton() {
        delegate?.gotoQuotePage()
    }
}
