//
//  Requestable.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/19.
//

import Foundation

protocol Requestable {
    var scheme: String { get }
    var host: String { get }
    var method: HTTPMethod { get }
    var prefixPath: String { get }
    var path: String { get }
    var queryParams: Encodable? { get }
    var bodyParams: Encodable? { get }
}
