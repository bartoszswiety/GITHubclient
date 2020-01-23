/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

*/

import Foundation


typealias GitStatsResponseArray = [GitStats]

struct GitStats: Codable {
    let author: GitUser?
    let total: Int
    let weeks: [GitWeeks]?

    enum CodingKeys: String, CodingKey {
        case author = "author"
        case total = "total"
        case weeks = "weeks"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decodeIfPresent(GitUser.self, forKey: .author)
        total = try values.decodeIfPresent(Int.self, forKey: .total) ?? 0
        weeks = try values.decodeIfPresent([GitWeeks].self, forKey: .weeks) ?? []
    }

}
