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
            self?.touchAnimation(target: self?.leftButton) {
                self?.delegate?.didTapLeftButton()
            }
        }.store(in: &subscriptions)
        
        rightButton.tap.sink { [weak self] in
            self?.touchAnimation(target: self?.rightButton) {
                self?.delegate?.didTapRightButton()
            }
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
    
    /// 왼쪽버튼과 오른쪽 버튼사이 간격 설정하기!!
    func setSpacing(_ spacing: CGFloat) {
        self.spacing = spacing
    }
    
    func touchAnimation(target: UIButton?, completionHandler: @escaping () -> Void) {
        UIView.animate(
            withDuration: 0.07,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                target?.alpha = 0.777
            }, completion: { _ in
                completionHandler()
                UIView.animate(withDuration: 0.12, animations: { target?.alpha = 1 })
            })
    }
}
