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
    
    // TODO: - Font 바꾸기
    private let customButton = CommonButton(
        font: .systemFont(
            ofSize: CGFloat.scaledWidth(value: 16),
            weight: UIFont.Weight(500)
        ),
        wideButtonBackgroundColorType: .black,
        title: "직접 만들래요"
    )
    
    // TODO: - Font 바꾸기
    private let recomandButton = CommonButton(
        font: .systemFont(
            ofSize: CGFloat.scaledWidth(value: 16),
            weight: UIFont.Weight(500)
        ),
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
    var player: AVQueuePlayer!
    weak var delegate: HomeContentDelegate!
    
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
        configureCustomWideButton()
        configureTitleLabel()
        configureAVPlayerLayer()
    }
    
    private func configureCustomWideButton() {
        NSLayoutConstraint.activate([
            customButton.bottomAnchor.constraint(
                equalTo: recomandButton.topAnchor,
                constant: -CGFloat.scaledHeight(value: 8)
            ),
            customButton.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: CGFloat.scaledWidth(value: 17)
            ),
            customButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -CGFloat.scaledWidth(value: 17)
            ),
            customButton.heightAnchor.constraint(equalToConstant: CGFloat.scaledHeight(value: 52))
        ])
    }
    
    private func configureRecomandWideButton() {
        NSLayoutConstraint.activate([
            recomandButton.bottomAnchor.constraint(
                equalTo: self.bottomAnchor
            ),
            recomandButton.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: CGFloat.scaledWidth(value: 17)
            ),
            recomandButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -CGFloat.scaledWidth(value: 17)
            ),
            recomandButton.heightAnchor.constraint(equalToConstant: CGFloat.scaledHeight(value: 52))
        ])
    }
    
    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: 17
            ),
            titleLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor,
                constant: 42
            )
        ])
    }
    
    private func configureAVPlayerLayer() {
        let centerX = self.bounds.maxX / 2
        let centerY = self.bounds.maxY / 2
        
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
    
    @objc func touchUpRecomandButton(sender: UIButton) {
        player.pause()
        delegate.touchUpRecomandButton()
    }
    
    @objc func touchUpCustomButton(sender: UIButton) {
        player.pause()
        delegate.touchUpCustomButton()
    }
}
