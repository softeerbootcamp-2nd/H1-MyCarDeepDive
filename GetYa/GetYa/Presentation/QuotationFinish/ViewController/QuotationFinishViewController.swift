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
    private let qoutateTableView = QuotationTableView()
    private var quotateTableViewTopConstraint: NSLayoutConstraint!
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
                showAlert(
                    type: .share(pdfID: ""),
                    buttonType: .oneButton,
                    rightTitle: "공유하기")
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
        $0.addAction(UIAction(handler: { _ in
            // pdf 열기
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
                buttonType: .oneButton,
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
                rightButtonHandler: {
                    guard let url = URL(string: "https://prd.kr-ccapi.hyundai.com/web/v1/user/signin") else { return }
                    let safariVC = SFSafariViewController(url: url)
                    safariVC.modalPresentationStyle = .fullScreen

                    self.present(safariVC, animated: true, completion: nil)
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
            // TODO: 2.1 트림 선택 화면으로
            print("수정")
        })
        $0.setRightButton(title: "구매/상담", handler: {
            guard let url = URL(string: "https://www.hyundai.com/kr/ko/e/vehicles/purchase-consult") else { return }
            let safariVC = SFSafariViewController(url: url)
            safariVC.modalPresentationStyle = .fullScreen

            self.present(safariVC, animated: true, completion: nil)
        })
    }
    
    // MARK: - Properties
    private let viewModel: QuotationFinishViewModel
    private var cancellables = Set<AnyCancellable>()
    private let viewDidLoadEvent = PassthroughSubject<Void, Never>()
    private let postEmailEvent = PassthroughSubject<String, Never>()
    
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
            postEmailEvent: postEmailEvent.eraseToAnyPublisher())
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
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([
            thumbnailView,
            carInfoView,
            qoutateTableView,
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
        NSLayoutConstraint.activate([
            thumbnailView.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbnailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbnailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            thumbnailView.heightAnchor.constraint(equalToConstant: CGFloat(440).scaledHeight)
        ])
    }
    
    private func configureCarInfoView() {
        NSLayoutConstraint.activate([
            carInfoView.topAnchor.constraint(equalTo: thumbnailView.bottomAnchor),
            carInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carInfoView.heightAnchor.constraint(equalToConstant: CGFloat(89).scaledHeight)
        ])
    }
    
    private func configureQuotationTableView() {
        typealias ConstTable = QuotationTableView.Constants
        quotateTableViewTopConstraint = qoutateTableView.heightAnchor.constraint(
            equalToConstant: ConstTable.headerHeight * 2 + CGFloat(3).scaledHeight)
        NSLayoutConstraint.activate([
            qoutateTableView.topAnchor.constraint(equalTo: carInfoView.bottomAnchor),
            qoutateTableView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: CGFloat(16).scaledWidth),
            qoutateTableView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: CGFloat(-16).scaledWidth),
            quotateTableViewTopConstraint
        ])
    }
    
    private func calculateQuotationTablewViewHeight(optionCount: Int) {
        typealias ConstTable = QuotationTableView.Constants
        var height: CGFloat = .toScaledHeight(value: 3)
        height += ConstTable.headerHeight + ConstTable.cellHeight * 2
        if optionCount != 0 {
            height += ConstTable.headerHeight + ConstTable.cellHeight * CGFloat(optionCount)
        }
        quotateTableViewTopConstraint.isActive = false
        quotateTableViewTopConstraint.constant = height
        quotateTableViewTopConstraint.isActive = true
    }
    
    private func configureTotalNameAndPriceView() {
        NSLayoutConstraint.activate([
            totalNameAndPriceView.topAnchor.constraint(
                equalTo: qoutateTableView.bottomAnchor,
                constant: CGFloat(16).scaledHeight),
            totalNameAndPriceView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: CGFloat(16).scaledWidth),
            totalNameAndPriceView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: CGFloat(-16).scaledWidth),
            totalNameAndPriceView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func configureShareButton() {
        shareButton.layer.cornerRadius = CGFloat(40).scaledHeight / 2
        
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(
                equalTo: thumbnailView.imageView.topAnchor,
                constant: CGFloat(16).scaledHeight),
            shareButton.trailingAnchor.constraint(
                equalTo: thumbnailView.imageView.trailingAnchor,
                constant: CGFloat(-16).scaledWidth),
            shareButton.heightAnchor.constraint(equalToConstant: CGFloat(40).scaledHeight),
            shareButton.widthAnchor.constraint(equalToConstant: CGFloat(40).scaledHeight)
        ])
    }
    
    private func configurePDFButton() {
        NSLayoutConstraint.activate([
            pdfButton.topAnchor.constraint(
                equalTo: totalNameAndPriceView.bottomAnchor,
                constant: CGFloat(32).scaledHeight),
            pdfButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: CGFloat(16).scaledWidth),
            pdfButton.heightAnchor.constraint(equalToConstant: CGFloat(52).scaledHeight),
            pdfButton.widthAnchor.constraint(equalToConstant: CGFloat(168).scaledWidth)
        ])
    }
    
    private func configureMailButton() {
        NSLayoutConstraint.activate([
            mailButton.topAnchor.constraint(
                equalTo: totalNameAndPriceView.bottomAnchor,
                constant: CGFloat(32).scaledHeight),
            mailButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: CGFloat(-16).scaledWidth),
            mailButton.heightAnchor.constraint(equalToConstant: CGFloat(52).scaledHeight),
            mailButton.widthAnchor.constraint(equalToConstant: CGFloat(168).scaledWidth)
        ])
    }
    
    private func configureStoreButton() {
        NSLayoutConstraint.activate([
            storeButton.topAnchor.constraint(
                equalTo: pdfButton.bottomAnchor,
                constant: CGFloat(8).scaledHeight),
            storeButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: CGFloat(16).scaledWidth),
            storeButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: CGFloat(-16).scaledWidth),
            storeButton.heightAnchor.constraint(equalToConstant: CGFloat(52).scaledHeight)
        ])
    }
    
    private func configureLineView() {
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: storeButton.bottomAnchor, constant: CGFloat(24).scaledHeight),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: CGFloat(4).scaledHeight)
        ])
    }
    
    private func configurePurchaseView() {
        NSLayoutConstraint.activate([
            purchaseView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: CGFloat(20).scaledHeight),
            purchaseView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: CGFloat(16).scaledWidth),
            purchaseView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: CGFloat(-16).scaledWidth)
        ])
    }
    
    private func configureLeftAndRightStackView() {
        NSLayoutConstraint.activate([
            leftAndButtonStackView.topAnchor.constraint(
                equalTo: purchaseView.bottomAnchor,
                constant: CGFloat(40).scaledHeight),
            leftAndButtonStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: CGFloat(16).scaledWidth),
            leftAndButtonStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: CGFloat(-16).scaledWidth),
            leftAndButtonStackView.heightAnchor.constraint(equalToConstant: CGFloat(52).scaledHeight),
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
        qoutateTableView.setData(
            colorNames: [carInquery.exteriorColorName, carInquery.interiorColorName],
            colorImageURLArray: [carInquery.exteriorColorImageURL, carInquery.interiorColorImageURL],
            colorPrices: [carInquery.exteriorColorPrice, carInquery.interiorColorPrice],
            optionList: carInquery.optionList)
        calculateQuotationTablewViewHeight(optionCount: carInquery.optionList.count)
        totalNameAndPriceView.setPrice(value: carInquery.basicPrice)
        purchaseView.setTotalPrice(totalPrice: carInquery.totalPrice)
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
