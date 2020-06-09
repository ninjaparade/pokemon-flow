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
        fetchData(
            url: "/api/v2/type",
            cacheKey: "types",
            parseType: Types.self,
            completion: completion
        )
    }
    
    func fetchByType(type: String, completion: @escaping (Response<PokemonTypeResonse>) -> Void) {
        fetchData(
            url: "/api/v2/type/\(type)",
            cacheKey: "types-\(type)",
            parseType: PokemonTypeResonse.self,
            completion: completion
        )
    }

    
    func fetchBySpecies(species: String, completion: @escaping (Response<PokemonSpecies>) -> Void) {
        fetchData(
            url: "/api/v2/pokemon/\(species)",
            cacheKey: "species-\(species)",
            parseType: PokemonSpecies.self,
            completion: completion
        )
    }
    
    
    func fetchData<T>(url path: String, cacheKey key: String,  parseType: T.Type, completion: @escaping (Response<T>) -> Void) where T : Codable {
        var request = self.urlComponents
        request.path = path
        
        guard let url = request.url else { return }
        
        if let cached = try? Disk.retrieve(key, from: .caches, as: T.self) {
            print("returning from cache")
            completion(.success(cached))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    
                    do{
                        try Disk.save(response, to: .caches, as: key)
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
}
