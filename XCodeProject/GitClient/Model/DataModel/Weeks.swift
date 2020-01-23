/*
 Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
 */

import Foundation
struct Weeks: Codable {
    let w: Int?
    let a: Int?
    let d: Int?
    let c: Int?

    enum CodingKeys: String, CodingKey {
        case w
        case a
        case d
        case c
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        w = try values.decodeIfPresent(Int.self, forKey: .w)
        a = try values.decodeIfPresent(Int.self, forKey: .a)
        d = try values.decodeIfPresent(Int.self, forKey: .d)
        c = try values.decodeIfPresent(Int.self, forKey: .c)
    }
}
