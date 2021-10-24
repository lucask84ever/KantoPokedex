//
//  Pokemon.swift
//  KantoPokedex
//
//  Created by lucas.silva on 24/10/21.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let stats: [StatObject]
    let types: [TypeObject]
    let baseExperience: Int
    let height: Int
    let weight: Int
}

extension Pokemon {
    enum CodingKeys: String, CodingKey {
        case id, name, stats, types, height, weight
        case baseExperience = "base_experience"
    }
}
