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
            static let lineSpacing: CGFloat = .toScaledWidth(value: 8)
            static let leadingInset: CGFloat = .toScaledWidth(value: 22)
            static let trailingInset = leadingInset
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
            $0.minimumLineSpacing = Const.lineSpacing
            $0.sectionInset = .init(top: 0, left: Const.leadingInset, bottom: 0, right: Const.trailingInset)
        }
        return UICollectionView(frame: .zero, collectionViewLayout: layout).set {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.decelerationRate = .init(rawValue: 0.42)
            $0.delegate = self
            $0.dataSource = self
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
    
    private var isClearFirstSetting = false
    private var selectedIndexList: [Int] = []
    
    var mockImages = [
        UIImage(named: "threeColumnHeatRaysOption"),
        UIImage(named: "threeColumnHeatRaysOption"),
        UIImage(named: "threeColumnHeatRaysOption"),
        UIImage(named: "threeColumnHeatRaysOption")]
    var mockPackageTitle = "컴포트 II"
    var mockOptionTitles = [
        "헤드업 디스플레이I",
        "헤드업 디스플레이II",
        "헤드업 디스플레이III",
        "헤드업 디스플레이IIII"]
    var mockOptionPrice = [
        "1,090,000 원",
        "1,090,001 원",
        "1,090,002 원",
        "1,090,003 원"]
    var mockOptionDescription = [
        "주요 주행 정보를 전면 윈드시트에 표시하며, 밝기가 최적화 되어 주간에도 시인성이 뛰어납니다.주요 주행 정보를 전면 윈드시트에 표시하며, 밝기가 최적화 되어 주간에도 시인성이 뛰어납니다.",
        "주요 주행 정보를 전면 윈드시트에 표시합니다",
        "주요 주행 정보를 전면 윈드시트에 표시하며, 밝기가 최적화 되어 주간에도 시인성이 뛰어납니다.",
        "주요 주행 정보를 전면 윈드시트에 표시하며, 밝기가 최적화 되어 주간에도 시인성이 뛰어납니다.주요 주행 정보를 전면 윈드시트에 표시합니다."]
    
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
                images: self.mockImages,
                packageTitle: self.mockPackageTitle,
                optionTitles: self.mockOptionTitles,
                optionPrice: self.mockOptionPrice,
                optionDescription: self.mockOptionDescription)
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
            optionPackageCollectionView.reloadData()
        }
    }
    // MARK: - Objc Functions
}

// MARK: - BaseOptionDetailRoundViewDelegate
extension OptionDetailViewController: BaseOptionDetailRoundViewDelegate {
    func touchUpCloseButton(_ baseOptionDetailRoundView: UIView) {
        // getIdentifierTODO: - 델리게이트 호출 시점에 옵션에 대한 identifier를 받아오는 방법 좋겠습니다.
//        var selectedIdx: Int?
//        _=optionPackageCollectionView.visibleCells.enumerated().map { (index, element) in
//            if element.isSelected {
//                selectedIdx = index
//            }
//        }
//        print(selectedIdx)
        /// dismiss할때 컴플리션이든 이전 화면에게 선택된 idx전달.
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
        return mockOptionTitles.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let idx = indexPath.row
        if collectionView === optionPackageCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OptionDetailCell.identifier,
                for: indexPath
            ) as? OptionDetailCell else {
                return .init(frame: .zero)
            }
            cell.configureBaseOptionView(image: mockImages[idx], closeButtonAlpha: 1)
            cell.configure(
                pages: mockImages.count,
                packageTitle: mockPackageTitle,
                title: mockOptionTitles[idx],
                price: mockOptionPrice[idx],
                description: mockOptionDescription[idx])
            cell.configure(
                baseOptionContainerViewDelegate: self,
                optionPackageKeywordDelegator: self,
                optionSelectedDelegate: self)
            if !isClearFirstSetting {
                cell.configureFirstSetting()
                isClearFirstSetting.toggle()
            }
            cell.setPageControlSelectedPage(currentPage: idx)
            cell.tag = idx
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OptionDetailKeywordCell.identifier,
            for: indexPath
        ) as? OptionDetailKeywordCell else {
            return .init(frame: .zero)
        }
        cell.configure(mockOptionTitles[idx])
        return cell
    }
}

// MARK: -
extension OptionDetailViewController: OptionPackageDescriptionViewDelegate {
    func touchUpOptionSelectButton(
        _ packageView: OptionPackageDescriptionView?,
        isSelected: Bool
    ) {
        guard let packageView = packageView else { return }
        if isSelected, !selectedIndexList.contains(packageView.tag) {
            selectedIndexList.append(packageView.tag)
            return
        }
        selectedIndexList = selectedIndexList.filter { !($0 == packageView.tag) }
    }
}

// MARK: - UICollectionViewDelegate
extension OptionDetailViewController: UICollectionViewDelegate {
    /// 스크롤되고 스크롤완료될떄. 내부 TitleCollectionView도 같이 해주는게 좋겠당 ㅇㅇ
    ///
    /// // TODO: - 옵션 키워드 셀렉에 대해서 화면 변경하기. 동기화 그리고 pageControl도 동기화
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        if collectionView is OptionKeywordCollectionView  && !mockOptionPrice.isEmpty {
            collectionView.scrollToItem(
                at: indexPath,
                at: .centeredHorizontally,
                animated: true)
            optionPackageCollectionView.scrollToItem(
                at: indexPath,
                at: .centeredHorizontally,
                animated: true)
            collectionView.cellForItem(at: indexPath)?.isSelected = true
            _=optionPackageCollectionView.visibleCells.map {
                if $0.isSelected { $0.isSelected.toggle() }
            }
            optionPackageCollectionView.cellForItem(at: indexPath)?.isSelected = true
        }
    }
    
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        typealias Const = Constants.OptionPackageCollectionView
        let offset = targetContentOffset.pointee
        let cellWidthAndSpacing: CGFloat = Const.itemSize.width + Const.lineSpacing
        let index = round((offset.x + Const.leadingInset) / cellWidthAndSpacing)
        targetContentOffset.pointee = CGPoint(
            x: index * cellWidthAndSpacing,
            y: 0)
    }
}

// MARK: - LayoutSupportable
extension OptionDetailViewController: LayoutSupportable {
    func setupViews() {
        switch optionType {
        case .single:
            view.addSubview(baseSingleOptionContainerView)
        case .package:
            view.addSubview(optionPackageCollectionView)
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
