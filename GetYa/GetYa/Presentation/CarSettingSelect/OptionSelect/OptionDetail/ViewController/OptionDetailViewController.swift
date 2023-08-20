//
//  OptionDetailViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import UIKit

final class OptionDetailViewController: BaseViewController {
    enum Constants {
        enum BaseSingleOptionContainerView {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 22)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -22)
        }
    }
    enum OptionType {
        case package
        case single
        
        var maximumContentHeight: CGFloat {
            switch self {
            case .package:
                return OptionType.single.maximumContentHeight + .toScaledHeight(value: 190)
            case .single:
                typealias BaseOptionConst = BaseOptionDetailRoundView.Constants
                typealias OptionDetailDecriptionConst = OptionDetailDescriptionAreaView.Constants
                let thumbnailHeight = BaseOptionConst.ThumbnailView.height
                let contentViewTopAndBottomMarginHeight = BaseOptionConst.ContentView.topAndBottomMarginHeight
                let optionDetailDescriptionMaximumHeight = OptionDetailDecriptionConst.maximumHeight
                return (thumbnailHeight +
                        contentViewTopAndBottomMarginHeight +
                        optionDetailDescriptionMaximumHeight)
            }
        }
    }
    
    // MARK: - UI properties
    private var singleOptionDetailContentView: OptionDetailDescriptionAreaView?
    private lazy var baseSingleOptionContainerView: BaseOptionDetailRoundView = {
        let contentView = OptionDetailDescriptionAreaView()
        singleOptionDetailContentView = contentView
        let baseView = BaseOptionDetailRoundView(contentView: contentView)
        return baseView
    }()
    
    // MARK: - Properties
    private let optionType: OptionType
    
    // MARK: - Lifecycles
    init(optionType: OptionType) {
        self.optionType = optionType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        optionType = .single
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        /// 서버에서 데이터 받아왔다 가정
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.configure(
                images: [UIImage(named: "threeColumnHeatRaysOption")],
                optionTitles: ["헤드업 디스플레이"],
                optionPrice: ["1,090,000 원"],
                optionDescription: ["주요 주행 정보를 전면 윈드시트에 표시하며, 밝기가 최적화 되어 주간에도 시인성이 뛰어납니다."])
        }
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        view.backgroundColor = .brown
        navigationController?.navigationBar.alpha = 0
        setupUI()
    }
    
    // MARK: - Functions
    
    func configure(
        images: [UIImage?],
        optionTitles: [String],
        optionPrice: [String],
        optionDescription: [String]
    ) {
        if optionType == .single {
            baseSingleOptionContainerView.configure(
                image: images[0],
                closeButtonAlpha: 1)
            singleOptionDetailContentView?.configure(
                optionTitle: optionTitles[0],
                optionPrice: optionPrice[0],
                optionDescription: optionDescription[0])
        } else {
            /// 컬랙션 뷰 데이터 소스 업데이트
        }
    }
    // MARK: - Objc Functions
}

extension OptionDetailViewController: LayoutSupportable {
    func setupViews() {
        switch optionType {
        case .package:
            /// 컬랙션 뷰
            break
        case .single:
            view.addSubview(baseSingleOptionContainerView)
        }
    }
    
    func setupConstriants() {
        switch optionType {
        case .single:
            configureBaseSingleOptionContainerView()
        case .package:
            break
        }
    }
    
    private func configureBaseSingleOptionContainerView() {
        typealias Const = Constants.BaseSingleOptionContainerView
        NSLayoutConstraint.activate([
            baseSingleOptionContainerView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Const.leadingMargin),
            baseSingleOptionContainerView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Const.trailingMargin),
            baseSingleOptionContainerView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),
            baseSingleOptionContainerView.heightAnchor.constraint(
                lessThanOrEqualToConstant: optionType.maximumContentHeight)])
    }
}
