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
    }
    
    private let layer0 = CAGradientLayer().set {
        $0.colors = [
            UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor,
            UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor]
        $0.locations = [0, 1]
        $0.startPoint = CGPoint(x: 0.25, y: 0.5)
        $0.endPoint = CGPoint(x: 0.75, y: 0.5)
        $0.transform = CATransform3DMakeAffineTransform(.init(
            a: 0, b: 0.35, c: -0.35, d: 0, tx: 0.68, ty: 0.65))
    }
    
    // MARK: - Properties
    weak var delegate: CustomOrQuoteSelectViewDelegate?
    
    override var bounds: CGRect {
        didSet {
            layer0.bounds = bounds.insetBy(
                dx: -0.5*bounds.size.width,
                dy: -0.5*bounds.size.height)
            layer0.position = center
            layer.addSublayer(layer0)
        }
    }
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        customOrQuoteButtonsView.delegate = self
    }
    
    convenience init() {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Private Functions
    func configureUI() {
        configureSubviewUI(with: customOrQuoteButtonsView)
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
