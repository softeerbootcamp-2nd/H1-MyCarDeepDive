//
//  HomeContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit
import AVKit

class HomeContentView: UIView {
    // MARK: - UI Properties
    
    private let customButton = CommonButton(
        font: UIFont(hyundaiSans: .mediumBody3) ?? .systemFont(ofSize: 16),
        buttonBackgroundColorType: .black,
        title: "직접 만들래요")
    
    private let recomandButton = CommonButton(
        font: UIFont(hyundaiSans: .mediumBody3) ?? .systemFont(ofSize: 16),
        buttonBackgroundColorType: .white,
        title: "추천받기")
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        let text = "당신의 라이프스타일에 맞게\n차량을 추천해드려요."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(hyundaiSans: .regularHead2)
        label.textColor = .white
        label.numberOfLines = 0
        let attributeString = NSMutableAttributedString(string: text)
        let otherFont = UIFont(hyundaiSans: .mediumHead2)
        attributeString.addAttribute(
            .font,
            value: otherFont ?? .systemFont(ofSize: 16),
            range: (text as NSString).range(of: "라이프스타일"))
        label.attributedText = attributeString
        label.sizeToFit()
        
        return label
    }()
    
    // MARK: - Properties
    var videoLooper: AVPlayerLooper!
    var playerLayer: AVPlayerLayer!
    var player: AVQueuePlayer!
    weak var delegate: HomeContentDelegate?
    private let customButtonLayoutCosntant = UILayout(
        leadingMargin: 17,
        trailingMargin: -17,
        bottomMargin: -8,
        height: 52)
    private let recomandButtonLayoutCosntant = UILayout(
        leadingMargin: 17,
        trailingMargin: -17,
        height: 52)
    private let playerLayerLayoutConstant = UILayout(
        height: 316,
        width: 484)
    private let gradientLayerLayoutConstant = UILayout(
        height: 85,
        width: 484)
    
    // MARK: - LifeCycles
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        configureUI()
    }
    
    // MARK: - Functions
    private func setupViews() {
        setupAVPlayerLayer()
        [
            customButton,
            recomandButton,
            titleLabel
        ].forEach {
            addSubview($0)
        }
        
        recomandButton.addTarget(self, action: #selector(touchUpRecomandButton), for: .touchUpInside)
        customButton.addTarget(self, action: #selector(touchUpCustomButton), for: .touchUpInside)
    }
    
    private func setupAVPlayerLayer() {
        guard let path = Bundle.main.url(forResource: "Home_mp4", withExtension: "mp4") else {
            return
        }
        let asset = AVAsset(url: path)
        let item = AVPlayerItem(asset: asset)
        player = AVQueuePlayer(playerItem: item)
        playerLayer = AVPlayerLayer(player: player)
        videoLooper = AVPlayerLooper(player: player, templateItem: item)
        layer.addSublayer(playerLayer)
        player.play()
    }
    
    private func configureUI() {
        configureRecomandWideButton()
        configureCustomButton()
        configureTitleLabel()
        configureAVPlayerLayer()
    }
    
    private func configureCustomButton() {
        NSLayoutConstraint.activate([
            customButton.bottomAnchor.constraint(
                equalTo: recomandButton.topAnchor,
                constant: customButtonLayoutCosntant.bottomMargin),
            customButton.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: customButtonLayoutCosntant.leadingMargin),
            customButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: customButtonLayoutCosntant.trailingMargin),
            customButton.heightAnchor.constraint(equalToConstant: customButtonLayoutCosntant.height)
        ])
    }
    
    private func configureRecomandWideButton() {
        NSLayoutConstraint.activate([
            recomandButton.bottomAnchor.constraint(
                equalTo: self.bottomAnchor),
            recomandButton.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: recomandButtonLayoutCosntant.leadingMargin),
            recomandButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: recomandButtonLayoutCosntant.trailingMargin),
            recomandButton.heightAnchor.constraint(equalToConstant: recomandButtonLayoutCosntant.height)
        ])
    }
    
    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: 17),
            titleLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor,
                constant: 42)
        ])
    }
    
    private func configureAVPlayerLayer() {
        let centerX = self.bounds.maxX / 2
        let centerY = self.bounds.maxY / 2
        
        playerLayer.frame = CGRect(
            x: centerX - playerLayerLayoutConstant.width / 2,
            y: centerY - playerLayerLayoutConstant.height / 2,
            width: playerLayerLayoutConstant.width,
            height: playerLayerLayoutConstant.height)
        
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
            width: gradientLayerLayoutConstant.width,
            height: gradientLayerLayoutConstant.height)
        topGradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        topGradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        topGradientLayer.locations = [0.0, 1.0]
        
        let bottomGradientLayer = CAGradientLayer()
        bottomGradientLayer.colors = colors
        bottomGradientLayer.frame = CGRect(
            x: 0,
            y: view.bounds.height - gradientLayerLayoutConstant.height,
            width: gradientLayerLayoutConstant.width,
            height: gradientLayerLayoutConstant.height)
        bottomGradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        bottomGradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        bottomGradientLayer.locations = [0.0, 1.0]
        
        view.layer.addSublayer(topGradientLayer)
        view.layer.addSublayer(bottomGradientLayer)
        
        playerLayer.addSublayer(view.layer)
    }
    
    @objc func touchUpRecomandButton(sender: UIButton) {
        player.pause()
        delegate?.touchUpRecomandButton()
    }
    
    @objc func touchUpCustomButton(sender: UIButton) {
        player.pause()
        delegate?.touchUpCustomButton()
    }
}
