//
//  PokemonDetailViewController.swift
//  KantoPokedex
//
//  Created by lucas.silva on 24/10/21.
//

import UIKit
import SDWebImage
import SkeletonView

final class PokemonDetailViewController: UIViewController {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var typeColorUIView: UIView!
    @IBOutlet weak var type2ColorUIView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var type2Label: UILabel!
    @IBOutlet weak var imageBackgroundView: UIView!
    
    var pokemon: ListedPokemon!
    var viewModel: PokemonDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PokemonDetailViewModel(pokemon: pokemon)
        viewModel.fetchPokemonDetail()
        viewModel.delegate = self
        setupImage()
        setupBackgroundImage()
    }
    
    private func setupImage() {
        pokemonImageView.showAnimatedSkeleton()
        pokemonImageView.sd_setImage(with: ImageEndpoint(id: pokemon.id).url) { image, _, _, _ in
            self.pokemonImageView.hideSkeleton()
            self.pokemonImageView.image = image
        }
    }
    
    private func setupTypes() {
        pokemonNameLabel.text = "\(pokemon.pokemon_species.name.capitalized)"
        typeColorUIView.isHidden = false
        typeColorUIView.layer.cornerRadius = typeColorUIView.frame.height/2
        typeLabel.text = viewModel.pokemon?.types[0].type.name.capitalized
        typeColorUIView.layer.borderWidth = 1
        typeColorUIView.backgroundColor = UIColor(named: viewModel.pokemon?.types[0].type.name ?? "")
        typeColorUIView.layer.borderColor = UIColor.black.cgColor
        if viewModel.pokemon?.types.count  ?? 0 > 1  {
            type2ColorUIView.isHidden = false
            type2ColorUIView.layer.cornerRadius = type2ColorUIView.frame.height/2
            type2Label.text = viewModel.pokemon?.types[1].type.name.capitalized
            typeColorUIView.backgroundColor = UIColor(named: viewModel.pokemon?.types[0].type.name ?? "")
            type2ColorUIView.backgroundColor = UIColor(named: viewModel.pokemon?.types[1].type.name ?? "")
            type2ColorUIView.layer.borderColor = UIColor.black.cgColor
            type2ColorUIView.layer.borderWidth = 1
        }
    }
    
    private func setupBackgroundImage() {
        imageBackgroundView.layer.borderColor = UIColor.black.cgColor
        imageBackgroundView.layer.borderWidth = 5
    }
}

extension PokemonDetailViewController: PokemonDetailDelegate {
    func onSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.setupTypes()
        }
    }
    
    func onError(error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Pokérror!",
                                          message: error.localizedDescription,
                                          preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.show(alert, sender: nil)
        }
    }
    
    
}
