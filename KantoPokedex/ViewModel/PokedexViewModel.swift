//
//  PokedexViewModel.swift
//  KantoPokedex
//
//  Created by lucas.silva on 23/10/21.
//

import Foundation

protocol PokedexDelegate: AnyObject {
    func onSuccess()
    func onError(error: Error)
}

class PokedexViewModel {
    private var pokedex: Pokedex?
    var pokedexDelegate: PokedexDelegate?
    
    func retrievePokemons() {
        URLSession.shared.request(url: Endpoint.kantoPokemons.url, expecting: Pokedex.self) { [weak self] result in
            switch result {
            case .success(let pokedex):
                self?.pokedex = pokedex
                self?.pokedexDelegate?.onSuccess()
            case .failure(let error):
                self?.pokedexDelegate?.onError(error: error)
            }
        }
    }
    
    func getPokemons() -> [Pokemon] {
        return pokedex?.pokemons ?? []
    }
    
}
