//
//  ImageEndpoint.swift
//  KantoPokedex
//
//  Created by lucas.silva on 24/10/21.
//

import Foundation

struct ImageEndpoint {
    var id: Int
    var queryItems: [URLQueryItem] = []
}

extension ImageEndpoint {
    static func getPokemonImage(id: Int) -> Self {
        ImageEndpoint(id: id)
    }
}

extension ImageEndpoint {
    // https://www.serebii.net025.png
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.serebii.net"
        components.path = "/pokemon/art/" + String(format: "%03d", id) + ".png"
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
}
