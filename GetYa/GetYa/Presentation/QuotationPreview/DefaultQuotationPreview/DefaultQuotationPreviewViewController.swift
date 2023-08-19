//
//  DefaultQuotationPreviewViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/18.
//

import UIKit

final class DefaultQuotationPreviewViewController: BaseViewController {
    private enum Constants {
        enum BottomCustomOrQuoteView {
            static let height: CGFloat = CustomOrQuoteSelectView
                .Constants.intrinsicContentHeight
        }
    }
    
    // MARK: - UI Properties
    private let tableView = CommonQuotationPreviewTableView(frame: .zero, style: .grouped).set {
        $0.register(
            DefaultQuotationPreviewMainHeader.self,
            forHeaderFooterViewReuseIdentifier: DefaultQuotationPreviewMainHeader.identifier)
        $0.register(
            DetailQuotationPreviewSecionHeaderView.self,
            forHeaderFooterViewReuseIdentifier: DetailQuotationPreviewSecionHeaderView.identifier)
        $0.register(
            DetailQuotationPreviewFooterView.self,
            forHeaderFooterViewReuseIdentifier: DetailQuotationPreviewFooterView.identifier)
        $0.estimatedSectionHeaderHeight = UITableView.automaticDimension
        $0.estimatedSectionFooterHeight = UITableView.automaticDimension
    }
    private let bottomCustomOrQuoteView = CustomOrQuoteSelectView()
    
    // MARK: - Properties
    private var adapter: DefaultQuotationPreviewTableViewAdapter!
    private var viewModel: (
        any DefaultQuotationPreviewViewModelable
        & DefaultQuotationPreviewAdapterDataSource
        & CommonQuotationPreviewAdapterDataSource)!
    
    // MARK: - Lifecycles
    init(
        viewModel: some DefaultQuotationPreviewViewModelable
        & DefaultQuotationPreviewAdapterDataSource
        & CommonQuotationPreviewAdapterDataSource
    ) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel = DefaultQuotationPreviewViewModel()
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
        setupUI()
    }
}

// MARK: - LayoutSupportable
extension DefaultQuotationPreviewViewController: LayoutSupportable {
    func setupViews() {
        view.addSubviews([
            tableView,
            bottomCustomOrQuoteView])
    }
    
    func setupConstriants() {
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
