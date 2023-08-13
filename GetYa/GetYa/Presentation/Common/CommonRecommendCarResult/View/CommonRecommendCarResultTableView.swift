//
//  CommonRecommendCarResultTableView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/13.
//

import UIKit

// TODO: 서버에서 옵션이나 색상에 대한 설명, 가격등이 정보가 왔을떄 너무 긴 경우에 대비해 trailing을 화면 subview별로 지정해줘야합니다.
class CommonRecommendCarResultTableView: UITableView {
    // MARK: - Properties
    private var calculateMaximumCellHeight: CGFloat {
        let maximumReviewdTextViewHeightAndTopMargin = {
            typealias Const = CommonRecommendCarResultTableViewCell.Constants.ReviewdTextView
            return Const.maximumHeight + Const.topMargin
        }()
        let commonOptionViewHeightAndTopMargin = {
            typealias Const = CommonRecommendCarResultTableViewCell.Constants.RecommendCarOptionView
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
            CommonRecommendCarResultTableViewCell.self,
            forCellReuseIdentifier: CommonRecommendCarResultTableViewCell.identifier)
        separatorStyle = .none
        estimatedRowHeight = calculateMaximumCellHeight
        
    }
}
