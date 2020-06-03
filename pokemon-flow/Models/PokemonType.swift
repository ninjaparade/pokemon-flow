//
//  PokemonType.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-26.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import Foundation

enum PokemonType: String, Codable, CaseIterable {
    case colorless = "Colorless"
    case fighting = "Fighting"
    case fire = "Fire"
    case free = "Free"
    case lightning = "Lightning"
    case metal = "Metal"
    case psychic = "Psychic"
    case water = "Water"
    case grass = "Grass"
}

// MARK: Resources
enum PokemonAPIFormat: String {
    case json
}

enum PokemonResources: String {
    case cards
}
