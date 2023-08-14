//
//  DetailRecommendCarResultViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class DetailRecommendCarResultViewController: UIViewController {
    private enum Constants {
        enum BottomCustomOrQuoteView {
            static let height: CGFloat = CustomOrQuoteSelectView
                .Constants.intrinsicContentHeight
        }
    }
    
    // MARK: - UI Properties
    private let tableView = DetailRecommendCarResultTableView(frame: .zero, style: .grouped)
    private let bottomCustomOrQuoteView = CustomOrQuoteSelectView()
    
    // MARK: - Properties
    private var adapter: DetailRecommendCarResultTableViewAdapter!
    private var viewModel: (
        any CharacterSelectSuccessViewModelable
        & DetailRecommendCarResultTableViewAdapterDataSource
        & CommonQuotationPreviewTableViewAdapterDataSource)!
    
    // MARK: - Lifecycles
    init(
        viewModel: some CharacterSelectSuccessViewModelable
        & DetailRecommendCarResultTableViewAdapterDataSource
        & CommonQuotationPreviewTableViewAdapterDataSource
    ) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel = DetailRecommendCarResultViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        adapter = .init(
            tableView: tableView,
            dataSource: viewModel)
        
    }
    
    // MARK: - Functions
    func configureUI() {
        view.backgroundColor = .white
        configureSubviewUI(
            with: tableView,
            bottomCustomOrQuoteView)
        configureNavigationBar()
    }
    
    // MARK: - Private functions
    private func configureNavigationBar() {
        let image = UIImage(named: "Black_Logo")
        self.navigationItem.title = ""
        self.navigationItem.titleView = UIImageView(image: image)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left")?.withTintColor(
                .GetYaPalette.gray0,
                renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(didTapNavigationBackButton))
    }
    
    // MARK: - @Objc functions
    @objc func didTapNavigationBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - LayoutSupportable
extension DetailRecommendCarResultViewController: LayoutSupportable {
    func configureConstraints() {
        configureTableViewConstriants()
        configureBottomCustomOrQuoteView()
    }
    
    // MARK: - LayoutSupportable private helper
    private func configureTableViewConstriants() {
        _=tableView.set {
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        }
    }
    
    private func configureBottomCustomOrQuoteView() {
        _=bottomCustomOrQuoteView.set {
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                $0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                $0.heightAnchor.constraint(equalToConstant: Constants.BottomCustomOrQuoteView.height),
                $0.topAnchor.constraint(
                    equalTo: tableView.bottomAnchor,
                    constant: -CustomOrQuoteSelectView.Constants.gradientLayerHeight)])
        }
    }
}
