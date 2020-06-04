//
//  PokemonTypeDS.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-26.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class TypesDS: BaseTableDS {
    var types: [Type]
    
    init(context: AppContext, types: [Type] ) {
        self.types = types
        super.init(context: context)
    }
    
   // Mark: BaseTableDS
   
   override func reload(completion: @escaping (Bool) -> Void, error: @escaping (String) -> Void) {
       print("reload was triggered")
       completion(true)
   }

   override func dataSourceTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return types.count
   }
}
