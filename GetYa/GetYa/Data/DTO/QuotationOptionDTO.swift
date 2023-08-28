//
//  OptionInfoDTO.swift
//  GetYa
//
//  Created by 양승현 on 2023/08/22.
//

struct QuotationOptionDTO: Codable {
    let optionID: Int?
    let optionName: String
    let optionImageURL: String
    let price: Int
    let comment: String?
    
    enum CodingKeys: String, CodingKey {
        case optionID = "option_id"
        case optionName = "option_name"
        case optionImageURL = "option_img_url"
        case price = "option_price"
        case comment = "option_comment"
    }
    
    init(optionInfo: QuotationOption) {
        self.optionID = optionInfo.optionID
        self.optionName = optionInfo.optionName
        self.optionImageURL = optionInfo.optionImageURL
        self.price = optionInfo.price
        self.comment = optionInfo.comment
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.optionID = try? container.decode(Int.self, forKey: .optionID)
        self.optionName = try container.decode(String.self, forKey: .optionName)
        self.optionImageURL = try container.decode(String.self, forKey: .optionImageURL)
        self.price = try container.decode(Int.self, forKey: .price)
        self.comment = try? container.decode(String.self, forKey: .comment)
    }
    
    func toDomain() -> QuotationOption {
        return QuotationOption(
            optionID: optionID,
            optionName: optionName,
            optionImageURL: optionImageURL,
            price: price,
            comment: comment)
    }
}
