//
//  CharacterSelectSuccessViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class CharacterSelectSuccessViewController: UIViewController {
    private enum Constants {
        enum BottomCustomOrQuoteView {
            static let height: CGFloat = CustomOrQuoteSelectView
                .Constants.intrinsicContentHeight
        }
    }
    
    // MARK: - UI Properties
    private let tableView: UITableView = UITableView(frame: .zero, style: .grouped).set {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(
            CharacterSelectSuccessMainHeader.self,
            forHeaderFooterViewReuseIdentifier: CharacterSelectSuccessMainHeader.id)
        $0.register(
            CharacterSelectSuccessTableViewCell.self,
            forCellReuseIdentifier: CharacterSelectSuccessTableViewCell.id)
        $0.register(
            CharacterSelectSuccesSecondSectionHeader.self,
            forHeaderFooterViewReuseIdentifier: CharacterSelectSuccesSecondSectionHeader.id)
        $0.register(
            CharacterSelectSuccessFooter.self,
            forHeaderFooterViewReuseIdentifier: CharacterSelectSuccessFooter.id)
        $0.separatorStyle = .none
        $0.estimatedSectionHeaderHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.estimatedSectionFooterHeight = UITableView.automaticDimension
    }
    
    private let bottomCustomOrQuoteView = CustomOrQuoteSelectView()
    
    // MARK: - Properties
    private var adapter: CharacterSelectSuccessTableViewAdapter!
    private var viewModel: (any CharacterSelectSuccessViewModelable & CharacterSSTableViewAdapterDataSource)!
    
    // MARK: - Lifecycles
    init(viewModel: some CharacterSelectSuccessViewModelable & CharacterSSTableViewAdapterDataSource) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel = CharacterSelectSuccessViewModel()
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
    }
}

// MARK: - LayoutSupportable
extension CharacterSelectSuccessViewController: LayoutSupportable {
    func configureConstraints() {
        _=tableView.set {
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        }
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
