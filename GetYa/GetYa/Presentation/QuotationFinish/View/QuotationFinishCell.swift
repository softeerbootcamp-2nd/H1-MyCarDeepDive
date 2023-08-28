//
//  QuotationFinishTableCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/18.
//

import UIKit

class QuotationFinishCell: UITableViewCell {
    enum Constants {
        enum OptionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 6)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -6)
        }
    }
    
    // MARK: - UI properties
    private let optionView = CommonOptionView()
    
    // MARK: - Properties
    static let identifier = "QuotationFinishCell"
    
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
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        selectionStyle = .none
        addSubview(optionView)
    }
    
    private func configureUI() {
        configureOptionView()
    }
    
    private func configureOptionView() {
        typealias Const = Constants.OptionView
        
        NSLayoutConstraint.activate([
            optionView.topAnchor.constraint(equalTo: topAnchor, constant: Const.topMargin),
            optionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Const.bottomMargin)
        ])
    }
    
    // MARK: - Functions
    func setOption(imageURL: String, name: String, price: Int) {
        optionView.configureDetail(imageURL: imageURL, title: name, price: price)
    }
}
