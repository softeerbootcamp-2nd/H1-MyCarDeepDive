//
//  EitherSideSlider.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import UIKit
import Combine

final class EitherSideSlider: UISlider {
    enum Constants {
        static let trackHeight: CGFloat = .toScaledHeight(value: 8)
        static let thumbHeight: CGFloat = .toScaledHeight(value: 24)
        static let halfThumbHeight: CGFloat = thumbHeight/2
    }
    
    // MARK: - UI properties
    private lazy var thumbView = UIView(frame: .zero).set {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.GetYaPalette.gray500.cgColor
        $0.layer.cornerRadius = Constants.halfThumbHeight
    }
    
    private lazy var thumbImageView = UIImageView(image: thumbImage).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var thumbImage: UIImage {
        thumbView.frame = CGRect(
            x: 0,
            y: Constants.halfThumbHeight,
            width: Constants.thumbHeight,
            height: Constants.thumbHeight)
        return UIGraphicsImageRenderer(bounds: thumbView.bounds).image { graphicsRenderContext in
            thumbView.layer.render(in: graphicsRenderContext.cgContext)
        }
    }

    // MARK: - Properties
    private var priceUnit: Float = 300
    var valueChanged: AnyPublisher<Int, Never> {
        publisher(for: .valueChanged)
            .receive(on: DispatchQueue.main)
            .filter { [weak self] _ in
                guard let self else { return false }
                guard value < minimumValue + priceUnit else { return true }
                setValue(minimumValue + priceUnit, animated: false)
                return false
            }.compactMap { [weak self] _ in
                guard let self else { return nil }
                let calculatedValue = round((minimumValue - value)/priceUnit)*priceUnit
                let choicedPrice: Int = Int(abs(calculatedValue)) + Int(minimumValue)
                return choicedPrice >= Int(maximumValue) ? Int(maximumValue) : choicedPrice
            }
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure(minValue: 4200, maxValue: 6900)
        configureUI()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure(minValue: 4200, maxValue: 6900)
        configureUI()
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.trackRect(forBounds: bounds)
        rect.size.height = Constants.trackHeight
        return rect
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        setThumbImage(thumbImage, for: .normal)
        minimumTrackTintColor = .GetYaPalette.acriveBlue
        setupUI()
    }

    // MARK: - Functions
    func configure(minValue: Float, maxValue: Float) {
        minimumValue = minValue
        maximumValue = maxValue
        setValue(minValue + priceUnit, animated: false)
    }
    
    func configure(priceUnit: Float) {
        self.priceUnit = priceUnit
    }
}

// MARK: - LayoutSupportable
extension EitherSideSlider: LayoutSupportable {
    func setupViews() {
        addSubview(thumbImageView)
    }
    
    func setupConstriants() {
        configureThumbImageView()
    }
    
    private func configureThumbImageView() {
        NSLayoutConstraint.activate([
            thumbImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: trackRect(forBounds: bounds).midY),
            thumbImageView.widthAnchor.constraint(equalToConstant: Constants.thumbHeight)
        ])
    }
}
