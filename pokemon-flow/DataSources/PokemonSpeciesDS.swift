//
//  PokemonSpeciesDS.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-26.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class PokemonSpeciesDS: BaseTableDS {
    var pokemon: PokemonSpecies
    
    init(context: AppContext, pokemon: PokemonSpecies ) {
        self.pokemon = pokemon
        super.init(context: context)
    }
    
   // Mark: BaseTableDS
   
   override func reload(completion: @escaping (Bool) -> Void, error: @escaping (String) -> Void) {
       print("reload was triggered")
       completion(true)
   }

   override func dataSourceTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
   }
    
    override func dataSourceNumberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}
