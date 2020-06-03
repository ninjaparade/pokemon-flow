//
//  PokemonService.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-06-02.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit


class PokemonService: PokemonAPI {
    var host: String
    
    var controller: UIViewController
    
    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = self.host
        urlComponents.scheme = controller.nibName
        return urlComponents
    }
    
    init(host: String) {
        self.host = host
        controller = UIViewController()
    }
    

    func searchData(with resources: PokemonResources, type: String, completion: @escaping (Data?, Error?) -> Void) {
    
    }
    
    func fetch(with resources: PokemonResources, parameters: [String : String], completion: @escaping (Data?, Error?) -> Void) {
        
    }
}
        
