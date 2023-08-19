//
//  HTTPURLResponse+.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/20.
//

import Foundation

extension HTTPURLResponse {
    enum ResponseType {
        /// 1xx
        case ing
        
        case undefined
        
        /// 2xx
        case success
        
        /// 4xx
        case iOSError
        
        /// 5xx
        case serverError
    }
    
    var responseType: ResponseType {
        switch statusCode {
        case 100...199:
            return .ing
        case 200...299:
            return .success
        case 400...499:
            return .iOSError
        case 500...599:
            return .serverError
        default:
            return .undefined
        }
    }
}
