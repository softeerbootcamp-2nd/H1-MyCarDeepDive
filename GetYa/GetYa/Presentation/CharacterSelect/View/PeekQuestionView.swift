//
//  PeekQuestionView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/09.
//

import UIKit

class PeekQuestionView: UIView {
    enum Constatns {
        enum Label {
            static let leadingMargin = CGFloat(8).scaledWidth
        }
    }
    
    // MARK: - UI properties
    private let imageView: UIImageView = UIImageView().set {
        $0.image = UIImage(named: "LifeStylePeekQuestion")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
    }
    
    private let label = CommonLabel(
        fontType: .mediumBody3,
        color: .GetYaPalette.gray50)
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    init(text: String) {
        super.init(frame: .zero)
        setupViews()
        configureUI()
        configureLabelText(text: text)
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
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            imageView,
            label
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureImageView()
        configureLabel()
    }
    
    private func configureImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: Constatns.Label.leadingMargin),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func configureLabelText(text: String) {
        self.label.text = text
    }
    
    // MARK: - Objc Functions
}
