/*
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
 */

import Foundation
struct GitProjectsResponse: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [GitProject]

    enum CodingKeys: String, CodingKey {
        case total_count
        case incomplete_results
        case items
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_count = try values.decodeIfPresent(Int.self, forKey: .total_count) ?? 0
        incomplete_results = try values.decodeIfPresent(Bool.self, forKey: .incomplete_results) ?? false
        items = try values.decodeIfPresent([GitProject].self, forKey: .items) ?? []
    }
}
