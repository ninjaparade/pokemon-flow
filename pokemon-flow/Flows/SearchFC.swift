//
//  SearchFC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-27.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class SearchFC: BaseFC {
    
    override var rootViewController: UIViewController { return navigationController }
    
    lazy var navigationController: BaseTabVC = {
        let navigationController = BaseTabVC(context: self.context)
        return navigationController
    }()
    
    override init(context: AppContext) {
        super.init(context: context)
    }
    
    override func start() {
        let typesVC = PokemonVC(context: context, pokemonTypeDS: PokemonTypeDS(context: context))
        let listVC = PokemonListVC(context: context, pokemonTypeDS: PokemonTypeDS(context: context))
        navigationController.setChildVC(children: [typesVC, listVC])
    }
}
