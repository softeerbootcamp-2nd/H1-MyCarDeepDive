//
//  QuotationFinishViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/17.
//

import UIKit

final class QuotationFinishViewController: BaseViewController {
    // MARK: - Lifecycles
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
