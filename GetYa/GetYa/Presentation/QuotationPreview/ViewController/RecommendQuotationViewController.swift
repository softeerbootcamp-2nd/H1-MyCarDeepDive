//
//  RecommendQuotationViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/28.
//

import UIKit
import Combine

class RecommendQuotationViewController: UIViewController {
    enum Constatns {
        enum ThumbnailView {
            static let height: CGFloat = .toScaledHeight(value: 490)
        }
        enum CarInfoView {
            static let height: CGFloat = .toScaledHeight(value: 89)
        }
        enum QoutateTableView {
            static let basicHeight: CGFloat = .toScaledHeight(value: 3)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
        }
        enum TotalNameAndPriceView {
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 26)
        }
        enum LeftAndRightButtonStackView {
            static let topMargin: CGFloat = .toScaledHeight(value: 64)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 52)
        }
    }

    // MARK: - UI properties
    private let scrollView: UIScrollView = UIScrollView().set {
        $0.showsVerticalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let contentView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let thumbnailView = RecommendQuotationThumbnailView()
    private let carInfoView = CommonQuotationPreviewCarInfoView()
    private let quotateTableView = RecommendQuotatonTableView()
    private var quotateTableViewHeightConstraint: NSLayoutConstraint!
    private let totalNameAndPriceView: OptionNameAndPriceView = OptionNameAndPriceView().set {
        $0.setNameLabelColor(color: .GetYaPalette.gray400)
        $0.setNameLabelFont(fontType: .mediumBody3)
        $0.setName(text: "총 금액")
        $0.setPriceLabelColor(color: .GetYaPalette.gray0)
        $0.setPriceLabelFont(fontType: .mediumHead3)
    }
    private lazy var leftAndRightButtonStackView = LeftAndRightButtonStackView()
    
    // MARK: - Properties
    let viewModel: RecommendQuotationViewModel
    private var cancellables = Set<AnyCancellable>()
    let viewDidLoadEvent = PassthroughSubject<Void, Never>()
    
    // MARK: - Lifecycles
    init(viewModel: RecommendQuotationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
        setupViews()
        configureUI()
        viewDidLoadEvent.send()
    }
    
    // MARK: - Private Functions
    private func bind() {
        let input = RecommendQuotationViewModel.Input(
            viewDidLoadEvent: viewDidLoadEvent.eraseToAnyPublisher()
        )
        let output = viewModel.transform(input: input)
        
        output.quotation
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] quotation in
                guard let self else { return }
                thumbnailView.setTag(text: "펠리세이드 - " + quotation.trimName)
                thumbnailView.setTitle(text: quotation.comment1, partText: quotation.keyword)
                thumbnailView.setReviewLabel(text: quotation.comment2)
                thumbnailView.setCarImage(imageURL: quotation.carImageURL)
                carInfoView.configure(
                    with: QuotationPreviewCarInfoModel(
                        carName: "펠리세이드",
                        trimName: quotation.trimName,
                        carPrice: quotation.trimPrice.toPriceFormat + "원",
                        carOptions: [
                            quotation.engineName,
                            quotation.drivingSystemName,
                            quotation.bodyName
                        ].joined(separator: " ・ ")))
                quotateTableView.setData(
                    colorNames: [quotation.exteriorColor.colorName, quotation.interiorColor.colorName],
                    colorImageURLArray: [quotation.exteriorColor.colorImageURL, quotation.interiorColor.colorImageURL],
                    colorPrices: [quotation.exteriorColor.price, quotation.interiorColor.price],
                    optionList: quotation.options)
                quotateTableView.setReviewTexts(texts: [
                    quotation.exteriorColor.comment,
                    quotation.interiorColor.comment
                ] + quotation.options.map { $0.comment ?? "" } + quotation.packages.map { $0.comment ?? "" })
                quotateTableViewHeightConstraint.isActive = false
                quotateTableViewHeightConstraint.constant = CGFloat(140).scaledHeight
                * CGFloat(quotation.options.count + 2)
                + CGFloat(87).scaledHeight
                quotateTableViewHeightConstraint.isActive = true
                totalNameAndPriceView.setPrice(value: quotation.totalPrice)
                leftAndRightButtonStackView.setLeftButton(title: "커스텀하기", handler: {
                    let provider = SessionProvider()
                    let useCase = DefaultCarSettingUseCase(
                        trimSelectRepository: DefaultTrimSelectRepository(provider: provider),
                        colorSelectRepository: DefaultColorSelectRepository(provider: provider),
                        optionSelectRepository: DefaultOptionSelectRepository(provider: provider))
                    let carSettingSelectViewController = CarSettingSelectViewController(
                        viewModel: CarSettingSelectViewModel(useCase: useCase))
                    let trimSelectViewController = TrimSelectViewController(
                        viewModel: TrimSelectViewModel(
                            trimSubOptionSelect: TrimSubOptionSelect(
                                engineID: quotation.engineID,
                                bodyID: quotation.bodyID,
                                drivingSystemID: quotation.drivingSystemID),
                            useCase: useCase))
                    let colorSelectViewController = ColorSelectViewController(
                        viewModel: ColorSelectViewModel(useCase: useCase))
                    let optionSelectViewController = OptionSelectViewController(
                        viewModel: OptionSelectViewModel(useCase: useCase))
                    
                    carSettingSelectViewController.setViewControllers(
                        viewControllers: [
                            trimSelectViewController,
                            colorSelectViewController,
                            optionSelectViewController])
                    guard let homeViewController = self.navigationController?.viewControllers.first else { return }
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?
                        .removeAllViewContrllerExcept(
                            to: homeViewController,
                            nextViewController: carSettingSelectViewController)
                })
                leftAndRightButtonStackView.setRightButton(title: "빠른 견적내기", handler: {
                    let viewController = LoadingViewController(
                        viewModel: LoadingViewModel(
                            contrationQuotation: ContractionQuotation(
                                carSpecID: quotation.carSpecID,
                                trimID: quotation.trimID,
                                exteriorColorID: quotation.exteriorColor.colorID,
                                interiorColorID: quotation.interiorColor.colorID,
                                additionalOptionIDList: quotation.options.map { $0.optionID ?? 1 }),
                            useCase: DefaultLoadingUseCase(
                                repository: DefaultLoadingRepository(provider: SessionProvider()))))
                    guard let homeViewController = self.navigationController?.viewControllers.first else { return }
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?
                        .removeAllViewContrllerExcept(
                            to: homeViewController,
                            nextViewController: viewController)
                })
            })
            .store(in: &cancellables)
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([
            thumbnailView,
            carInfoView,
            quotateTableView,
            totalNameAndPriceView,
            leftAndRightButtonStackView
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureSrollView()
        configureContentView()
        configureThumbnailView()
        configureCarInfoView()
        configureQuotationTableView()
        configureTotalNameAndPriceView()
        configureLeftAndRightStackView()
    }
    
    private func configureSrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func configureThumbnailView() {
        typealias Const = Constatns.ThumbnailView
        
        NSLayoutConstraint.activate([
            thumbnailView.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbnailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbnailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            thumbnailView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureCarInfoView() {
        typealias Const = Constatns.CarInfoView
        
        NSLayoutConstraint.activate([
            carInfoView.topAnchor.constraint(equalTo: thumbnailView.bottomAnchor),
            carInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carInfoView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureQuotationTableView() {
        typealias Const = Constatns.QoutateTableView
        typealias ConstTable = QuotationTableView.Constants
        quotateTableViewHeightConstraint = quotateTableView.heightAnchor.constraint(
            greaterThanOrEqualToConstant: ConstTable.headerHeight * 2 + Const.basicHeight)
        NSLayoutConstraint.activate([
            quotateTableView.topAnchor.constraint(equalTo: carInfoView.bottomAnchor),
            quotateTableView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Const.leadingMargin),
            quotateTableView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Const.trailingMargin),
            quotateTableViewHeightConstraint
        ])
    }
    
    private func configureTotalNameAndPriceView() {
        typealias Const = Constatns.TotalNameAndPriceView
        
        NSLayoutConstraint.activate([
            totalNameAndPriceView.topAnchor.constraint(
                equalTo: quotateTableView.bottomAnchor,
                constant: Const.topMargin),
            totalNameAndPriceView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Const.leadingMargin),
            totalNameAndPriceView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Const.trailingMargin),
            totalNameAndPriceView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureLeftAndRightStackView() {
        typealias Const = Constatns.LeftAndRightButtonStackView
        
        NSLayoutConstraint.activate([
            leftAndRightButtonStackView.topAnchor.constraint(
                equalTo: totalNameAndPriceView.bottomAnchor,
                constant: Const.topMargin),
            leftAndRightButtonStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Const.leadingMargin),
            leftAndRightButtonStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Const.trailingMargin),
            leftAndRightButtonStackView.heightAnchor.constraint(equalToConstant: Const.height),
            leftAndRightButtonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
}
