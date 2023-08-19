//
//  OptionSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit

class OptionSelectViewController: UIViewController {
    enum Constants {
        enum SegmentedControl {
            static let height: CGFloat = .toScaledHeight(value: 52)
        }
    }
    
    // MARK: - UI properties
    private lazy var segmentedControl = OptionSelectSegmentedControl(items: ["추가 옵션", "기본 포함 옵션"]).set {
        $0.addTarget(self, action: #selector(changeSegmentedValue), for: .valueChanged)
    }
    
    // MARK: - Properties
    private var currentSegmentedIndex: Int = 0 {
        didSet {
            print(currentSegmentedIndex)
        }
    }
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureUI()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        configureSegmentedControl()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        view.addSubviews([
            segmentedControl
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
    }
    
    private func configureSegmentedControl() {
        let safeLayoutFrame = view.safeAreaLayoutGuide.layoutFrame
        segmentedControl.frame = CGRect(
            x: safeLayoutFrame.minX,
            y: safeLayoutFrame.minY,
            width: safeLayoutFrame.width,
            height: Constants.SegmentedControl.height)
        segmentedControl.configureBottomBorder()
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
    @objc private func changeSegmentedValue(sender: UISegmentedControl) {
        currentSegmentedIndex = sender.selectedSegmentIndex
    }

}
