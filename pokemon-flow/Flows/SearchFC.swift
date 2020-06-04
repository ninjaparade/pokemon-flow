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
        
        context.service.fetchTypes(completion: { (data, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let typesResponse = try decoder.decode(TypeResonse.self, from: data)
                    print(data)
                    print(typesResponse)
                    DispatchQueue.main.async {
                        let typesVC = TypesVC(context: self.context, typesDS: TypesDS(context: self.context, types: typesResponse.results))
                        typesVC.delegate = self
                        self.navigationController.setViewControllers([typesVC], animated: true)
                    }
                } catch let decodingError {
                    print(decodingError)
                }
            }
        })
    }
    
}


extension SearchFC: PokemonTypeDelegate{
    func didTapType(_ pokemonVC: TypesVC, pokemonType: Type) {
    
        let strArray = pokemonType.url.components(separatedBy: "/")
    
        let type = strArray[6]
        context.service.fetchByType(type: type, completion: { ( data, error ) in
            if let data = data {
                do {
                  let decoder = JSONDecoder()
                  let typesResponse = try decoder.decode(TypesResonse.self, from: data)
                  DispatchQueue.main.async {
                    let pokemonTypeVC = PokemonVC(context: self.context, pokemonTypesDS: PokemonTypesDS(context: self.context, pokemon: typesResponse.pokemon, type: typesResponse.name))
//                      typesVC.delegate = self
                    self.navigationController.pushViewController(pokemonTypeVC, animated: true)
                  }
              } catch let decodingError {
                  print(decodingError)
              }
                
            }
        })
    }
}
