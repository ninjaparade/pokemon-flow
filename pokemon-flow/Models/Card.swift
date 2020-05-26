//
//  Card.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-26.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

import Foundation

// MARK: - Card
struct Card: Codable {
    let id, name: String
    let nationalPokedexNumber: Int?
    let imageURL, imageURLHiRes: String
//    let types: [RetreatCost]
//    let supertype: Supertype
//    let subtype: String
//    let hp: String?
//    let retreatCost: [RetreatCost]?
//    let convertedRetreatCost: Int?
//    let number: String
//    let artist: String?
//    let rarity: Rarity?
//    let series: Series
//    let cardSet, setCode: String
//    let attacks: [Attack]?
//    let weaknesses: [Resistance]?
//    let evolvesFrom: String?
//    let ability: Ability?
//    let text: [String]?
//    let resistances: [Resistance]?
//    let ancientTrait: AncientTrait?

    enum CodingKeys: String, CodingKey {
        case id, name
        case nationalPokedexNumber
        case imageURL = "imageUrl"
        case imageURLHiRes = "imageUrlHiRes"
//        case types, supertype, subtype, hp, retreatCost, convertedRetreatCost, number, artist, rarity, series
//        case cardSet = "set"
//        case setCode, attacks, weaknesses, evolvesFrom, ability, text, resistances, ancientTrait
    }
}
