//
//  TrimSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/03.
//

import UIKit

class TrimSelectViewController: UIViewController {
    // MARK: - UI properties
    private let contentView = TrimSelectContentView()
    private lazy var bottomSheetView = BottomSheetView(frame: .zero).set {
        $0.delegate = self
    }
    private var bottomSheetViewHeightConstaint: NSLayoutConstraint!
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureUI()
    }
    
    // MARK: - Private Functions
    private func setupViews() {
        view.addSubviews([
            contentView,
            bottomSheetView
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureContentView()
        configureBottomSheetView()
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureBottomSheetView() {
        bottomSheetViewHeightConstaint = bottomSheetView.heightAnchor.constraint(
            equalToConstant: CGFloat(104).scaledHeight)
        NSLayoutConstraint.activate([
            bottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetViewHeightConstaint
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions
}

// MARK: - BottomSheetDelegate
extension TrimSelectViewController: BottomSheetDelegate {
    func contractedBottomSheet(completion: @escaping () -> Void) {
        bottomSheetViewHeightConstaint.isActive = false
        bottomSheetViewHeightConstaint = bottomSheetView.heightAnchor.constraint(
            equalToConstant: BottomSheetView.Constants.SmallContentView.height)
        bottomSheetViewHeightConstaint.isActive = true
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            guard let self else { return }
            view.layoutIfNeeded()
        }, completion: { _ in
            completion()
        })
    }
    
    func expandedBottomSheet(completion: @escaping () -> Void) {
        bottomSheetViewHeightConstaint.isActive = false
        bottomSheetViewHeightConstaint = bottomSheetView.heightAnchor.constraint(
            equalToConstant: BottomSheetView.Constants.LargeContentView.height)
        bottomSheetViewHeightConstaint.isActive = true
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            guard let self else { return }
            view.layoutIfNeeded()
        }, completion: { _ in
            completion()
        })
    }
}
