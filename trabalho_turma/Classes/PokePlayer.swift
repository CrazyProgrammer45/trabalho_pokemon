//
//  PokePlayer.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 29/01/2022.
//

import Foundation
import SwiftUI
//import Combine

// é preciso fazer isto? perguntar no luis, no entre tanto por apenas os pokemons
struct Player {
    var Nome: String
    var BatalhasVencidas: Float
    var Pokevar:[Pokedex] = [
//      MINEIRON
        Pokedex(tipo: "Eletricidade", pokemons: [Pokemon(nome: "Mineiron", nickName: "Minas", img: "min", xp: 1, PokeTipo: "Eletrico", Fraco: 3, Vida: 150.0, Vida_Total: 150.0, Power: 10, def: 1.25,
        atk: [Ataque(Nome: "Mpresario", Tipo: 1, Info: "Low"),
        Ataque(Nome: "Davinte", Tipo: 1.1 , Info: "Medium"),
        Ataque(Nome: "ForadeTempo", Tipo: 1.25 , Info: "High")])]),
        
//      BARRAMON
        Pokedex(tipo: "Agua", pokemons: [Pokemon(nome: "Barramon", nickName: "Barras", img: "bar", xp: 1, PokeTipo: "Agua", Fraco: 3, Vida: 160.0, Vida_Total: 160.0, Power: 15, def: 1.20,
        
        atk: [Ataque(Nome: "Deixandar", Tipo: 1, Info: "Low"),
        Ataque(Nome: "DHL", Tipo: 1.1 , Info: "Medium"),
        Ataque(Nome: "NuncaChega", Tipo: 1.25 , Info: "High")])]),
        
//      BRAVOMON
        Pokedex(tipo: "Fogo", pokemons: [Pokemon(nome: "Bravamon", nickName: "Bravora", img: "bra", xp: 1, PokeTipo: "Fogo", Fraco: 3, Vida: 155.0, Vida_Total: 155.0, Power: 17, def: 1.25,

        atk: [Ataque(Nome: "Festinhas", Tipo: 1, Info: "Low"),
        Ataque(Nome: "Bolachas", Tipo: 1.1 , Info: "Medium"),
        Ataque(Nome: "PortaBagagens", Tipo: 1.25 , Info: "High")])]),
    ]
    
//  Perguntar ao Luis ----------
    init(Nome: String, BatalhasVencidas: Float) {
        self.Nome = Nome
        self.BatalhasVencidas = BatalhasVencidas
    }
    
//    Perguntar no Luis ------------
    func Clonar_Player()->Player {
        @State var p = Player(Nome: self.Nome, BatalhasVencidas: self.BatalhasVencidas)
        p.Pokevar = self.Pokevar
        return p
    }
}

// Class Player for playing the game
//private var cancellables = [String:AnyCancellable]()
//
//extension Published {
//    init(wrappedValue value: Value, key: String) {
//        let value = UserDefaults.standard.object(forKey: key) as? Value ?? value
//        self.init(initialValue: value)
//        cancellables[key] = projectedValue.sink { val in
//            UserDefaults.standard.set(val, forKey: key)
//        }
//    }
//}
//
//class Player1: ObservableObject {
////    @Published var Nome: String
////    @Published var BatalhasVencidas: Float
////    var Nome: String?
//
//    @Published(key: "Nome") var Nome = "Player Name"
//
//    var BatalhasVencidas: Float?
//    var pokemon: [Pokemon] = [
////      MINEIRON
//        Pokemon(nome: "Mineiron", nickName: "Minas", img: "min", xp: 1, Tipo: 1, Fraco: 3, Vida: 150, Vida_Total: 150, Power: 1, def: 1.25,
//        atk: [Ataque(Nome: "Mpresario", Tipo: 1, Info: "Low"),
//        Ataque(Nome: "Davinte", Tipo: 1.1 , Info: "Medium"),
//        Ataque(Nome: "ForadeTempo", Tipo: 1.25 , Info: "High")]),
//
////      BARRAMON
//        Pokemon(nome: "Barramon", nickName: "Barras", img: "bar", xp: 1, Tipo: 1, Fraco: 3, Vida: 160, Vida_Total: 160, Power: 1, def: 1.20,
//
//        atk: [Ataque(Nome: "Deixandar", Tipo: 1, Info: "Low"),
//        Ataque(Nome: "DHL", Tipo: 1.1 , Info: "Medium"),
//        Ataque(Nome: "NuncaChega", Tipo: 1.25 , Info: "High")]),
//
////      BRAVOMON
//        Pokemon(nome: "Bravamon", nickName: "Bravora", img: "bra", xp: 1, Tipo: 1, Fraco: 3, Vida: 155, Vida_Total: 155, Power: 1, def: 1.25,
//
//        atk: [Ataque(Nome: "Festinhas", Tipo: 1, Info: "Low"),
//        Ataque(Nome: "Bolachas", Tipo: 1.1 , Info: "Medium"),
//        Ataque(Nome: "PortaBagagens", Tipo: 1.25 , Info: "High")]),
//    ]
//
////    init(Nome:String, BatalhasVencidas: Float) {
////        self.Nome = Nome
////        self.BatalhasVencidas = BatalhasVencidas
////    }
//
//}
