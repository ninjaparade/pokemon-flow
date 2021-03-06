//
//  PokemonAPI.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-06-02.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import UIKit


// MARK: - Response<T: Decodable>


protocol PokemonAPI {
    var host: String { get set }
    
    func fetchTypes(completion: @escaping (Response<Types>) -> Void)
    
    func fetchByType(type: String, completion: @escaping (Response<PokemonTypeResonse>) -> Void)
    
    func fetchBySpecies(species: String, completion: @escaping (Response<PokemonSpecies>) -> Void)
    
    func fetchData<T: Codable>(url path: String, cacheKey key: String, parseType: T.Type, completion: @escaping (Response<T>) -> Void)
}

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
