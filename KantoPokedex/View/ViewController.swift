//
//  ViewController.swift
//  KantoPokedex
//
//  Created by lucas.silva on 23/10/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var pokemonsTableView: UITableView!
    var viewModel: PokedexViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView() {
        pokemonsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        pokemonsTableView.delegate = self
        pokemonsTableView.dataSource = self
        viewModel = PokedexViewModel()
        viewModel?.pokedexDelegate = self
        viewModel?.retrievePokemons()
    }
}

// MARK: - TableView delegates/datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getPokemons().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = ("\(indexPath.row + 1) - " + (viewModel?.getPokemons()[indexPath.row].pokemon_species.name ?? ""))
        return cell
    }
}

extension ViewController: PokedexDelegate {
    func onSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.pokemonsTableView.reloadData()
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
