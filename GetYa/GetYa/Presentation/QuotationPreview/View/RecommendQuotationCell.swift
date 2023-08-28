//
//  RecommendQuotationCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import UIKit

class RecommendQuotationCell: UITableViewCell {
    enum Constants {
        enum OptionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 6)
            static let height: CGFloat = .toScaledHeight(value: 60)
        }
        enum ReviewLabel {
            static let topMarign: CGFloat = .toScaledHeight(value: 12)
        }
    }
    
    // MARK: - UI properties
    private let optionView = CommonOptionView()
    private let reviewLabel = CommonPaddingLabel(
        padding: UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12),
        fontType: .regularBody4,
        color: .GetYaPalette.acriveBlue
    ).set {
        $0.isHidden = true
        $0.layer.backgroundColor = UIColor.GetYaPalette.acriveBlue.withAlphaComponent(0.1).cgColor
        $0.layer.cornerRadius = 8
    }
    
    // MARK: - Properties
    static let identifier = "RecommendQuotationCell"
    
    // MARK: - Lifecycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
        optionView.prepareForReuse()
        reviewLabel.isHidden = true
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        selectionStyle = .none
        addSubviews([optionView, reviewLabel])
    }
    
    private func configureUI() {
        configureOptionView()
        configureReviewLabel()
    }
    
    private func configureOptionView() {
        typealias Const = Constants.OptionView
        
        NSLayoutConstraint.activate([
            optionView.topAnchor.constraint(equalTo: topAnchor, constant: Const.topMargin),
            optionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureReviewLabel() {
        typealias Const = Constants.ReviewLabel
        
        NSLayoutConstraint.activate([
            reviewLabel.topAnchor.constraint(equalTo: optionView.bottomAnchor, constant: Const.topMarign),
            reviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            reviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Functions
    func setOption(imageURL: String, name: String, price: Int) {
        optionView.configureDetail(imageURL: imageURL, title: name, price: price)
    }
    
    func setText(text: String) {
        if text != "" {
            reviewLabel.text = text
            reviewLabel.isHidden = false
        }
    }
}
