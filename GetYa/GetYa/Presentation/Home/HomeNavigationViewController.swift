//
//  HomeNavigationViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/01.
//

import UIKit

final class HomeNavigationViewController: UINavigationController {

    // MARK: - UI Properties
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
    override var childForStatusBarHidden: UIViewController? {
        return topViewController
    }
    
    // MARK: - Functions
}
