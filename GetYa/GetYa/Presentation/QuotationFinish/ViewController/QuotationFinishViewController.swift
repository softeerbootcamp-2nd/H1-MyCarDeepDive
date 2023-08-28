//
//  QuotationFinishViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit
import SafariServices
import Combine

class QuotationFinishViewController: BaseViewController {
    enum Constatns {
        enum ThumbnailView {
            static let height: CGFloat = .toScaledHeight(value: 440)
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
            static let height: CGFloat = .toScaledHeight(value: 24)
        }
        enum ShareButton {
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 40)
            static let width: CGFloat = .toScaledHeight(value: 40)
        }
        enum PDFButton {
            static let topMargin: CGFloat = .toScaledHeight(value: 32)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let height: CGFloat = .toScaledHeight(value: 52)
            static let width: CGFloat = .toScaledWidth(value: 168)
        }
        enum MailButton {
            static let topMargin: CGFloat = .toScaledHeight(value: 32)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 52)
            static let width: CGFloat = .toScaledWidth(value: 168)
        }
        enum StoreButton {
            static let topMargin: CGFloat = .toScaledHeight(value: 8)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 52)
        }
        enum LineView {
            static let topMargin: CGFloat = .toScaledHeight(value: 24)
            static let height: CGFloat = .toScaledHeight(value: 4)
        }
        enum PurchaseView {
            static let topMargin: CGFloat = .toScaledHeight(value: 20)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
        }
        enum LeftAndButtonStackView {
            static let topMargin: CGFloat = .toScaledHeight(value: 40)
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
    private let thumbnailView = QuotationFinishThumbnailView()
    private let carInfoView = CommonQuotationPreviewCarInfoView()
    private let quotateTableView = QuotationTableView()
    private var quotateTableViewHeightConstraint: NSLayoutConstraint!
    private let totalNameAndPriceView: OptionNameAndPriceView = OptionNameAndPriceView().set {
        $0.setNameLabelColor(color: .GetYaPalette.gray400)
        $0.setNameLabelFont(fontType: .mediumBody3)
        $0.setName(text: "총 금액")
        $0.setPriceLabelColor(color: .GetYaPalette.gray0)
        $0.setPriceLabelFont(fontType: .mediumHead3)
    }
    private lazy var shareButton: UIButton = UIButton().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.backgroundColor = .GetYaPalette.gray1000.withAlphaComponent(0.5)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.setImage(UIImage(named: "share")?.resize(targetSize: CGSize(width: 18, height: 18)), for: .normal)
        $0.addAction(
            UIAction(handler: { [weak self] _ in
                guard let self else { return }
                touchUpShareButtonEvent.send()
            }),
            for: .touchUpInside)
    }
    private lazy var pdfButton = CommonButton(
        font: GetYaFont.mediumBody3.uiFont,
        buttonBackgroundColorType: .custom(
            textColor: .GetYaPalette.gray200,
            layerBorderColor: .GetYaPalette.gray600,
            color: .white)
    ).set {
        $0.setTitle("PDF로 저장", for: .normal)
        $0.addAction(UIAction(handler: { [weak self] _ in
            guard let self else { return }
            self.touchUpPDFButtonEvent.send()
        }), for: .touchUpInside)
    }
    private lazy var mailButton = CommonButton(
        font: GetYaFont.mediumBody3.uiFont,
        buttonBackgroundColorType: .custom(
            textColor: .GetYaPalette.gray200,
            layerBorderColor: .GetYaPalette.gray600,
            color: .white)
    ).set {
        $0.setTitle("메일로 발송", for: .normal)
        $0.addAction(UIAction(handler: { _ in
            self.showAlert(
                type: .mail,
                buttonType: .twoButton,
                leftTitle: "아니요",
                rightTitle: "보내기")
        }), for: .touchUpInside)
    }
    private lazy var storeButton = CommonButton(
        font: GetYaFont.mediumBody3.uiFont,
        buttonBackgroundColorType: .custom(
            textColor: .GetYaPalette.gray200,
            layerBorderColor: .GetYaPalette.gray600,
            color: .white)
    ).set {
        $0.setTitle("내 계정에 저장하기", for: .normal)
        $0.addAction(UIAction(handler: { _ in
            self.showAlert(
                type: .title(title: "로그인이 필요한 서비스에요.\n로그인 화면으로 이동하시겠어요?"),
                buttonType: .twoButton,
                leftTitle: "아니요",
                rightTitle: "네",
                rightButtonHandler: { [weak self] in
                    guard let self else { return }
                    self.presentSafariViewController(urlString: "https://prd.kr-ccapi.hyundai.com/web/v1/user/signin")
                })
        }), for: .touchUpInside)
    }
    private let lineView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .GetYaPalette.gray800
    }
    private let purchaseView = PurchaseView()
    private lazy var leftAndButtonStackView = LeftAndRightButtonStackView().set {
        $0.setLeftButton(title: "수정", handler: {
            if let trimViewControllerIndex = self.navigationController?
                .viewControllers
                .firstIndex(where: {
                    $0 is TrimSelectViewController
                }) {
                print(trimViewControllerIndex)
            } else {
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
                            engineID: 1,
                            bodyID: 1,
                            drivingSystemID: 1),
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
            }
        })
        $0.setRightButton(title: "구매/상담", handler: { [weak self] in
            guard let self else { return }
            self.presentSafariViewController(urlString: "https://www.hyundai.com/kr/ko/e/vehicles/purchase-consult")
        })
    }
    
    // MARK: - Properties
    private let viewModel: QuotationFinishViewModel
    private var cancellables = Set<AnyCancellable>()
    private let viewDidLoadEvent = PassthroughSubject<Void, Never>()
    private let postEmailEvent = PassthroughSubject<String, Never>()
    private let touchUpShareButtonEvent = PassthroughSubject<Void, Never>()
    private let touchUpPDFButtonEvent = PassthroughSubject<Void, Never>()
    
    // MARK: - Lifecycles
    init(viewModel: QuotationFinishViewModel) {
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
        viewDidLoadEvent.send(())
    }
    
    // MARK: - Private Functions
    private func bind() {
        let input = QuotationFinishViewModel.Input(
            viewDidLoadEvent: viewDidLoadEvent.eraseToAnyPublisher(),
            postEmailEvent: postEmailEvent.eraseToAnyPublisher(),
            touchUpShareButtonEvent: touchUpShareButtonEvent.eraseToAnyPublisher(),
            touchUpPDFButtonEvent: touchUpPDFButtonEvent.eraseToAnyPublisher())
        let output = viewModel.transform(input: input)
        
        output.carInquery
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] carInquery in
                guard let self else { return }
                configureData(carInquery: carInquery)
            })
            .store(in: &cancellables)
        
        output.emailResult
            .sink(receiveValue: {
                print("이메일 전송 결과: \($0)")
            })
            .store(in: &cancellables)
        
        output.pdfID
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                showAlert(
                    type: .share(pdfID: $0),
                    buttonType: .oneButton,
                    rightTitle: "공유하기")
            })
            .store(in: &cancellables)
        
        output.pdfURL
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                self.presentSafariViewController(urlString: "https://" + $0)
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
            shareButton,
            pdfButton,
            mailButton,
            storeButton,
            lineView,
            purchaseView,
            leftAndButtonStackView
        ])
        
        setupNotificationCenter()
    }
    
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(getEmail),
            name: Notification.Name("AlertEmail"),
            object: nil)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureSrollView()
        configureContentView()
        configureThumbnailView()
        configureCarInfoView()
        configureQuotationTableView()
        configureTotalNameAndPriceView()
        configureShareButton()
        configurePDFButton()
        configureMailButton()
        configureStoreButton()
        configureLineView()
        configurePurchaseView()
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
            equalToConstant: ConstTable.headerHeight * 2 + Const.basicHeight)
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
    
    private func calculateQuotationTablewViewHeight(optionCount: Int) {
        typealias ConstTable = QuotationTableView.Constants
        var height: CGFloat = .toScaledHeight(value: 3)
        height += ConstTable.headerHeight + ConstTable.cellHeight * 2
        if optionCount != 0 {
            height += ConstTable.headerHeight + ConstTable.cellHeight * CGFloat(optionCount)
        }
        quotateTableViewHeightConstraint.isActive = false
        quotateTableViewHeightConstraint.constant = height
        quotateTableViewHeightConstraint.isActive = true
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
                constant: CGFloat(-16).scaledWidth),
            totalNameAndPriceView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func configureShareButton() {
        typealias Const = Constatns.ShareButton
        
        shareButton.layer.cornerRadius = Const.height / 2
        
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(
                equalTo: thumbnailView.imageView.topAnchor,
                constant: Const.topMargin),
            shareButton.trailingAnchor.constraint(
                equalTo: thumbnailView.imageView.trailingAnchor,
                constant: Const.trailingMargin),
            shareButton.heightAnchor.constraint(equalToConstant: Const.height),
            shareButton.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    private func configurePDFButton() {
        typealias Const = Constatns.PDFButton
        
        NSLayoutConstraint.activate([
            pdfButton.topAnchor.constraint(
                equalTo: totalNameAndPriceView.bottomAnchor,
                constant: Const.topMargin),
            pdfButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Const.leadingMargin),
            pdfButton.heightAnchor.constraint(equalToConstant: Const.height),
            pdfButton.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    private func configureMailButton() {
        typealias Const = Constatns.MailButton
        
        NSLayoutConstraint.activate([
            mailButton.topAnchor.constraint(
                equalTo: totalNameAndPriceView.bottomAnchor,
                constant: Const.topMargin),
            mailButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Const.trailingMargin),
            mailButton.heightAnchor.constraint(equalToConstant: Const.height),
            mailButton.widthAnchor.constraint(equalToConstant: Const.width)
        ])
    }
    
    private func configureStoreButton() {
        typealias Const = Constatns.StoreButton
        
        NSLayoutConstraint.activate([
            storeButton.topAnchor.constraint(
                equalTo: pdfButton.bottomAnchor,
                constant: Const.topMargin),
            storeButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Const.leadingMargin),
            storeButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Const.trailingMargin),
            storeButton.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureLineView() {
        typealias Const = Constatns.LineView
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: storeButton.bottomAnchor, constant: Const.topMargin),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configurePurchaseView() {
        typealias Const = Constatns.PurchaseView
        
        NSLayoutConstraint.activate([
            purchaseView.topAnchor.constraint(
                equalTo: lineView.bottomAnchor,
                constant: Const.topMargin),
            purchaseView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Const.leadingMargin),
            purchaseView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Const.trailingMargin)
        ])
    }
    
    private func configureLeftAndRightStackView() {
        typealias Const = Constatns.LeftAndButtonStackView
        
        NSLayoutConstraint.activate([
            leftAndButtonStackView.topAnchor.constraint(
                equalTo: purchaseView.bottomAnchor,
                constant: Const.topMargin),
            leftAndButtonStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Const.leadingMargin),
            leftAndButtonStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Const.trailingMargin),
            leftAndButtonStackView.heightAnchor.constraint(equalToConstant: Const.height),
            leftAndButtonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func configureData(carInquery: QuotationFinish) {
        thumbnailView.setData(carName: carInquery.carName, trimName: carInquery.trimName)
        carInfoView.configure(
            with: QuotationPreviewCarInfoModel(
                carName: carInquery.carName,
                trimName: carInquery.trimName,
                carPrice: carInquery.basicPrice.toPriceFormat + "원",
                carOptions: [
                    carInquery.engineName,
                    carInquery.drivingSystemName,
                    carInquery.bodyName
                ].joined(separator: " ・ ")))
        quotateTableView.setData(
            colorNames: [carInquery.exteriorColorName, carInquery.interiorColorName],
            colorImageURLArray: [carInquery.exteriorColorImageURL, carInquery.interiorColorImageURL],
            colorPrices: [carInquery.exteriorColorPrice, carInquery.interiorColorPrice],
            optionList: carInquery.optionList)
        calculateQuotationTablewViewHeight(optionCount: carInquery.optionList.count)
        totalNameAndPriceView.setPrice(value: carInquery.basicPrice)
        purchaseView.setTotalPrice(totalPrice: carInquery.totalPrice)
    }
    
    private func presentSafariViewController(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .fullScreen

        self.present(safariVC, animated: true, completion: nil)
    }
    
    // MARK: - Functions
    override func touchUpNavigationBackButton() {
        showAlert(
            type: .message(
                title: "추천이 도움이 되었나요?",
                description: "고객님의 답변을 반영해 더 나은 서비스를 만들게요."),
            buttonType: .twoButton,
            leftButtonHandler: {
                self.navigationController?.popViewController(animated: true)
            },
            rightButtonHandler: {
                self.navigationController?.popViewController(animated: true)
            })
    }
    
    // MARK: - Objc Functions
    @objc private func getEmail(_ notification: Notification) {
        guard let text = notification.userInfo?["email"] as? String else { return }
        postEmailEvent.send(text)
    }
}
