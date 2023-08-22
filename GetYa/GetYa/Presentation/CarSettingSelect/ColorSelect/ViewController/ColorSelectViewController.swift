//
//  ColorSelectViewController.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/14.
//

import UIKit
import Combine

class ColorSelectViewController: UIViewController {
    // MARK: - UI properties
    private lazy var contentView = ColorSelectContentView()
    
    // MARK: - Properties
    private var viewModel: ColorSelectViewModel!
    private var cancellables = Set<AnyCancellable>()
    private let viewDidLoadEvent = PassthroughSubject<Void, Never>()
    
    // MARK: - Lifecycles
    init(viewModel: ColorSelectViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
        setupViews()
        configureUI()
        viewDidLoadEvent.send(())
    }
    
    // MARK: - Private Functions
    private func bind() {
        let input = ColorSelectViewModel.Input(
            viewDidLoadEvent: viewDidLoadEvent.eraseToAnyPublisher())
        
        let output = viewModel.transform(input: input)
        
        output.trimInquery
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                contentView.setData(
                    exteriorColor: $0.exteriorColor,
                    interiorColor: $0.interiorColor)
            })
            .store(in: &cancellables)
    }
    
    private func setupViews() {
        view.addSubview(contentView)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        configureContentView()
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    
    // MARK: - Objc Functions

}
