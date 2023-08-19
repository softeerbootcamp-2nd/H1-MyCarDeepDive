//
//  BaseEndpoint.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/19.
//

final class Endpoint<ResponseModel>: NetworkInteractionable where ResponseModel: Decodable {
    typealias ResponseDTO = ResponseModel
    
    var scheme: String
    var host: String
    var method: HTTPMethod
    var prefixPath: String
    var path: String
    var queryParams: Encodable?
    var bodyParams: Encodable?
    var headers: [String: String]?
    
    init(
        scheme: String = "http://",
        host: String,
        method: HTTPMethod,
        prefixPath: String = "/api/v1",
        path: String,
        queryParams: Encodable? = nil,
        bodyParams: Encodable? = nil,
        headers: [String: String]? = nil
    ) {
        self.scheme = scheme
        self.host = host
        self.method = method
        self.prefixPath = prefixPath
        self.path = path
        self.queryParams = queryParams
        self.bodyParams = bodyParams
        self.headers = headers
    }
}
