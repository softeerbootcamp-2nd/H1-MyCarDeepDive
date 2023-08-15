//
//  BaseCharacterSelectViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import UIKit

class BaseCharacterSelectPageViewController: UIViewController {
    enum Constraints {
        enum QuestionIndexView {
            static let topMargin: CGFloat = .toScaledHeight(value: 24)
            static let trailingMargin: CGFloat = .toScaledWidth(value: -16)
            static let height: CGFloat = .toScaledHeight(value: 40)
            static let width: CGFloat = .toScaledWidth(value: 65)
        }
    }
    // MARK: - UI properties
    private let questionIndexView = QuestionNumberView()
    
    // MARK: - Properties
    // MARK: - Lifecycles
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: - Private Functions
    // MARK: - Functions
    // MARK: - Objc Functions
}

extension BaseCharacterSelectPageViewController: LayoutSupportable {
    func configureConstraints() {
        _=[questionIndexViewConstraints].map { NSLayoutConstraint.activate($0) }
    }
    
    private var questionIndexViewConstraints: [NSConstraint] {
        typealias Const = Constraints.QuestionIndexView
        return [
            questionIndexView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Const.trailingMargin),
            questionIndexView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Const.topMargin),
            questionIndexView.widthAnchor.constraint(
                equalToConstant: Const.width),
            questionIndexView.heightAnchor.constraint(
                equalToConstant: Const.height)]
    }
}
