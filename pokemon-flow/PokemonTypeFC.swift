//
//  LandingFC.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-08.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit

class PokemonTypeFC: BaseFC {
    
    override var rootViewController: UIViewController { return navigationController }

    lazy var navigationController: BaseNavigationController = {
        let navigationController = BaseNavigationController(context: context)
        navigationController.isNavigationBarHidden = true
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()
    
    override init(context: AppContext) {
        super.init(context: context)
    }
    
    override func start() {
        let pokemonVC = PokemonVC(context: context, pokemonTypeDS: PokemonTypeDS(context: context))
        navigationController.setViewControllers([pokemonVC], animated: true)
    }
}
