//
//  LoadingViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/17.
//

import UIKit
import Lottie

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
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureUI()
        
        // TODO: 여기서 네트워크 요청이 완료되면 화면 dismiss 하도록 하기 (Lottie가 제대로 없어지는지 확인 필요)
        lottieView.play()
        /// 임시적으로 3초뒤에 불러와진다고 가정
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let finishViewController = QuotationFinishViewController(nibName: nil, bundle: nil)
            if let navigationController = self.navigationController,
               let firstViewController = navigationController.viewControllers.first {
                navigationController.pushViewController(finishViewController, animated: true)
                self.lottieView.stop()
                navigationController.viewControllers.removeAll(where: { targetViewController in
                    return (targetViewController != firstViewController &&
                            targetViewController != finishViewController)
                })
            }
        }
    }
    
    // MARK: - Private Functions
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
