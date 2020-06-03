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
        let typesVC = TypesVC(context: context, typesDS: TypesDS(context: context))
        typesVC.delegate = self
                    

        navigationController.setViewControllers([typesVC], animated: true)
    }
    
}


extension SearchFC: PokemonTypeDelegate{
    func didTapType(_ pokemonVC: TypesVC, pokemonType: PokemonType) {
        
        
//        print("\(pokemonType.rawValue.lowercased()) was selected")
//
//        let viewController = UIViewController()
//        viewController.view.backgroundColor = .blue
//        navigationController.pushViewController(viewController, animated: true)
    }
}
