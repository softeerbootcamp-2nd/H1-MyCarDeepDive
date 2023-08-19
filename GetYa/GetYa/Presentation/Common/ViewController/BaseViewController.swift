//
//  File.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/16.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - Lifecycles
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureNavigation()
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureNavigation()
    }
    
    // MARK: - Private Functions
    private func configureNavigation() {
        configureNavigationTitle()
        configureNavigationBarButton()
    }
    
    private func configureNavigationTitle() {
        let image = UIImage(named: "Black_Logo")
        self.navigationItem.title = ""
        self.navigationItem.titleView = UIImageView(image: image)
    }
    
    private func configureNavigationBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left")?.withTintColor(
                .GetYaPalette.gray0,
                renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(touchUpNavigationBackButton))
    }
    
    // MARK: - @Objc functions
    /// 만약 뒤로가기 버튼 눌렀을 경우 조건에 따라 이전 화면으로 가야하는 로직을 수행하지 않아야 할 경우
    /// 이 메서드를 오버라이딩해서 조건에 따라 super.touchUpNavigationBackButton() 호출을 하지 않으면 됩니다.
    @objc func touchUpNavigationBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
