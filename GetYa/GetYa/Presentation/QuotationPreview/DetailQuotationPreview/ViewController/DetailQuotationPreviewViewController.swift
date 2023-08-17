//
//  DetailQuotationPreviewViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class DetailQuotationPreviewViewController: BaseViewController {
    private enum Constants {
        enum BottomCustomOrQuoteView {
            static let height: CGFloat = CustomOrQuoteSelectView
                .Constants.intrinsicContentHeight
        }
    }
    
    // MARK: - UI Properties
    private let tableView = DetailQuotationPreviewTableView(frame: .zero, style: .grouped)
    private let bottomCustomOrQuoteView = CustomOrQuoteSelectView()
    
    // MARK: - Properties
    private var adapter: DetailQuotationPreviewTableViewAdapter!
    private var viewModel: (
        any DetailQuotationPreviewViewModelable
        & DetailQuotationPreviewAdapterDataSource
        & CommonQuotationPreviewAdapterDataSource)!
    
    // MARK: - Lifecycles
    init(
        viewModel: some DetailQuotationPreviewViewModelable
        & DetailQuotationPreviewAdapterDataSource
        & CommonQuotationPreviewAdapterDataSource
    ) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel = DetailQuotationPreviewViewModel()
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
extension DetailQuotationPreviewViewController: CustomOrQuoteSelectViewDelegate {
    func gotoCustomPage() {
        // TODO: 3-1화면으로 이동해야합니다. (추천 트림, 색상, 옵션 선택된 상태로)
    }
    
    func gotoQuotePage() {
        let finishViewController = QuotationFinishViewController(nibName: nil, bundle: nil)
        if let navigationController = navigationController,
           let firstViewController = navigationController.viewControllers.first {
            navigationController.pushViewController(finishViewController, animated: true)
            
            navigationController.viewControllers.removeAll(where: { targetViewController in
                return (targetViewController != firstViewController &&
                        targetViewController != finishViewController)
            })
        }
    }
}

// MARK: - LayoutSupportable
extension DetailQuotationPreviewViewController: LayoutSupportable {
    func setupViews() {
        view.addSubviews([
            tableView,
            bottomCustomOrQuoteView])
    }
    
    func setupConstriants() {
        configureTableView()
        configureBottomCustomOrQuoteView()
    }
    
    // MARK: - LayoutSupportable private helper
    private func configureTableView() {
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
