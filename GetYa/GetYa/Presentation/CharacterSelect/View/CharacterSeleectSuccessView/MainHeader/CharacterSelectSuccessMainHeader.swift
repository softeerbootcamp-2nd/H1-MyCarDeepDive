//
//  CharacterSelectSuccessMainHeader.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

import UIKit

final class CharacterSelectSuccessMainHeader: UICollectionReusableView {
    static let id = String(
        describing: CharacterSelectSuccessMainHeader.self)
    enum Constant {
        static let intrinsicContentHeight: CGFloat = {
            let thumbnailViewHeight = CharacterSelectSuccessThumbnailView
            .Constant
            .intrinsicContentHeight
            let recommendCarInfoHeight = CharacterSelectSuccessRecommendCarInfoView
                .Constant
                .intrinsicContentHeight
            let sectionDividerHeight = CharacterSelectSuccessSectionDividerView
                .Constant
                .intrinsicContentHeight
            return thumbnailViewHeight + recommendCarInfoHeight + sectionDividerHeight
        }()
    }
    
    // MARK: - UI properties
    private let thumbnailView = CharacterSelectSuccessThumbnailView()
    private let recommendCarInfo = CharacterSelectSuccessRecommendCarInfoView()
    private let sectionDivider = CharacterSelectSuccessSectionDividerView()
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviewUI(
            with: thumbnailView,
            recommendCarInfo,
            sectionDivider)
        print(Constant.intrinsicContentHeight)
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviewUI(
            with: thumbnailView,
            recommendCarInfo,
            sectionDivider)
    }
    
    // MARK: - Functions
    // TODO: 추천 완료된 차량의 엔터티 생성해야 합니다.
    /// 0 = 차량 한글, 1 = 차량 영어 2 = 차량 가격 3 = 차량 옵션 리스트
    /// 그리고 추천 완료된 차량의 키워드를 가져와 TagView를 갱신해야 합니다.
    func configure(
        with thumbnailKeywordTexts: [String],
        carInfo: [String],
        firstSectionTitle: String
    ) {
        thumbnailView.configureRecommendKeywordStackView(
            thumbnailKeywordTexts)
        recommendCarInfo.configure(
            with: carInfo[0],
            carInfo[1],
            carInfo[2],
            carInfo[3])
        sectionDivider.configureSectionTitle(with: firstSectionTitle)
    }
}

// MARK: - LayoutSupportable
extension CharacterSelectSuccessMainHeader: LayoutSupportable {
    func configureConstraints() {
        _=[thumbnailViewConstraints,
           recommendCarInfoConstraints,
           sectionDividerConstraints
        ].map { NSLayoutConstraint.activate($0) }
    }
}

// MARK: - LayoutSupportable private functions
private extension CharacterSelectSuccessMainHeader {
    var thumbnailViewConstraints: [NSLayoutConstraint] {
        [thumbnailView.leadingAnchor.constraint(
            equalTo: leadingAnchor),
         thumbnailView.trailingAnchor.constraint(
            equalTo: trailingAnchor),
         thumbnailView.topAnchor.constraint(equalTo: topAnchor)]
    }
    
    var recommendCarInfoConstraints: [NSLayoutConstraint] {
        [recommendCarInfo.leadingAnchor.constraint(equalTo: leadingAnchor),
         recommendCarInfo.trailingAnchor.constraint(equalTo: trailingAnchor),
         recommendCarInfo.topAnchor.constraint(equalTo: thumbnailView.bottomAnchor)]
    }
    
    var sectionDividerConstraints: [NSLayoutConstraint] {
        [sectionDivider.leadingAnchor.constraint(equalTo: leadingAnchor),
        sectionDivider.trailingAnchor.constraint(equalTo: trailingAnchor),
         sectionDivider.topAnchor.constraint(equalTo: recommendCarInfo.bottomAnchor),
         sectionDivider.bottomAnchor.constraint(equalTo: bottomAnchor)]
    }
}
