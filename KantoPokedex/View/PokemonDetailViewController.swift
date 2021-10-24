//
//  PokemonDetailViewController.swift
//  KantoPokedex
//
//  Created by lucas.silva on 24/10/21.
//

import UIKit

final class PokemonDetailViewController: UIViewController {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonNameLabel.text = "\(pokemon.pokemon_species.name.capitalized)"
    }
}
