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
    
    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = self.host
        return urlComponents
    }
    
    init(host: String) {
        self.host = host
    }
    
    func fetchTypes(completion: @escaping (Data?, Error?) -> Void) {
        fetch(with: .type, parameters: [:], completion: completion)
    }
    
    func fetchByType(type:String, completion: @escaping (Data?, Error?) -> Void) {
        var urlComponents = self.urlComponents
        urlComponents.path = "/api/v2/type/\(type)"
        
        guard let url = urlComponents.url else {
             completion(nil, NSError(domain: "", code: 100, userInfo: nil))
             return
        }
        
        print(url.absoluteURL)
        let urlSession = URLSession.shared

        urlSession.dataTask(with: url) { (data, _, error) in
             completion(data, error)
        }.resume()
    }
    
    func searchData(with resources: PokemonResources, type: String, completion: @escaping (Data?, Error?) -> Void) {
        fetch(with: resources, parameters: ["types": type], completion: completion)
    }
    
    func fetch(with resources: PokemonResources, parameters: [String : String], completion: @escaping (Data?, Error?) -> Void) {
        var urlComponents = self.urlComponents
        urlComponents.path = "/api/v2/\(resources)"
        urlComponents.setQueryItems(with: parameters)
        
        guard let url = urlComponents.url else {
             completion(nil, NSError(domain: "", code: 100, userInfo: nil))
             return
        }
    
        print(url.absoluteURL)
        
        let urlSession = URLSession.shared

        urlSession.dataTask(with: url) { (data, _, error) in
             completion(data, error)
        }.resume()
    
    }
}
