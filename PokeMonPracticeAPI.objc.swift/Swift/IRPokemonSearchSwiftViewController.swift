//
//  IRPokemonSearchSwiftViewController.swift
//  PokeMonPracticeAPI.objc.swift
//
//  Created by Ivan Ramirez on 9/19/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class IRPokemonSearchSwiftViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var pokemon: IRPokemon?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        view.addVerticalGradientLayer(topColor: .black, bottomColor: .clear)
        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        guard let pokemon = self.pokemon else {return}
        nameLabel.text = pokemon.name
        abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
        idLabel.text = "\(pokemon.name)'s ID: \(pokemon.identifer)"
        weightLabel.text = "\(pokemon.name)'s Weight: \(pokemon.weight) Lbs"
    }


}


extension IRPokemonSearchSwiftViewController: UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {return}
        IRPokemonController.fetchPokemon(forSearchTerm: searchText) { (pocketMonster) in
            
        self.pokemon = pocketMonster
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
            self.updateViews()
        }
    }
}
}
