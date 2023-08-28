//
//  BaseEndpoint.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/19.
//

protocol NetworkInteractionable: Requestable, Responsable {}

final class Endpoint<ResponseModel>: NetworkInteractionable where ResponseModel: Decodable {
    typealias ResponseDTO = CommonDTO<ResponseModel>
    
    var scheme: String
    var host: String
    var method: HTTPMethod
    var prefixPath: String
    var responseType: ResponseType
    var queryParams: Encodable?
    var bodyParameters: Encodable?
    var headers: [String: String]?
    
    init(
        scheme: String = "https",
        host: String = "api.make-my-car.shop",
        method: HTTPMethod = .get,
        prefixPath: String = "/api/v1/",
        responseType: ResponseType,
        queryParams: Encodable? = nil,
        bodyParameters: Encodable? = nil,
        headers: [String: String]? = ["Content-Type": "application/json"]
    ) {
        self.scheme = scheme
        self.host = host
        self.method = method
        self.prefixPath = prefixPath
        self.responseType = responseType
        self.queryParams = queryParams
        self.bodyParameters = bodyParameters
        self.headers = headers
    }
}
