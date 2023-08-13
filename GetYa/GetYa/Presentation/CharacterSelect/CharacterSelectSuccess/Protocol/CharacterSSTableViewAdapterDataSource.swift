//
//  CharacterSSTableViewAdapterDataSource.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/08.
//

protocol CharacterSSTableViewAdapterDataSource: AnyObject {
    var mainSectionHeaderItem: MainSectionHeaderModel { get }
    var secondSectionHeaderItem: String { get }
    var secondSectionFooterItem: String { get }
}
