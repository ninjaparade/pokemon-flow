//
//  PokemonContext.swift
//  pokemon-flow
//
//  Created by Yaz Jallad on 2020-05-08.
//  Copyright © 2020 Yaz Jallad. All rights reserved.
//

struct PokemonContext: AppContext {
    let service: PokemonAPI
    
    
    init(service: PokemonAPI) {
        self.service = service
    }
}
