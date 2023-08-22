//
//  OptionSelectBasicItemCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/21.
//

import UIKit

struct BasicOptionItem: Hashable {
    let id: Int
    let imageURL: String
    let optionName: String
    let tagList: [Tag]
}

class OptionSelectBasicItemCell: UICollectionViewCell {
    enum Constants {
        enum ImageView {
            static let height: CGFloat = .toScaledHeight(value: 112)
        }
        enum LearnMoreView {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
            static let height: CGFloat = .toScaledHeight(value: 22)
        }
        enum OptionNameLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
        }
    }
    
    // MARK: - UI properties
    private let imageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    private lazy var learnMoreView = OptionSelectItemLearnMoreView()
    private let optionNameLabel: UILabel = UILabel().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = GetYaFont.mediumBody3.uiFont
        $0.textColor = .GetYaPalette.gray0
    }
    
    // MARK: - Properties
    static let identifier = "OptionSelectBasicItemCell"
    
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
        
        imageView.image = nil
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            imageView,
            learnMoreView,
            optionNameLabel
        ])
    }
    
    private func configureUI() {
        configureImageView()
        configureLearnMoreView()
        configureOptionNameLabel()
    }
    
    private func configureImageView() {
        typealias Const = Constants.ImageView
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureLearnMoreView() {
        typealias Const = Constants.LearnMoreView
        
        NSLayoutConstraint.activate([
            learnMoreView.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Const.topMargin),
            learnMoreView.leadingAnchor.constraint(equalTo: leadingAnchor),
            learnMoreView.trailingAnchor.constraint(equalTo: trailingAnchor),
            learnMoreView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureOptionNameLabel() {
        typealias Const = Constants.OptionNameLabel
        
        NSLayoutConstraint.activate([
            optionNameLabel.topAnchor.constraint(
                equalTo: learnMoreView.bottomAnchor,
                constant: Const.topMargin),
            optionNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Functions
    func addActionLearnMoreViewButton(handler: @escaping () -> Void) {
        learnMoreView.addButtonAction(handler: handler)
    }
    
    func setData(datum: BasicOptionItem) {
        imageView.image = UIImage(named: "LifeStylePeekForYou") // data.imageURL
        optionNameLabel.text = datum.optionName
    }
    
    // MARK: - Objc Functions
}
