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
    
    lazy var navigationController: BaseNavigationController = {
        let navigationController = BaseNavigationController(context: context)
        navigationController.view.backgroundColor = .white
        navigationController.navigationBar.backgroundColor = .white
        navigationController.isNavigationBarHidden = true
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()
    
    lazy var tabViewController: BaseTabVC = {
        let tabViewController = BaseTabVC(context: context)
        return tabViewController
    }()

    
    override init(context: AppContext) {
        super.init(context: context)
    }
    
    override func start() {
        let typesVC = PokemonVC(context: context, pokemonTypeDS: PokemonTypeDS(context: context))
        let listVC = PokemonListVC(context: context, pokemonTypeDS: PokemonTypeDS(context: context))
        tabViewController.setViewControllers([typesVC, listVC], animated: true)
        navigationController.setViewControllers([tabViewController], animated: true)
    }
}
