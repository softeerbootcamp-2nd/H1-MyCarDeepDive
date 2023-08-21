//
//  BaseEndpoint.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/19.
//

final class Endpoint: Requestable {
    var scheme: String
    var host: String
    var method: HTTPMethod
    var prefixPath: String
    var headers: [String: String]?
    
    init(
        scheme: String = "http://",
        host: String = "api.make-my-car.shop",
        method: HTTPMethod = .get,
        prefixPath: String = "/api/v1/",
        headers: [String: String]? = ["Content-Type": "application/json"]
    ) {
        self.scheme = scheme
        self.host = host
        self.method = method
        self.prefixPath = prefixPath
        self.headers = headers
    }
}


