//
//  HomeViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/01.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {

    // MARK: - UI Properties
    private let customWideButton = CommonWideButton(
        wideButtonBackgroundColorType: .black,
        title: "직접 만들래요"
    )
    
    private let recomandWideButton = CommonWideButton(
        wideButtonBackgroundColorType: .white,
        title: "추천받기"
    )
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        let text = "당신의 라이프스타일에 맞게\n차량을 추천해드려요."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = .systemFont(ofSize: CGFloat.scaledWidth(value: 20), weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        let attributeString = NSMutableAttributedString(string: text)
        let otherFont = UIFont.systemFont(
            ofSize: CGFloat.scaledWidth(value: 20),
            weight: UIFont.Weight(500)
        )
        attributeString.addAttribute(
            .font,
            value: otherFont,
            range: (text as NSString).range(of: "라이프스타일")
        )
        label.attributedText = attributeString
        label.sizeToFit()
        
        return label
    }()
    
    // MARK: - Properties
    var videoLooper: AVPlayerLooper!
    var playerLayer: AVPlayerLayer!
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Functions
    private func setupViews() {
        setupAVPlayerLayer()
        [
            customWideButton,
            recomandWideButton,
            titleLabel
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupAVPlayerLayer() {
        guard let path = Bundle.main.url(forResource: "Home_mp4", withExtension: "mp4") else {
            return
        }
        let asset = AVAsset(url: path)
        let item = AVPlayerItem(asset: asset)
        let player = AVQueuePlayer(playerItem: item)
        playerLayer = AVPlayerLayer(player: player)
        videoLooper = AVPlayerLooper(player: player, templateItem: item)
        view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        configureNavigationBar()
        configureRecomandWideButton()
        configureCustomWideButton()
        configureTitleLabel()
        configureAVPlayerLayer()
    }
    
    private func configureNavigationBar() {
        let image = UIImage(named: "Logo")
        self.navigationItem.titleView = UIImageView(image: image)
    }
    
    private func configureCustomWideButton() {
        NSLayoutConstraint.activate([
            customWideButton.bottomAnchor.constraint(
                equalTo: recomandWideButton.topAnchor,
                constant: -CGFloat.scaledHeight(value: 8)
            ),
            customWideButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: CGFloat.scaledWidth(value: 17)
            ),
            customWideButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -CGFloat.scaledWidth(value: 17)
            ),
            customWideButton.heightAnchor.constraint(equalToConstant: CGFloat.scaledHeight(value: 52))
        ])
    }
    
    private func configureRecomandWideButton() {
        NSLayoutConstraint.activate([
            recomandWideButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            recomandWideButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: CGFloat.scaledWidth(value: 17)
            ),
            recomandWideButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -CGFloat.scaledWidth(value: 17)
            ),
            recomandWideButton.heightAnchor.constraint(equalToConstant: CGFloat.scaledHeight(value: 52))
        ])
    }
    
    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42)
        ])
    }
    
    private func configureAVPlayerLayer() {
        let centerX = view.safeAreaLayoutGuide.layoutFrame.maxX / 2
        let centerY = view.safeAreaLayoutGuide.layoutFrame.maxY / 2
        
        playerLayer.frame = CGRect(
            x: centerX - 242,
            y: centerY - 158,
            width: CGFloat.scaledWidth(value: 484),
            height: CGFloat.scaledHeight(value: 316)
        )
        
        let view = UIView(frame: playerLayer.bounds)
        
        let colors: [CGColor] = [
            UIColor.black.cgColor,
            UIColor.clear.cgColor
        ]
        let topGradientLayer = CAGradientLayer()
        topGradientLayer.colors = colors
        topGradientLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: CGFloat.scaledWidth(value: 484),
            height: CGFloat.scaledHeight(value: 85)
        )
        topGradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        topGradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        topGradientLayer.locations = [0.0, 1.0]
        
        let bottomGradientLayer = CAGradientLayer()
        bottomGradientLayer.colors = colors
        bottomGradientLayer.frame = CGRect(
            x: 0,
            y: view.bounds.height - CGFloat.scaledHeight(value: 85),
            width: CGFloat.scaledWidth(value: 484),
            height: CGFloat.scaledHeight(value: 85)
        )
        bottomGradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        bottomGradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        bottomGradientLayer.locations = [0.0, 1.0]
        
        view.layer.addSublayer(topGradientLayer)
        view.layer.addSublayer(bottomGradientLayer)
        
        playerLayer.addSublayer(view.layer)
    }
}
