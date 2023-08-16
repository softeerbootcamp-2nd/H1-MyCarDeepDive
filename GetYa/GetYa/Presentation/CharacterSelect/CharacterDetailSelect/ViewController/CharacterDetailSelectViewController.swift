//
//  CharacterDetailSelectViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import UIKit

final class CharacterDetailSelectViewController: BaseViewController {
    enum Constants {
        enum ProgressView {
            static let height = CGFloat(4).scaledHeight
            static let totalStep = 5
        }
    }
    
    // MARK: - UI properties
    private let progressView = ProgressView().set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.configureProgressTotalStep(with: Constants.ProgressView.totalStep)
    }
    let temp = BaseCharacterSelectPageViewController().set {
        $0.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Properties
    private var viewControllers: [BaseCharacterSelectPageViewController] = []
    
    // MARK: - Lifecycles
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureUI()
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        view.backgroundColor = .white
        configureSubviewUI(with: progressView, temp.view)
    }
    
    private func makePageViewControllers() -> [BaseCharacterSelectPageViewController] {
        return []
    }
    // MARK: - Functions
    // MARK: - Objc Functions
}

extension CharacterDetailSelectViewController: LayoutSupportable {
    func configureConstraints() {
        _=[progressViewConstraints, tempC].map { NSLayoutConstraint.activate($0) }
    }
    
    private var progressViewConstraints: [NSConstraint] {
        typealias Const = Constants.ProgressView
        return [
            progressView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            progressView.heightAnchor.constraint(
                equalToConstant: Const.height)]
    }
    
    private var tempC: [NSConstraint] {
        let tempView = temp.view!
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return [
            tempView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tempView.topAnchor.constraint(equalTo: progressView.bottomAnchor),
            tempView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tempView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)]
    }
}
