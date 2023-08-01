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
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        let attributeString = NSMutableAttributedString(string: text)
        let otherFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(500))
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
        let playerLayer = AVPlayerLayer(player: player)
        videoLooper = AVPlayerLooper(player: player, templateItem: item)
        
        playerLayer.frame = view.frame
        view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        configureNavigationBar()
        configureRecomandWideButton()
        configureCustomWideButton()
        configureTitleLabel()
    }
    
    private func configureNavigationBar() {
        let image = UIImage(named: "Logo")
        self.navigationItem.titleView = UIImageView(image: image)
    }
    
    private func configureCustomWideButton() {
        NSLayoutConstraint.activate([
            customWideButton.bottomAnchor.constraint(equalTo: recomandWideButton.topAnchor, constant: -8),
            customWideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            customWideButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            customWideButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureRecomandWideButton() {
        NSLayoutConstraint.activate([
            recomandWideButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recomandWideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            recomandWideButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            recomandWideButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42)
        ])
    }
}
