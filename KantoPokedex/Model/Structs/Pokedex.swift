//
//  Pokedex.swift
//  KantoPokedex
//
//  Created by lucas.silva on 23/10/21.
//

import Foundation

struct Pokedex: Codable {
    var pokemons: [Pokemon]
}

extension Pokedex {
    enum CodingKeys: String, CodingKey {
        case pokemons = "pokemon_entries"
    }
}
