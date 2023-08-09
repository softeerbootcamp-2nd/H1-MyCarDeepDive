//
//  CharacterSelectSuccessViewController.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/07.
//

import UIKit

final class CharacterSelectSuccessViewController: UIViewController {
    // MARK: - Properties
    private let tableView: UITableView = UITableView(frame: .zero).set {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(
            CharacterSelectSuccessMainHeader.self,
            forHeaderFooterViewReuseIdentifier: CharacterSelectSuccessMainHeader.id)
        $0.register(
            CharacterSelectSuccessTableViewCell.self,
            forCellReuseIdentifier: CharacterSelectSuccessTableViewCell.id)
        $0.rowHeight = 65
        $0.estimatedRowHeight = 50
    }
    
    private var adapter: CharacterSelectSuccessTableViewAdapter!
    
    private var viewModel: (any CharacterSelectSuccessViewModelable & CharacterSSTableViewAdapterDataSource)!
    
    // MARK: - Lifecycles
    init(viewModel: some CharacterSelectSuccessViewModelable & CharacterSSTableViewAdapterDataSource) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    // @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel = CharacterSelectSuccessViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviewUI(with: tableView)
        adapter = .init(
            tableView: tableView,
            dataSource: viewModel)
    }
}

// MARK: - LayoutSupportable
extension CharacterSelectSuccessViewController: LayoutSupportable {
    func configureConstraints() {
        _=tableView.set {
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                $0.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        }
    }
}
