//
//  RotationView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class RotationView: SettingSelectTitleBackgroundVIew {
    enum Constants {
        enum Oval {
            static let xPostion: CGFloat = .toScaledWidth(value: 26)
            static let height: CGFloat = .toScaledHeight(value: 52)
            static let bottomMargin: CGFloat = .toScaledHeight(value: 12)
        }
    }
    
    enum ColorType: String {
        case white
        case gray
        case silver
        case blue
        case brown
        case abyss
    }
    
    // MARK: - UI properties
    private lazy var imageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Properties
    private var imageNumber = 1
    private var previousImageNumber = 1
    private var type: ColorType = .white
    
    // MARK: - Lifecycles
    init(type: ColorType) {
        super.init(frame: .zero)
        
        self.type = type
        setupViews()
        configureUI()
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
    
    override func draw(_ rect: CGRect) {
        createOvalLine()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            imageView
        ])
        
        setPanGesture()
    }
    
    private func configureUI() {
        configureImageView()
    }
    
    private func setPanGesture() {
        let panGesture = UIPanGestureRecognizer(
            target: self,
            action: #selector(panAction))
        self.addGestureRecognizer(panGesture)
    }
    
    private func configureImageView() {
        imageView.image = UIImage(named: "\(type.rawValue)_1")
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createOvalLine() {
        let path = UIBezierPath(ovalIn: CGRect(
            x: Constants.Oval.xPostion,
            y: frame.height - (Constants.Oval.bottomMargin + Constants.Oval.height),
            width: frame.width - Constants.Oval.xPostion * 2,
            height: Constants.Oval.height))
        path.lineWidth = 2
        UIColor.white.set()
        path.stroke()
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
    @objc private func panAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        let progress = translation.x / self.bounds.width

        switch sender.state {
        case .changed:
            let rotationAngle = 2 * .pi * progress
            imageNumber = previousImageNumber - Int(round(rotationAngle / (2 * .pi / 60)))

            imageNumber %= 61

            if imageNumber <= 0 {
                imageNumber += 60
            }
            imageView.image = UIImage(named: "\(type.rawValue)_\(imageNumber)")
        case .ended:
            previousImageNumber = imageNumber
        default:
            break
        }
    }
}
