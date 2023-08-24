//
//  OptionInfoDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/22.
//

struct OptionInfoDTO: Codable {
    let optionID: Int?
    let optionName: String
    let optionImageURL: String
    let optionPrice: Int
    let optionComment: String?
    
    enum CodingKeys: String, CodingKey {
        case optionID = "option_id"
        case optionName = "option_name"
        case optionImageURL = "option_img_url"
        case optionPrice = "option_price"
        case optionComment = "option_comment"
    }
    
    init(optionInfo: OptionInfo) {
        self.optionID = optionInfo.optionID
        self.optionName = optionInfo.optionName
        self.optionImageURL = optionInfo.optionImageURL
        self.optionPrice = optionInfo.optionPrice
        self.optionComment = optionInfo.optionComment
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.optionID = try? container.decode(Int.self, forKey: .optionID)
        self.optionName = try container.decode(String.self, forKey: .optionName)
        self.optionImageURL = try container.decode(String.self, forKey: .optionImageURL)
        self.optionPrice = try container.decode(Int.self, forKey: .optionPrice)
        self.optionComment = try? container.decode(String.self, forKey: .optionComment)
    }
    
    func toDomain() -> OptionInfo {
        return OptionInfo(
            optionID: optionID,
            optionName: optionName,
            optionImageURL: optionImageURL,
            optionPrice: optionPrice,
            optionComment: optionComment)
    }
}
