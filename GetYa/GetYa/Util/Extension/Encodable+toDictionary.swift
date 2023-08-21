//
//  Encodable+toDictionary.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/19.
//

import Foundation
import OSLog

extension Encodable {
    var toDictionary: [String: Any]? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            return try JSONSerialization
                .jsonObject(
                    with: jsonData,
                    options: []
                ) as? [String: Any]
        } catch {
            os_log("Failed to convert encodable json data as [String: Any]", type: .error)
            return nil
        }
    }
}
