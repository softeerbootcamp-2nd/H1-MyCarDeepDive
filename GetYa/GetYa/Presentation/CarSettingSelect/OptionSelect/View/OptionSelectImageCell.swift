//
//  OptionSelectImageCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import UIKit

class OptionSelectImageCell: UICollectionViewCell {
    enum Constatns {
        enum SelectedImageView {
            static let height: CGFloat = .toScaledHeight(value: 24)
            static let width: CGFloat = .toScaledHeight(value: 24)
        }
    }
    
    // MARK: - UI properties
    private let contentImageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
    }
    private let selectedView: UIView = UIView().set {
        $0.isHidden = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .GetYaPalette.primary.withAlphaComponent(0.5)
    }
    private lazy var selectedImageView: UIImageView = UIImageView(
        image: UIImage(named: "White-Check-Circle")
    ).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        selectedView.addSubview($0)
    }
    
    // MARK: - Properties
    static let identifier = "OptionSelectImageCell"
    override var isSelected: Bool {
        didSet {
            selectedView.isHidden = !isSelected
        }
    }
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isSelected = false
        contentImageView.image = nil
        selectedView.isHidden = true
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            contentImageView,
            selectedView
        ])
    }
    
    private func configureUI() {
        clipsToBounds = true
        layer.cornerRadius = CGFloat(20).scaledHeight
        
        configureContentImageView()
        configureSelectedView()
        configureSelectedImageView()
    }
    
    private func configureContentImageView() {
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(equalTo: topAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureSelectedView() {
        NSLayoutConstraint.activate([
            selectedView.topAnchor.constraint(equalTo: topAnchor),
            selectedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectedView.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectedView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureSelectedImageView() {
        NSLayoutConstraint.activate([
            selectedImageView.centerYAnchor.constraint(equalTo: selectedView.centerYAnchor),
            selectedImageView.centerXAnchor.constraint(equalTo: selectedView.centerXAnchor),
            selectedImageView.heightAnchor.constraint(
                equalToConstant: Constatns.SelectedImageView.height),
            selectedImageView.widthAnchor.constraint(
                equalToConstant: Constatns.SelectedImageView.width)
        ])
    }
    
    // MARK: - Functions
    func setImage(image: UIImage?) {
        contentImageView.image = image
    }
    
    // MARK: - Objc Functions
}
