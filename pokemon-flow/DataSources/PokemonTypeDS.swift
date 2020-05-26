//
//  PokemonTypeDS.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-26.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import Foundation
import UIKit

class PokemonTypeDS: BaseTableDS {
    
    let types: [PokemonType] = PokemonType.allCases
    
    // Mark: BaseTableDS
    
    override func reload(completion: @escaping (Bool) -> Void, error: @escaping (String) -> Void) {
        print("reload was triggered")
        completion(true)
    }

    override func dataSourceTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
}
