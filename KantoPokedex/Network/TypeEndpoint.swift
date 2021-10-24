//
//  TypeEndpoint.swift
//  KantoPokedex
//
//  Created by lucas.silva on 24/10/21.
//

import Foundation

struct TypeImageEndpoint {
    var name: String
    var queryItems: [URLQueryItem] = []
}

extension TypeImageEndpoint {
    static func getTypeImage(name: String) -> Self {
        TypeImageEndpoint(name: name)
    }
}

extension TypeImageEndpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.serebii.net"
        components.path = "/pokedex-bw/type/" + name + ".gif"
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
}
