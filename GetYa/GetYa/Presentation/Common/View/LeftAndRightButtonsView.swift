//
//  LeftAndRightButtonsView.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/11.
//

import UIKit
import Combine

protocol LeftAndRightButtonsViewDelegate: AnyObject {
    func didTapLeftButton()
    func didTapRightButton()
}

class LeftAndRightButtonsView: UIStackView {
    struct ButtonAppearance {
        var text: String?
        let fontType: GetYaFont
        let backgroundColor: UIColor
        let borderColor: UIColor
        let textColor: UIColor
    }
    
    // MARK: - UI Properties
    private let leftButton = CommonButton(frame: .zero)
    private let rightButton = CommonButton(frame: .zero)
    
    // MARK: - Properties
    weak var delegate: LeftAndRightButtonsViewDelegate?
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        bind()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        bind()
    }
    
    deinit {
        _=subscriptions.map { $0.cancel() }
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        let leftBtnAppearance = ButtonAppearance(
            text: "이전",
            fontType: .mediumBody3,
            backgroundColor: .white,
            borderColor: .GetYaPalette.gray600,
            textColor: .black)
        let rightBtnAppearacne = ButtonAppearance(
            text: "다음",
            fontType: .mediumBody3,
            backgroundColor: .GetYaPalette.acriveBlue,
            borderColor: .clear,
            textColor: .white)
        
        configureLeftButton(with: leftBtnAppearance)
        configureRightButton(with: rightBtnAppearacne)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillEqually
        spacing = 6
        _ = [leftButton, rightButton].map { addArrangedSubview($0) }
    }
    
    private func bind() {
        leftButton.tap.sink { [weak self] in
            self?.delegate?.didTapLeftButton()
        }.store(in: &subscriptions)
        
        rightButton.tap.sink { [weak self] in
            self?.delegate?.didTapRightButton()
        }.store(in: &subscriptions)
    }
    
    // MARK: - Functions
    func configureLeftButton(with: ButtonAppearance) {
        _=leftButton.set {
            if with.text != nil {
                $0.setTitle(with.text, for: .normal)
            }
            $0.configureDetail(
                font: with.fontType.uiFont,
                buttonBackgroundColorType: .custom(
                    textColor: with.textColor,
                    layerBorderColor: with.borderColor,
                    color: with.backgroundColor))
        }
    }
    
    func configureRightButton(with: ButtonAppearance) {
        _=rightButton.set {
            if with.text != nil {
                $0.setTitle(with.text, for: .normal)
            }
            $0.configureDetail(
                font: with.fontType.uiFont,
                buttonBackgroundColorType: .custom(
                    textColor: with.textColor,
                    layerBorderColor: with.borderColor,
                    color: with.backgroundColor))
        }
    }
}
