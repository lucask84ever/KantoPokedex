//
//  Move.swift
//  KantoPokedex
//
//  Created by lucas.silva on 23/10/21.
//

import Foundation

struct Move: Codable {
    let id: Int
    let name: String
    let power: Int
    let pp: Int
    let type: [Type]
}
