//
//  Stat.swift
//  KantoPokedex
//
//  Created by lucas.silva on 24/10/21.
//

import Foundation

struct StatObject: Codable {
    let baseValue: Int
    let effort: Int
    let stat: Stat
}

extension StatObject {
    enum CodingKeys: String, CodingKey {
        case effort, stat
        case baseValue = "base_stat"
    }
}

struct Stat: Codable {
    let name: String
}
