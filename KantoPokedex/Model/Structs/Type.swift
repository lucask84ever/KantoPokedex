//
//  Type.swift
//  KantoPokedex
//
//  Created by lucas.silva on 23/10/21.
//

import Foundation

struct TypeObject: Codable {
    let slot: Int
    let type: Type
}

struct Type: Codable {
    let name: String
}
