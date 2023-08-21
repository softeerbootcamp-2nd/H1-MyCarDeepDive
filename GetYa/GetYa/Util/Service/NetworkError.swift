//
//  NetworkError.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/19.
//

import Foundation

enum NetworkError: Swift.Error {
    /// Base Url 만들 때 
    case components
    case unknown
    case urlRequest(Error)
    case timeout
    case emptyBytes
    case failedDecode
}
