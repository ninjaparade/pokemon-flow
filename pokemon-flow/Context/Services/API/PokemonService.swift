//
//  PokemonService.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-06-02.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit
import Disk

// MARK: - Response<T: Decodable>

enum Response<T: Decodable> {
    case success(T)
    case fail(Error)
}

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
    
    func fetchTypes(completion: @escaping (Response<Types>) -> Void) {
        var request = self.urlComponents
        
        request.path = "/api/v2/type"
        guard let url = request.url else { return }
             
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Types.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.fail(error))
                }
            }
        }.resume()
    }
    
    
    func fetchByType(type: String, completion: @escaping (Response<PokemonTypeResonse>) -> Void) {
        var request = self.urlComponents
        
        request.path = "/api/v2/type/\(type)"
        guard let url = request.url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
           if let data = data {
               do {
                   let decoder = JSONDecoder()
                   let response = try decoder.decode(PokemonTypeResonse.self, from: data)
                   completion(.success(response))
               } catch let error {
                   completion(.fail(error))
               }
           }
       }.resume()
        
    }
    
    func searchData(with resources: PokemonResources, type: String, completion: @escaping (Data?, Error?) -> Void) {
    }
}
