//
//  TagDTO.swift
//  GetYa
//
//  Created by 배남석 on 2023/08/27.
//

import Foundation

struct TagDTO: Codable, Hashable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "tag_id"
        case name = "tag_name"
    }
    
    func toDomain() -> Tag {
        Tag(id: id, name: name)
    }
}
