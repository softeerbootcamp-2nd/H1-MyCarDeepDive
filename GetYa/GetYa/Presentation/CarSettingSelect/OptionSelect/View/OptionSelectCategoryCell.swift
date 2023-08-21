//
//  OptionSelectCategoryCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit

class OptionSelectCategoryCell: UICollectionViewCell {
    enum Constants {
        enum ImageView {
            static let height: CGFloat = .toScaledHeight(value: 24)
            static let width: CGFloat = .toScaledHeight(value: 24)
        }
        enum Label {
            static let topMargin: CGFloat = .toScaledHeight(value: 4)
        }
    }
    
    enum CellType: String, CaseIterable {
        case all
        case safeDrive
        case convenience
        case temperature
        case parking
        case performance
        case style
        
        var title: String {
            switch self {
            case .all:
                return "전체"
            case .safeDrive:
                return "주행안전"
            case .convenience:
                return "사용편의"
            case .temperature:
                return "추위/더위"
            case .parking:
                return "주차/출차"
            case .performance:
                return "퍼포먼스"
            case .style:
                return "스타일"
            }
        }
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
    
    // MARK: - UI properties
    private let imageBackgroundView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.backgroundColor = UIColor.GetYaPalette.gray800.cgColor
        $0.layer.cornerRadius = 16
        $0.layer.borderColor = UIColor.GetYaPalette.primary.cgColor
    }
    private let imageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
    }
    private let label = CommonLabel(fontType: .regularCaption1, color: .GetYaPalette.gray400)
    
    // MARK: - Properties
    static let identifier = "OptionSelectCategoryCell"
    override var isSelected: Bool {
        didSet {
            imageBackgroundView.layer.borderWidth = isSelected ? 1.5 : 0
            imageBackgroundView.layer.backgroundColor = isSelected
            ? UIColor.GetYaPalette.gray1000.cgColor
            : UIColor.GetYaPalette.gray800.cgColor
            imageView.image = isSelected
            ? imageView.image?.withTintColor(
                .GetYaPalette.primary,
                renderingMode: .alwaysOriginal)
            : imageView.image?.withTintColor(
                .GetYaPalette.gray100,
                renderingMode: .alwaysOriginal)
            label.textColor = isSelected ? .GetYaPalette.primary : .GetYaPalette.gray400
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
        
        imageView.image = nil
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            imageBackgroundView,
            label
        ])
        
        imageBackgroundView.addSubview(imageView)
    }
    
    private func configureUI() {
        configureImageBackgroundView()
        configureImageView()
        configureLabel()
    }
    
    private func configureImageBackgroundView() {
        NSLayoutConstraint.activate([
            imageBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            imageBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBackgroundView.heightAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    private func configureImageView() {
        typealias Const = Constants.ImageView
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: imageBackgroundView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: imageBackgroundView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Const.height),
            imageView.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    private func configureLabel() {
        typealias Const = Constants.Label
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: imageBackgroundView.bottomAnchor,
                constant: Const.topMargin),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    // MARK: - Functions
    func setByIndex(index: Int) {
        let cellTypeAllCases = CellType.allCases
        label.text = cellTypeAllCases[index].title
        imageView.image = isSelected
        ? cellTypeAllCases[index].image?.withTintColor(
            .GetYaPalette.primary,
            renderingMode: .alwaysOriginal)
        : cellTypeAllCases[index].image
    }
}
