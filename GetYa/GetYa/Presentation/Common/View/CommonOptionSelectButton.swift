//
//  CommonOptionSelectButton.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/02.
//

import UIKit

protocol CommonOptionSelectViewDelegate: AnyObject {
    func handleTap(_ sender: UITapGestureRecognizer)
}

class CommonOptionSelectView: UIView {
    enum Constants {
        static let height: CGFloat = .toScaledHeight(value: 28)
        enum IconImageView {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 14)
            static let topMargin: CGFloat = .toScaledHeight(value: 6)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -6)
            static let width: CGFloat = .toScaledWidth(value: 13)
            static let height = width
        }
        enum IconTitleLabel {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 8)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -14)
            static let size: CGSize = {
                let label = CommonLabel.init(fontType: .mediumCaption1, color: .white, text: "선택")
                return label.intrinsicContentSize
            }()
        }
    }

    // MARK: - UI Properties
    private let resizedImage: UIImage? = {
        let image = UIImage(named: "Blue-Check-Circle")
        let preferSize: CGSize = .init(
            width: .toScaledWidth(value: 16),
            height: .toScaledWidth(value: 16))
        return image?.resize(targetSize: preferSize)
    }()
    private lazy var iconImageView = UIImageView(image: resizedImage).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
    }
    private let iconTitleLabel = CommonLabel.init(
        fontType: .mediumCaption1,
        color: .GetYaPalette.primary,
        text: "선택"
    ).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Properties
    override var intrinsicContentSize: CGSize {
        return .init(width: .toScaledWidth(value: 69), height: Constants.height)
    }
    
    var delegate: CommonOptionSelectViewDelegate?
    
    var isSelected: Bool = false {
        didSet {
            updateSelectedUIState()
        }
    }
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Private functions
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        layer.cornerRadius = Constants.height/2
        layer.borderWidth = 1
        layer.borderColor = UIColor.GetYaPalette.primary.cgColor
        backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
        setupUI()
    }
    
    private func updateSelectedUIState() {
        let selectedColor: UIColor = isSelected ? .white: .GetYaPalette.primary
        let backgroundColor: UIColor = isSelected ? .GetYaPalette.primary : .white
        UIView.animate(
            withDuration: 0.12,
            delay: 0,
            options: [.curveEaseInOut]
        ) {
            self.iconImageView.image = self.resizedImage?.withTintColor(
                selectedColor,
                renderingMode: .alwaysOriginal)
            self.iconTitleLabel.textColor = selectedColor
            self.backgroundColor = backgroundColor
        }
    }
    
    // MARK: - @Objc function
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        isSelected.toggle()
        delegate?.handleTap(sender)
    }
}

// MARK: - LayoutSupportable
extension CommonOptionSelectView: LayoutSupportable {
    func setupViews() {
        addSubviews([
            iconImageView,
            iconTitleLabel])
    }
    
    func setupConstriants() {
        configureIconImageView()
        configureIconTitleLabel()
    }
    
    // MARK: - LayoutSupport private function
    private func configureIconImageView() {
        typealias Const = Constants.IconImageView
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Const.leadingMargin),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
    
    private func configureIconTitleLabel() {
        typealias Const = Constants.IconTitleLabel
        NSLayoutConstraint.activate([
            iconTitleLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: Const.leadingMargin),
            iconTitleLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Const.trailingMargin),
            iconTitleLabel.centerYAnchor.constraint(
                equalTo: centerYAnchor)])
    }
}
