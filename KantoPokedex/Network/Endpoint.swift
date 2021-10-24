//
//  Endpoint.swift
//  KantoPokedex
//
//  Created by lucas.silva on 23/10/21.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/v2/" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
}

extension Endpoint {
    static var kantoPokemons: Self {
        Endpoint(path: "pokedex/2")
    }
    
    static func pokemonDetail(with id: Int) -> Self {
        Endpoint(path: "pokemon/\(id)")
    }
    
    static func move(with id: Int) -> Self {
        Endpoint(path: "move/\(id)")
    }
}
