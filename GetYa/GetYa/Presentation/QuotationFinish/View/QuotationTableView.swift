//
//  QuotationTableView.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/19.
//

import UIKit

class QuotationTableView: UITableView {
    enum Constants {
        static let headerHeight: CGFloat = .toScaledHeight(value: 42)
        static let cellHeight: CGFloat = .toScaledHeight(value: 72)
    }
    
    // MARK: - UI properties
    
    // MARK: - Properties
    private var colorImageURLArray: [String] = []
    private var colorNames: [String] = []
    private var colorPrices: [Int] = []
    private var optionList: [OptionInfo] = []
    
    // MARK: - Lifecycles
    convenience init() {
        self.init(frame: .zero, style: .plain)
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureUI()
    }
    
    // MARK: - Private Functions
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        dataSource = self
        isScrollEnabled = false
        separatorStyle = .none
        backgroundColor = .GetYaPalette.gray700
        sectionHeaderTopPadding = 1
        contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
        register(
            QuotationFinishTableCell.self,
            forCellReuseIdentifier: QuotationFinishTableCell.identifier)
        register(
            CommonTableHeaderView.self,
            forHeaderFooterViewReuseIdentifier: CommonTableHeaderView.identifier)
    }
    
    // MARK: - Functions
    func setData(
        colorNames: [String],
        colorImageURLArray: [String],
        colorPrices: [Int],
        optionList: [OptionInfo]
    ) {
        self.colorNames = colorNames
        self.colorImageURLArray = colorImageURLArray
        self.colorPrices = colorPrices
        self.optionList = optionList
        self.reloadData()
    }
    
    // MARK: - Objc Functions
}

// MARK: - UITableViewDelegate
extension QuotationTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: CommonTableHeaderView.identifier
        ) as? CommonTableHeaderView else {
            return UITableViewHeaderFooterView()
        }
        
        if section == 0 {
            header.setLabel(text: "색상")
        } else {
            header.setLabel(text: "옵션")
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as? UITableViewHeaderFooterView)?.contentView.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
}

// MARK: - UITableViewDatasource
extension QuotationTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return colorNames.count
        } else {
            return optionList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: QuotationFinishTableCell.identifier,
            for: indexPath) as? QuotationFinishTableCell else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            cell.setOption(
                imageURL: colorImageURLArray[indexPath.row],
                name: colorNames[indexPath.row],
                price: colorPrices[indexPath.row])
        } else {
            cell.setOption(
                imageURL: optionList[indexPath.row].optionImageURL,
                name: optionList[indexPath.row].optionName,
                price: optionList[indexPath.row].optionPrice)
        }
        return cell
    }
}
