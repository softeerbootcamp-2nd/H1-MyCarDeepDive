//
//  EngineDetailContentVIew.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class EngineDetailContentView: UIView {
    enum Constants {
        enum ImageView {
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let height: CGFloat = .toScaledHeight(value: 120)
            static let width: CGFloat = .toScaledWidth(value: 180)
        }
        enum DescriptionLabel {
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
        }
        enum LineView {
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 1)
        }
        enum MaximumPowerView {
            static let topMargin: CGFloat = .toScaledHeight(value: 16)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 22)
        }
        enum MaximumTorqueView {
            static let topMargin: CGFloat = .toScaledHeight(value: 4)
            static let leadingMargin: CGFloat = .toScaledWidth(value: 16)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 22)
        }
    }
    
    // MARK: - UI properties
    private let imageView: UIImageView = UIImageView(image: UIImage(named: "Engine")).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = CGFloat(4).scaledHeight
        $0.clipsToBounds = true
    }
    private let descriptionLabel = CommonLabel(
        fontType: .regularBody4,
        color: .GetYaPalette.gray300,
        text: "고마력의 우수한 가속 성능을 확보하여, 넉넉하고 안정감 있는 주행이 가능합니다. 엔진의 진동이 적어 편안하고 조용한 드라이빙 감성을 제공합니다.")
    private let lineView: UIView = UIView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .GetYaPalette.gray700
    }
    private let maximumPowerView = EnginePerformanceDescriptionView(
        titleText: "최고 출력",
        descriptionText: "45.0/1,750~2,750kgf-m/rpm")
    private let maximumTorqueView = EnginePerformanceDescriptionView(
        titleText: "최대 토크",
        descriptionText: "202/3,800PS/rpm")
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
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
    
    // MARK: - Private Functions
    private func setupViews() {
        addSubviews([
            imageView,
            descriptionLabel,
            lineView,
            maximumPowerView,
            maximumTorqueView
        ])
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configureImageView()
        configureDescriptionLabel()
        configureLineView()
        configureMaximumPowerView()
        configureMaximumTorqueView()
    }
    
    private func configureImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.ImageView.topMargin),
            imageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.ImageView.leadingMargin),
            imageView.widthAnchor.constraint(
                equalToConstant: Constants.ImageView.width),
            imageView.heightAnchor.constraint(
                equalToConstant: Constants.ImageView.height)
        ])
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Constants.DescriptionLabel.topMargin),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.DescriptionLabel.leadingMargin),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.DescriptionLabel.trailingMargin)
        ])
    }
    
    private func configureLineView() {
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Constants.LineView.topMargin),
            lineView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.LineView.leadingMargin),
            lineView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.LineView.trailingMargin),
            lineView.heightAnchor.constraint(
                equalToConstant: Constants.LineView.height)
        ])
    }
    
    private func configureMaximumPowerView() {
        NSLayoutConstraint.activate([
            maximumPowerView.topAnchor.constraint(
                equalTo: lineView.bottomAnchor,
                constant: Constants.MaximumPowerView.topMargin),
            maximumPowerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.MaximumPowerView.leadingMargin),
            maximumPowerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.MaximumPowerView.trailingMargin),
            maximumPowerView.heightAnchor.constraint(
                equalToConstant: Constants.MaximumPowerView.height)
        ])
    }
    
    private func configureMaximumTorqueView() {
        NSLayoutConstraint.activate([
            maximumTorqueView.topAnchor.constraint(
                equalTo: maximumPowerView.bottomAnchor,
                constant: Constants.MaximumTorqueView.topMargin),
            maximumTorqueView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.MaximumTorqueView.leadingMargin),
            maximumTorqueView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.MaximumTorqueView.trailingMargin),
            maximumTorqueView.heightAnchor.constraint(
                equalToConstant: Constants.MaximumTorqueView.height)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
}
