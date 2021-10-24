//
//  Pokemon.swift
//  KantoPokedex
//
//  Created by lucas.silva on 23/10/21.
//

import Foundation

struct ListedPokemon: Codable {
    let id: Int
    let pokemon_species: PokeSpecie
}

extension ListedPokemon {
    enum CodingKeys: String, CodingKey {
        case id = "entry_number"
        case pokemon_species
    }
}

struct PokeSpecie: Codable {
    let name: String
}
