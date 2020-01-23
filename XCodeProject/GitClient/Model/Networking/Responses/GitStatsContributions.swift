
typealias GitStatsArray = [GitStats]

import Foundation
struct GitStats: Codable {
    let total: Int?
    let weeks: [Weeks]?
    let author: GitUser?

    enum CodingKeys: String, CodingKey {
        case total
        case weeks
        case author
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        weeks = try values.decodeIfPresent([Weeks].self, forKey: .weeks)
        author = try values.decodeIfPresent(GitUser.self, forKey: .author)
    }
}
