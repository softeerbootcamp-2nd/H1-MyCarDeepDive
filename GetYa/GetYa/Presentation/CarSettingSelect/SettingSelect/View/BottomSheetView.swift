//
//  ButtomSheetView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/13.
//

import UIKit

protocol BottomSheetDelegate: AnyObject {
    func contractedBottomSheet(completion: @escaping () -> Void)
    func expandedBottomSheet(completion: @escaping () -> Void)
    func transitionNextSettingSelect()
}

class BottomSheetView: UIView {
    enum Constants {
        enum SmallContentView {
            static let height: CGFloat = CGFloat(104).scaledHeight
            static let topMargin: CGFloat = CGFloat(20).scaledHeight
            static let leadingMargin: CGFloat = CGFloat(16).scaledHeight
            static let trailingMargin: CGFloat = CGFloat(-16).scaledHeight
            static let bottomMargin: CGFloat = CGFloat(-36).scaledHeight
        }
        enum LargeContentView {
            static let height: CGFloat = CGFloat(559).scaledHeight
            static let topMargin: CGFloat = CGFloat(8).scaledHeight
            static let leadingMargin: CGFloat = CGFloat(16).scaledHeight
            static let trailingMargin: CGFloat = CGFloat(-16).scaledHeight
            static let bottomMargin: CGFloat = CGFloat(-36).scaledHeight
        }
    }
    
    // MARK: - UI properties
    private let containerView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var smallContentView = BottomSheetSmallContentView().set {
        $0.delegate = self
    }
    private lazy var largeContentView = BottomSheetLargeContentView().set {
        $0.delegate = self
        $0.isHidden = true
    }
    
    // MARK: - Properties
    weak var delegate: BottomSheetDelegate?
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureShadow()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubview(containerView)
        
        containerView.addSubviews([
            smallContentView,
            largeContentView
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false

        configureContainerView()
        configureSmallContentView()
        configureLargeContentView()
    }
    
    private func configureShadow() {
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: containerView.layer.cornerRadius).cgPath
        layer.shadowColor = UIColor(hexString: "8E98A8").withAlphaComponent(0.4).cgColor
        layer.shadowOffset = CGSize(width: 0, height: -4)
        layer.shadowOpacity = 1
        layer.shadowRadius = CGFloat(14).scaledHeight
    }
    
    private func configureContainerView() {
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = CGFloat(20).scaledHeight
        containerView.layer.backgroundColor = UIColor.white.cgColor
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureSmallContentView() {
        NSLayoutConstraint.activate([
            smallContentView.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: Constants.SmallContentView.topMargin),
            smallContentView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: Constants.SmallContentView.leadingMargin),
            smallContentView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Constants.SmallContentView.trailingMargin),
            smallContentView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: Constants.SmallContentView.bottomMargin)
        ])
    }
    
    private func configureLargeContentView() {
        NSLayoutConstraint.activate([
            largeContentView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.LargeContentView.topMargin),
            largeContentView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.LargeContentView.leadingMargin),
            largeContentView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.LargeContentView.trailingMargin),
            largeContentView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.LargeContentView.bottomMargin)
        ])
    }
    
    // MARK: - Functions
    func setSmallTitle(text: String) {
        smallContentView.setTrimName(text: text)
        largeContentView.setTrimName(text: text)
    }
    
    func setTotalPrice(price: Int) {
        smallContentView.setTotalPrice(price: price)
        largeContentView.setTotalPrice(price: price)
    }
    
    func setModelInfo(info: (String, Int)) {
        largeContentView.setModelInfo(info: info)
    }
    
    func setColorInfo(info: (String, Int, String, Int)) {
        largeContentView.setColorInfo(info: info)
    }
    
    func setOptionInfoArray(texts: [String], prices: [Int]) {
        largeContentView.setOptionInfoArray(texts: texts, prices: prices)
    }
}

// MARK: - BottomSheetDelegate
extension BottomSheetView: BottomSheetSmallContentDelegate {
    func touchUpChevronUpButton() {
        delegate?.expandedBottomSheet(completion: { [weak self] in
            guard let self else { return }
            self.largeContentView.isHidden = false
        })
    }
}

// MARK: - BottomSheetLargeContentDelegate
extension BottomSheetView: BottomSheetLargeContentDelegate {
    func touchUpChevronDownButton() {
        delegate?.contractedBottomSheet(completion: { [weak self] in
            guard let self else { return }
            self.smallContentView.isHidden = false
        })
    }
    
    func touchUpNextButton() {
        delegate?.transitionNextSettingSelect()
    }
}
