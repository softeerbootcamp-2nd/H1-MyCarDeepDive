//
//  CommonCheckListItemView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit

protocol CheckListItemViewDelegate: AnyObject {
    func tappedView(sender: UITapGestureRecognizer)
}

class CheckListItemView: UIView {
    enum Constants {
        enum ImageView {
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -16)
        }
        enum Label {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 12)
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -16)
        }
    }
    // MARK: - UI Properties
    private let imageView = UIImageView(image: UIImage(named: "Blue-Check-Circle"))
    private let label = CommonLabel()
    
    // MARK: - Properties
    weak var delegate: CheckListItemViewDelegate?
    
    var isTapped: Bool = false {
        didSet {
            showAnimation()
        }
    }
    
    // MARK: - LifeCycles
    convenience init(text: String) {
        self.init(frame: .zero)
        setLabelText(text: text)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureUI()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        configureUI()
        setupTapGesture()
    }
    
    // MARK: - Functions
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tappedView(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    private func setupViews() {
        [
            imageView,
            label
        ].forEach {
            addSubview($0)
        }
    }
    
    private func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 6
        
        self.layer.borderColor = UIColor.GetYaPalette.primary.cgColor
        self.isTapped = false
        
        configureLabel()
        configureImageView()
    }
    
    func setLabelText(text: String) {
        label.text = text
    }
    
    // MARK: - Private functions
    private func updateUIState() {
        layer.borderWidth = isTapped ? 2 : 0
        layer.backgroundColor = isTapped ? UIColor.white.cgColor : UIColor.GetYaPalette.gray800.cgColor
        imageView.isHidden = isTapped ? false : true
        label.font = isTapped ? UIFont(hyundaiSans: .regularBody3) : UIFont(hyundaiSans: .mediumBody3)
        label.textColor = isTapped ? .GetYaPalette.primary : .GetYaPalette.gray400
        label.isHighlighted = isTapped
    }
    
    private func showAnimation() {
        UIView.animate(
            withDuration: 0.25,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.updateUIState()
            })
    }
    
    private func configureLabel() {
        typealias Const = Constants.Label
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: Const.topMargin),
            label.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: Const.bottomMargin),
            label.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Const.leadingMargin)
        ])
    }
    
    private func configureImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        typealias Const = Constants.ImageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: Const.topMargin),
            imageView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: Const.trailingMargin),
            imageView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: Const.bottomMargin)
        ])
    }
    
    // MARK: - Objc Functions
    @objc private func tappedView(_ sender: UITapGestureRecognizer) {
        if isTapped { return }
        isTapped = !isTapped
        delegate?.tappedView(sender: sender)
    }
}
