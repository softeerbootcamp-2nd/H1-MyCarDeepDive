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
        enum OptionPackageCollectionView {
            /// : .toScaledHeight(value: 578)
            static let itemSize: CGSize = .init(
                width: .toScaledWidth(value: 330),
                height: OptionType.package.maximumContentHeight)
            static let interItemSpacing: CGFloat = .toScaledWidth(value: 8)
            static let leadingInset: CGFloat = .toScaledWidth(value: 22)
            static let trailingInset: CGFloat = .toScaledWidth(value: 8)
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
        let contentView = OptionDetailDescriptionAreaView(frame: .zero)
        singleOptionDetailContentView = contentView
        contentView.setOptionSelect(singleOptionSelectAction)
        let baseView = BaseOptionDetailRoundView(contentView: contentView)
        return baseView
    }()
    private lazy var optionPackageCollectionView: UICollectionView = {
        typealias Const = Constants.OptionPackageCollectionView
        let layout = UICollectionViewFlowLayout().set {
            $0.itemSize = Const.itemSize
            $0.scrollDirection = .horizontal
            $0.minimumInteritemSpacing = Const.interItemSpacing
            $0.minimumLineSpacing = 0
            $0.sectionInset = .init(top: 0, left: Const.leadingInset, bottom: 0, right: Const.trailingInset)
        }
        return UICollectionView(frame: .zero, collectionViewLayout: layout).set {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.register(
                OptionDetailCell.self,
                forCellWithReuseIdentifier: OptionDetailCell.identifier)
        }
    }()
    
    // MARK: - Properties
    private let optionType: OptionType
    private lazy var singleOptionSelectAction = UIAction { [weak self] _ in
        self?.singleOptionDetailContentView?.setOptionSelectButtonSelectState()
    }
    
    // MARK: - Lifecycles
    init(optionType: OptionType) {
        self.optionType = optionType
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        optionType = .single
        super.init(coder: coder)
        modalPresentationStyle = .overFullScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.frame.origin.x += self.view.bounds.width
        UIView.animate(
            withDuration: 0.34,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.view.frame.origin.x = 0
            })
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.layer.backgroundColor = UIColor(red: 0.059, green: 0.067, blue: 0.078, alpha: 0.5).cgColor

        /// 서버에서 데이터 받아왔다 가정. 0.5초에 보여주는게 좋을 것 같습니다.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.configure(
                images: [UIImage(named: "threeColumnHeatRaysOption")],
                packageTitle: "컴포트 II",
                optionTitles: ["헤드업 디스플레이","헤드업 디스플레이","헤드업 디스플레이","헤드업 디스플레이"],
                optionPrice: ["1,090,000 원"],
                optionDescription: ["주요 주행 정보를 전면 윈드시트에 표시하며, 밝기가 최적화 되어 주간에도 시인성이 뛰어납니다.주요 주행 정보를 전면 윈드시트에 표시하며, 밝기가 최적화 되어 주간에도 시인성이 뛰어납니다."])
        }
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        navigationController?.navigationBar.alpha = 0
        setupUI()
    }
    
    // MARK: - Functions
    
    func configure(
        images: [UIImage?],
        packageTitle: String?,
        optionTitles: [String?],
        optionPrice: [String?],
        optionDescription: [String?]
    ) {
        if optionType == .single {
            baseSingleOptionContainerView.configure(
                image: images[0],
                closeButtonAlpha: 1)
            baseSingleOptionContainerView.delegate = self
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

// MARK: - BaseOptionDetailRoundViewDelegate
extension OptionDetailViewController: BaseOptionDetailRoundViewDelegate {
    func touchUpCloseButton(_ baseOptionDetailRoundView: UIView) {
        // getIdentifierTODO: - 델리게이트 호출 시점에 옵션에 대한 identifier를 받아오는 방법 좋겠습니다.
        UIView.animate(
            withDuration: 0.34,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.view.frame.origin.x += self.view.bounds.width
            }, completion: { _ in
                self.dismiss(animated: false)
            })
        navigationController?.navigationBar.alpha = 1
    }
}

// MARK: - UICollectionViewDataSource
extension OptionDetailViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 5
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if collectionView === optionPackageCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OptionDetailCell.identifier,
                for: indexPath
            ) as? OptionDetailCell else {
                return .init(frame: .zero)
            }
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OptionDetailKeywordCell.identifier,
            for: indexPath
        ) as? OptionDetailKeywordCell else {
            return .init(frame: .zero)
        }
        cell.configure("완성 거의 다 했다: ]")
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension OptionDetailViewController: UICollectionViewDelegate {
    /// 스크롤되고 스크롤완료될떄. 내부 TitleCollectionView도 같이 해주는게 좋겠당 ㅇㅇ
}

// MARK: - LayoutSupportable
extension OptionDetailViewController: LayoutSupportable {
    func setupViews() {
        switch optionType {
        case .single:
            view.addSubview(baseSingleOptionContainerView)
        case .package:
            break
            //view.addSubview(optionPackageCollectionView)
        }
    }
    
    func setupConstriants() {
        switch optionType {
        case .single:
            configureBaseSingleOptionContainerView()
        case .package:
            configureOptionPackageCollectionView()
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
                equalToConstant: Constants.OptionPackageCollectionView.itemSize.height)])
        //                lessThanOrEqualToConstant: optionType.maximumContentHeight)
    }
    
    private func configureOptionPackageCollectionView() {
        typealias Const = Constants.OptionPackageCollectionView
        NSLayoutConstraint.activate([
            optionPackageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            optionPackageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            optionPackageCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            optionPackageCollectionView.heightAnchor.constraint(equalToConstant: Const.itemSize.height)])
    }
}
