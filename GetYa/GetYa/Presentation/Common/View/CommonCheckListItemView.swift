//
//  CommonCheckListItemView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit

class CommonCheckListItemView: UIView {
    // MARK: - UI Properties
    private let imageView = UIImageView(image: UIImage(named: "Blue-Check-Circle"))
    private let label = CommonCheckListItemLabel()
    
    // MARK: - Properties
    private var isTapped: Bool = false {
        didSet {
            self.layer.borderWidth = isTapped ? 2 : 0
            self.layer.backgroundColor = isTapped ? UIColor.white.cgColor : UIColor(hexString: "F0F0F0").cgColor
            imageView.isHidden = isTapped ? false : true
            label.isHighlighted = isTapped
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isTapped = !isTapped
    }
    
    // MARK: - LifeCycles
    convenience init(text: String) {
        self.init(frame: .zero)
        configureLabel(text: text)
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
    
    // MARK: - Functions
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
        
        // TODO: 크기에 관해서 재정의 해줘야함.
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12)
        ])
    }
    
    private func configureLabel(text: String) {
        label.isHighlighted = false
        label.text = text
    }
    
    
    private func configureImageView() {
        // TODO: 크기에 관해서 재정의 해줘야함.
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
}
