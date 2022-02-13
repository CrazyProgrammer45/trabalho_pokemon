//
//  pokemon.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 08/01/2022.
//

import Foundation
import UIKit
import SwiftUI

extension UIImage{
    static var defImg:UIImage{
        UIImage(named: "noImg")!
    }
}

class Pokemon: Identifiable, ObservableObject {
    var id = UUID()
    
    var nome:String
    var nickName:String
    var img:UIImage
    
    var xp: Float
    var PokeTipo: String
    var Fraco: Float
    @Published var Vida: Float
    @Published var Vida_Total: Float
    var Power: Float
    var def: Float
    var atk: [Ataque] = []
    
    init(nome:String, nickName:String , img:String, xp: Float, PokeTipo: String, Fraco: Float, Vida: Float, Vida_Total: Float, Power: Float, def: Float, atk: [Ataque]) {
        self.nome = nome
        self.nickName = nickName
        self.img = UIImage(named: img) ?? UIImage.defImg
        
        self.xp = xp
        self.PokeTipo = PokeTipo
        self.Fraco = Fraco
        self.Vida = Vida
        self.Vida_Total = Vida_Total
        self.Power = Power
        self.def = def
        self.atk = atk
    }
}

// Escolher o ataque do pokemon
class Ataque: Identifiable {
    var Nome: String
    var Tipo: Float
    var Info: String
    
    init(Nome: String, Tipo: Float, Info: String ) {
        self.Nome = Nome
        self.Tipo = Tipo
        self.Info = Info
    }
}

// CRIAÇÃO DE POKEMONS
func adicionar_pokemon( player: inout Player, nome: String, nickname: String, poketipo: String, vida: Float, def: Float, power: Float, nome_ataque1: String, info_ataque1: String, tipo_ataque1: Float, nome_ataque2: String, info_ataque2: String, tipo_ataque2: Float, nome_ataque3: String, info_ataque3: String, tipo_ataque3: Float ) {
    let criate_pokemon = Pokedex(tipo: poketipo, pokemons: [Pokemon(nome: nome, nickName: nickname, img: "semimagem", xp: 1, PokeTipo: poketipo, Fraco: 3, Vida: vida, Vida_Total: vida, Power: 1, def: def,
                                                                          atk: [Ataque(Nome: "Mpresario", Tipo: 1, Info: "Low"),
                                                                          Ataque(Nome: "Davinte", Tipo: 1.1 , Info: "Medium"),
                                                                          Ataque(Nome: "ForadeTempo", Tipo: 1.25 , Info: "High")])])

    
    player.Pokevar.append(criate_pokemon)
    
}
