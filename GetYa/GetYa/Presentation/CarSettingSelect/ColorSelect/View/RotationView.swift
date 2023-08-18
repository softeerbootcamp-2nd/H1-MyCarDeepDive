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
        enum MarkView {
            static let height: CGFloat = .toScaledHeight(value: 56)
            static let width: CGFloat = .toScaledHeight(value: 56)
        }
        enum MarkImageView {
            static let height: CGFloat = .toScaledHeight(value: 32)
            static let width: CGFloat = .toScaledHeight(value: 32)
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
    private let imageView: UIImageView = UIImageView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let markView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black.withAlphaComponent(0.5)
    }
    private lazy var markImageView: UIImageView = UIImageView().set {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "RotationMark")
        $0.translatesAutoresizingMaskIntoConstraints = false
        markView.addSubview($0)
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
            imageView,
            markView
        ])
        
        setPanGesture()
    }
    
    private func configureUI() {
        configureImageView()
        configureMarkView()
        configureMarkImageView()
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
    
    private func configureMarkView() {
        markView.layer.cornerRadius = Constants.MarkView.height / 2
        NSLayoutConstraint.activate([
            markView.centerYAnchor.constraint(equalTo: centerYAnchor),
            markView.centerXAnchor.constraint(equalTo: centerXAnchor),
            markView.heightAnchor.constraint(
                equalToConstant: Constants.MarkView.height),
            markView.widthAnchor.constraint(
                equalToConstant: Constants.MarkView.width)
        ])
    }
    
    private func configureMarkImageView() {
        NSLayoutConstraint.activate([
            markImageView.centerYAnchor.constraint(equalTo: markView.centerYAnchor),
            markImageView.centerXAnchor.constraint(equalTo: markView.centerXAnchor),
            markImageView.heightAnchor.constraint(
                equalToConstant: Constants.MarkImageView.height),
            markImageView.widthAnchor.constraint(
                equalToConstant: Constants.MarkImageView.width)
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
        case .began:
            UIView.animate(withDuration: 0.3, animations: {
                self.markView.alpha = 0.0
            })
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
            UIView.animate(withDuration: 0.3, animations: {
                self.markView.alpha = 1.0
            })
        default:
            break
        }
    }
}
