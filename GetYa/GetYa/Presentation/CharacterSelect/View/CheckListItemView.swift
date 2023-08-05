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
    // MARK: - UI Properties
    private let imageView = UIImageView(image: UIImage(named: "Blue-Check-Circle"))
    private let label = CommonLabel()
    
    // MARK: - Properties
    weak var delegate: CheckListItemViewDelegate?
    private let labelLayoutConstant = UILayout(leadingMargin: 12, topMargin: 16, bottomMargin: -16)
    private let imageViewLayoutConstant = UILayout(topMargin: 16, trailingMargin: -16, bottomMargin: -16)
    var isTapped: Bool = false {
        didSet {
            self.layer.borderWidth = isTapped ? 2 : 0
            self.layer.backgroundColor = isTapped ? UIColor.white.cgColor : UIColor.GetYaPalette.gray800.cgColor
            imageView.isHidden = isTapped ? false : true
            label.font = isTapped ? UIFont(hyundaiSans: .regularBody3) : UIFont(hyundaiSans: .mediumBody3)
            label.textColor = isTapped ? .GetYaPalette.darkPrimary : .GetYaPalette.gray400
            label.isHighlighted = isTapped
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
        
        self.layer.borderColor = UIColor.GetYaPalette.darkPrimary.cgColor
        self.isTapped = false
        
        configureLabel()
        configureImageView()
    }
    
    func setLabelText(text: String) {
        label.text = text
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: labelLayoutConstant.topMargin
            ),
            label.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: labelLayoutConstant.bottomMargin
            ),
            label.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: labelLayoutConstant.leadingMargin
            )
        ])
    }
    
    private func configureImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: imageViewLayoutConstant.topMargin
            ),
            imageView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: imageViewLayoutConstant.trailingMargin
            ),
            imageView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: imageViewLayoutConstant.bottomMargin
            )
        ])
    }
    
    // MARK: - Objc Functions
    @objc private func tappedView(_ sender: UITapGestureRecognizer) {
        if isTapped { return }
        isTapped = !isTapped
        delegate?.tappedView(sender: sender)
    }
}
