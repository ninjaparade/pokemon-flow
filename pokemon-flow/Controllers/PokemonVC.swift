//
//  LandingVC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-08.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class PokemonVC: BaseTableVC {
    
    let label = UILabel(frame: .zero)
    
    init(context: AppContext, pokemonTypeDS: PokemonTypeDS) {
        super.init(context: context)
         
        dataSource = pokemonTypeDS
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Your View controller title"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let pokemonTypeDS = dataSource as? PokemonTypeDS else { return cell }
        cell.textLabel?.text = "\(pokemonTypeDS.types[indexPath.row].rawValue)"
        return cell
    }
}
