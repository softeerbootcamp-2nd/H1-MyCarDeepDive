//
//  HomeContentView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit
import AVKit

// TODO: 백그라운드로 나갔다오면 video가 재생안됨. 멈춰있음

protocol HomeContentDelegate: AnyObject {
    func touchUpRecomandButton()
    func touchUpCustomButton()
}

class HomeContentView: UIView {
    enum Constants {
        enum CustomButton {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 17)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -17)
            static let bottomMargin: CGFloat = .toScaledHeight(value: -8)
            static let height: CGFloat = .toScaledHeight(value: 52)
        }
        enum RecommendButton {
            static let leadingMargin: CGFloat = .toScaledWidth(value: 17)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -17)
            static let height: CGFloat = .toScaledHeight(value: 52)
        }
        enum PlayerLayer {
            static let height: CGFloat = .toScaledHeight(value: 316)
            static let width: CGFloat = .toScaledWidth(value: 484)
        }
        enum GradientLayer {
            static let height: CGFloat = .toScaledHeight(value: 85)
            static let width: CGFloat = .toScaledWidth(value: 484)
        }
    }
    
    // MARK: - UI Properties
    private let customButton = CommonButton(
        font: UIFont(hyundaiSans: .mediumBody3) ?? .systemFont(ofSize: 16),
        buttonBackgroundColorType: .black).set {
            $0.setTitle("직접 만들래요", for: .normal)
        }
    
    private let recomandButton = CommonButton(
        font: UIFont(hyundaiSans: .mediumBody3) ?? .systemFont(ofSize: 16),
        buttonBackgroundColorType: .white).set {
            $0.setTitle("추천받기", for: .normal)
        }
    
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
        typealias Const = Constants.CustomButton
        
        NSLayoutConstraint.activate([
            customButton.bottomAnchor.constraint(
                equalTo: recomandButton.topAnchor,
                constant: Const.bottomMargin),
            customButton.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Const.leadingMargin),
            customButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: Const.trailingMargin),
            customButton.heightAnchor.constraint(equalToConstant: Const.height)
        ])
    }
    
    private func configureRecomandWideButton() {
        typealias Const = Constants.RecommendButton
        
        NSLayoutConstraint.activate([
            recomandButton.bottomAnchor.constraint(
                equalTo: self.bottomAnchor),
            recomandButton.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Const.leadingMargin),
            recomandButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: Const.trailingMargin),
            recomandButton.heightAnchor.constraint(equalToConstant: Const.height)
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
        typealias PlayerLayerConst = Constants.PlayerLayer
        typealias GradientLayerConst = Constants.GradientLayer
        
        let centerX = self.bounds.maxX / 2
        let centerY = self.bounds.maxY / 2
        
        playerLayer.frame = CGRect(
            x: centerX - PlayerLayerConst.width / 2,
            y: centerY - PlayerLayerConst.height / 2,
            width: PlayerLayerConst.width,
            height: PlayerLayerConst.height)
        
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
            width: GradientLayerConst.width,
            height: GradientLayerConst.height)
        topGradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        topGradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        topGradientLayer.locations = [0.0, 1.0]
        
        let bottomGradientLayer = CAGradientLayer()
        bottomGradientLayer.colors = colors
        bottomGradientLayer.frame = CGRect(
            x: 0,
            y: view.bounds.height - GradientLayerConst.height,
            width: GradientLayerConst.width,
            height: GradientLayerConst.height)
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
