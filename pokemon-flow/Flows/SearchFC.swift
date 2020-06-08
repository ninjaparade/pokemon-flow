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
        context.service.fetchTypes(completion: { result in
            if case .success(let types) = result {
                let typesVC = TypesVC(context: self.context,
                                      typesDS: TypesDS(context: self.context,
                                                       types: types.results))
                typesVC.delegate = self
                
                self.navigationController.setViewControllers([typesVC], animated: true)
            }
        })
    }
}

extension SearchFC: PokemonTypeDelegate{
    func didTapType(_ pokemonVC: TypesVC, pokemonType: Type) {
        print(pokemonType)
    
        let strArray = pokemonType.url.components(separatedBy: "/")
        let type = strArray[6]
        
        context.service.fetchByType(type: type, completion: { result in
            if case .success(let types) = result {
            
                let pokemonTypeVC = PokemonVC(context: self.context,
                                              pokemonTypesDS: PokemonTypesDS(context: self.context,
                                                                             pokemon: types.pokemon,
                                                                             type: types.name))
                self.navigationController.pushViewController(pokemonTypeVC, animated: true)
            
            }
            
        })
    }
}
