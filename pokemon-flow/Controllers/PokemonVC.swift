//
//  PokemonVC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-06-03.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

protocol PokemonDelegate: class {
    func didTapPokemon(_ pokemonVC: PokemonVC, pokemon: Pokemon)
}

class PokemonVC: BaseTableVC {
    
    var type: String
    weak var delegate: PokemonDelegate?
    
    init(context: AppContext, pokemonTypesDS: PokemonTypesDS) {
        type = pokemonTypesDS.type
        super.init(context: context, dataSource: pokemonTypesDS)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = type.capitalized
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func cell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let pokemonTypesDS = dataSource as? PokemonTypesDS else { return cell }
        let name = pokemonTypesDS.pokemon[indexPath.row].pokemon.name.capitalized
        cell.textLabel?.text = "\(name)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataSource = dataSource as? PokemonTypesDS else { return }
        print(dataSource.pokemon[indexPath.row])
        self.delegate?.didTapPokemon(self, pokemon: dataSource.pokemon[indexPath.row] )
    }
}
