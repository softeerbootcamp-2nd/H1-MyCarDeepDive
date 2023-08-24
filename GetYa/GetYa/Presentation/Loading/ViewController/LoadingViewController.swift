//
//  LoadingViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/17.
//

import UIKit
import Lottie
import Combine

class LoadingViewController: UIViewController {
    enum Constants {
        enum LottieView {
            static let height: CGFloat = .toScaledHeight(value: 188)
        }
        enum Label {
            static let topMargin: CGFloat = .toScaledHeight(value: 70)
        }
    }
    
    // MARK: - UI properties
    private let label: CommonLabel = CommonLabel(
        fontType: .custom(
            size: 26,
            kern: -0.3,
            lineHeight: 32,
            nameType: .regularHead),
        color: .GetYaPalette.gray50
    ).set {
        $0.textAlignment = .center
    }
    
    private let lottieView = LottieAnimationView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.animation = LottieAnimation.named("LoadingLottie")
        $0.animationSpeed = 1.0
        $0.loopMode = .loop
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Properties
    private let viewModel: LoadingViewModel
    private var cancellables = Set<AnyCancellable>()
    private let viewDidLoadEvent = PassthroughSubject<Void, Never>()
    
    // MARK: - Lifecycles
    init(viewModel: LoadingViewModel) {
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
        
        lottieView.play()
        viewDidLoadEvent.send(())
    }
    
    // MARK: - Private Functions
    private func bind() {
        let input = LoadingViewModel.Input(
            viewDidLoadEvent: viewDidLoadEvent.eraseToAnyPublisher())
        let output = viewModel.transform(input: input)
        
        output.pdfID
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] _ in
                    guard let self else { return }
                    lottieView.stop()
                }, receiveValue: { [weak self] pdfID in
                    guard let self else { return }
                    let finishViewController = QuotationFinishViewController(
                        viewModel: QuotationFinishViewModel(
                            useCase: DefaultQuotationFinishUseCase(
                                pdfID: pdfID,
                                repository: DefaultQuotationFinishRepository(
                                    provider: SessionProvider()))))
                    
                    if let navigationController,
                       let firstViewController = navigationController.viewControllers.first {
                        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?
                            .removeAllViewContrllerExcept(
                                to: firstViewController,
                                nextViewController: finishViewController)
                    }
                })
            .store(in: &cancellables)
    }
    
    private func setupViews() {
        view.addSubviews([
            label,
            lottieView
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureNavigationBar()
        configureLabel()
        configureLottieView()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = ""
        navigationItem.titleView = UIImageView(image: UIImage(named: "Black_Logo"))
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func configureLabel() {
        typealias Const = Constants.Label
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Const.topMargin),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureLottieView() {
        typealias Const = Constants.LottieView
        
        NSLayoutConstraint.activate([
            lottieView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            lottieView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lottieView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lottieView.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    // MARK: - Functions
    func setTitleText(carName: String) {
        label.text = "나만의 \(carName)를\n만들고 있어요"
        label.configurePartTextFont(
            otherFontType: .custom(
                size: 26,
                kern: -0.3,
                lineHeight: 32,
                nameType: .boldHead),
            partText: carName)
    }
    
    // MARK: - Objc Functions
}
