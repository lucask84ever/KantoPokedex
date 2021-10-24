//
//  PokemonDetailViewModel.swift
//  KantoPokedex
//
//  Created by lucas.silva on 24/10/21.
//

import Foundation

protocol PokemonDetailDelegate {
    func onSuccess()
    func onError(error: Error)
}

class PokemonDetailViewModel {
    var delegate: PokemonDetailDelegate?
    var listedPokemon: ListedPokemon
    var pokemon: Pokemon?
    
    init(pokemon: ListedPokemon) {
        self.listedPokemon = pokemon
    }
    
    func fetchPokemonDetail() {
        
        URLSession.shared.request(url: Endpoint.pokemonDetail(with: listedPokemon.id).url, expecting: Pokemon.self) { [weak self] result in
            switch result {
            case .success(let pokemon):
                self?.pokemon = pokemon
                self?.delegate?.onSuccess()
            case .failure(let error):
                self?.delegate?.onError(error: error)
            }
        }
    }
}
