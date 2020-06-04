//
//  PokemonTypesDS.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-06-03.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class PokemonTypesDS: BaseTableDS {
    var pokemon: [Pokemon]
    var type: String
    
    init(context: AppContext, pokemon: [Pokemon], type: String) {
        self.pokemon = pokemon
        self.type = type
        super.init(context: context)
    }
    
    override func reload(completion: @escaping (Bool) -> Void, error: @escaping (String) -> Void) {
        print("reload was triggered")
        completion(true)
    }
    
    override func dataSourceTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return pokemon.count
      }
}
