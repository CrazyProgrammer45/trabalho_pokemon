//
//  pokedex.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 08/01/2022.
//

import Foundation

class Pokedex:Identifiable{
    var id = UUID()
    
    var tipo:String
    var pokemons:[Pokemon]
    
    init(tipo:String, pokemons:[Pokemon]){
        self.tipo = tipo
        self.pokemons = pokemons
    }
}
