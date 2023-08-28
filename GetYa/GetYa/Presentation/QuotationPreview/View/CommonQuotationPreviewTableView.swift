//
//  CommonQuotationPreviewTableView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/13.
//

import UIKit

class CommonQuotationPreviewTableView: UITableView {
    // MARK: - Properties
    private var calculateMaximumCellHeight: CGFloat {
        let maximumReviewdTextViewHeightAndTopMargin = {
            typealias Const = CommonQuotationPreviewCell.Constants.ReviewdTextView
            return Const.maximumHeight + Const.topMargin
        }()
        let commonOptionViewHeightAndTopMargin = {
            typealias Const = CommonQuotationPreviewCell.Constants.RecommendCarOptionView
            return Const.height + Const.topMargin
        }()
        return maximumReviewdTextViewHeightAndTopMargin + commonOptionViewHeightAndTopMargin
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        backgroundColor = .white
        register(
            CommonQuotationPreviewCell.self,
            forCellReuseIdentifier: CommonQuotationPreviewCell.identifier)
        separatorStyle = .none
        estimatedRowHeight = calculateMaximumCellHeight
        
    }
}
