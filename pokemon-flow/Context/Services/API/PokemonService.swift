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
        
        if let cached = try? Disk.retrieve(url.absoluteString, from: .caches, as: Types.self) as Types {
            completion(.success(cached))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(Types.self, from: data)
                    do {
                        try Disk.save(response, to: .caches, as: url.absoluteString)
                    } catch let error as NSError {
                        fatalError("""
                          Domain: \(error.domain)
                          Code: \(error.code)
                          Description: \(error.localizedDescription)
                          Failure Reason: \(error.localizedFailureReason ?? "")
                          Suggestions: \(error.localizedRecoverySuggestion ?? "")
                          """)
                    }
                    DispatchQueue.main.sync {
                        completion(.success(response))
                    }
                } catch let error {
                    DispatchQueue.main.sync {
                        completion(.fail(error))
                    }
                }
            }
        }.resume()
    }
    
    func fetchByType(type: String, completion: @escaping (Response<PokemonTypeResonse>) -> Void) {
        var request = self.urlComponents
        
        request.path = "/api/v2/type/\(type)"
        guard let url = request.url else { return }
        
        if let cached = try? Disk.retrieve(request.path, from: .caches, as: PokemonTypeResonse.self) as PokemonTypeResonse {
            completion(.success(cached))
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data {
                do {
                    
                    let response = try JSONDecoder().decode(PokemonTypeResonse.self, from: data)
                    do{
                        try Disk.save(response, to: .caches, as: request.path)
                    }  catch let error as NSError {
                        fatalError("""
                            Domain: \(error.domain)
                            Code: \(error.code)
                            Description: \(error.localizedDescription)
                            Failure Reason: \(error.localizedFailureReason ?? "")
                            Suggestions: \(error.localizedRecoverySuggestion ?? "")
                            """)
                    }
                    DispatchQueue.main.sync {
                        completion(.success(response))
                    }
                } catch let error {
                    DispatchQueue.main.sync {
                        completion(.fail(error))
                    }
                }
            }
       }.resume()
        
    }
    
    func fetchData(with resources: PokemonResources, type: String, completion: @escaping (Data?, Error?) -> Void) {
    }
    
    
    func fetchBySpecies(species: String, completion: @escaping (Response<PokemonSpecies>) -> Void) {
        var request = self.urlComponents
               
        request.path = "/api/v2/pokemon/\(species)"
        guard let url = request.url else { return }
       
        if let cached = try? Disk.retrieve(request.path, from: .caches, as: PokemonSpecies.self) as PokemonSpecies {
            print("returning from cache")
            completion(.success(cached))
            return
        }
            
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data {
                do {
                   let response = try JSONDecoder().decode(PokemonSpecies.self, from: data)
                    
                   do{
                       try Disk.save(response, to: .caches, as: request.path)
                   }  catch let error as NSError {
                       fatalError("""
                           Domain: \(error.domain)
                           Code: \(error.code)
                           Description: \(error.localizedDescription)
                           Failure Reason: \(error.localizedFailureReason ?? "")
                           Suggestions: \(error.localizedRecoverySuggestion ?? "")
                           """)
                   }
                   DispatchQueue.main.sync {
                       completion(.success(response))
                   }
                } catch let error {
                    print(error)
                    DispatchQueue.main.sync {
                       completion(.fail(error))
                   }
               }
           }
        }.resume()
    }
 
}
