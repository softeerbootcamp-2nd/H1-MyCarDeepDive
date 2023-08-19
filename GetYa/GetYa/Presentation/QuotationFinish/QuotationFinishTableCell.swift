//
//  QuotationFinishTableCell.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/18.
//

import UIKit

class QuotationFinishTableCell: UITableViewCell {
    enum Constants {
        enum OptionView {
            static let topMargin: CGFloat = .toScaledHeight(value: 6)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -6)
        }
    }
    
    // MARK: - UI properties
    private let optionView = CommonOptionView()
    
    // MARK: - Properties
    static let identifier = "QuotationFinishTableCell"
    
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
        optionView.configureDetail(image: nil, title: nil, price: nil)
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubview(optionView)
    }
    
    private func configureUI() {
        typealias Const = Constants.OptionView
        
        NSLayoutConstraint.activate([
            optionView.topAnchor.constraint(equalTo: topAnchor, constant: Const.topMargin),
            optionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Const.bottomMargin),
            optionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Functions
    func setOption(image: UIImage?, name: String, price: Int) {
        optionView.configureDetail(image: image, title: name, price: price)
    }
}
