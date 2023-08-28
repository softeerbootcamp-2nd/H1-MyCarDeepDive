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
        viewModel = DefaultQuotationPreviewViewModel(dataSource: [])
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
        bottomCustomOrQuoteView.delegate = self
        setupUI()
    }
}

// MARK: - CustomOrQuoteSelectViewDelegate
extension DefaultQuotationPreviewViewController: CustomOrQuoteSelectViewDelegate {
    func gotoCustomPage() {
        // TODO: 3-1화면으로 이동해야합니다. (추천 트림, 색상, 옵션 선택된 상태로)
    }
    
    func gotoQuotePage() {
        navigationController?.pushViewController(
            LoadingViewController(
                viewModel: LoadingViewModel(
                    contrationQuotation: ContractionQuotation(
                        carSpecID: 1,
                        trimID: 1,
                        exteriorColorID: 1,
                        interiorColorID: 1,
                        additionalOptionIDList: []),
                    useCase: DefaultLoadingUseCase(
                        repository: DefaultLoadingRepository(
                            provider: SessionProvider())))),
            animated: true)
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
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    private func configureBottomCustomOrQuoteView() {
        NSLayoutConstraint.activate([
            bottomCustomOrQuoteView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomCustomOrQuoteView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomCustomOrQuoteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomCustomOrQuoteView.heightAnchor.constraint(equalToConstant: Constants.BottomCustomOrQuoteView.height),
            bottomCustomOrQuoteView.topAnchor.constraint(
                equalTo: tableView.bottomAnchor,
                constant: -CustomOrQuoteSelectView.Constants.gradientLayerHeight)])
    }
}
