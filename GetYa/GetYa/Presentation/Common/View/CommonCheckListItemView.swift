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

class CommonCheckListItemView: UIView {
    // MARK: - UI Properties
    private let imageView = UIImageView(image: UIImage(named: "Blue-Check-Circle"))
    private let label = CommonLabel()
    
    // MARK: - Properties
    weak var delegate: CheckListItemViewDelegate?
    var isTapped: Bool = false {
        didSet {
            // TODO: Font와 Color 바꿔야함.
            self.layer.borderWidth = isTapped ? 2 : 0
            self.layer.backgroundColor = isTapped ? UIColor.white.cgColor : UIColor(hexString: "F0F0F0").cgColor
            imageView.isHidden = isTapped ? false : true
            label.font = isTapped ? UIFont.systemFont(ofSize: 16, weight: .bold) : UIFont.systemFont(ofSize: 16, weight: .regular)
            label.textColor = isTapped ? UIColor(hexString: "00428E") : UIColor(hexString: "777777")
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
        
        // TODO: 색깔 재정의가 필요함.
        self.layer.borderColor = UIColor(hexString: "00428E").cgColor
        self.isTapped = false
        
        configureLabel()
        configureImageView()
    }
    
    func setLabelText(text: String) {
        label.text = text
        label.layer.borderColor = UIColor(hexString: "00428E").cgColor
    }
    
    private func configureLabel() {
        // TODO: 크기에 관해서 재정의 해줘야함.
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12)
        ])
    }
    
    private func configureImageView() {
        // TODO: 크기에 관해서 재정의 해줘야함.
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -16
            ),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            imageView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    // MARK: - Objc Functions
    @objc private func tappedView(_ sender: UITapGestureRecognizer) {
        if isTapped { return }
        isTapped = !isTapped
        delegate?.tappedView(sender: sender)
    }
}
