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
    
    func searchData(with resources: PokemonResources, type: String, completion: @escaping(Data?, Error?) -> Void)
    
    func fetch(with resources: PokemonResources, parameters: [String: String], completion: @escaping(Data?, Error?) -> Void)
}


extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
