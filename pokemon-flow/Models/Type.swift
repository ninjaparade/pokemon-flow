//
//  Type.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-06-03.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import Foundation

// MARK: - TypeResonse
struct Types: Codable {
    let results: [Type]
}

// MARK: - Result
struct Type: Codable {
    let name: String
    let url: String
}

// MARK: - TypesResonse
struct PokemonTypeResonse: Codable {
    let id: Int
    let name: String
    let pokemon: [Pokemon]
}

// MARK: - Pokemon
struct Pokemon: Codable {
    let pokemon: Generation
    let slot: Int
}

// MARK: - Generation
struct Generation: Codable {
    let name: String
    let url: String
}
