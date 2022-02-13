//
//  PokeBatalhaFunc.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 29/01/2022.
//

import Foundation

// função de levelup do pokemon
func scale (Sujeito :Player, Pokemon_Sujeito: Pokemon) {
//    if (Sujeito.BatalhasVencidas / Pokemon_Sujeito.xp > Pokemon_Sujeito.xp) {
        Pokemon_Sujeito.xp = Pokemon_Sujeito.xp + 15
//    }
}
 
// Faz sentido se for battleAI
func BatalhaAI(Pokemon_Sujeito: Pokemon, Pokemon_Oposto:Pokemon, tipo_attack: String) { // não precisa de do repeat pq basta carregar no butão quando o jogar ataca
    var Ataque_Aleatorio:Int
    var Ataque_Jogador:Int = 0
    
    if (tipo_attack == "Low") {
        Ataque_Jogador = 0
    } else if (tipo_attack == "Medium") {
        Ataque_Jogador = 1
    } else if (tipo_attack == "High") {
        Ataque_Jogador = 2
    }
    
    Ataque_Aleatorio = Int.random(in: 0...2)
    
    if (Ataque_Jogador == 2) {
        if (Ataque_Aleatorio >= 1) {
            Calculador_Ataque(Acao: Pokemon_Sujeito.atk[Ataque_Jogador], Atacante: Pokemon_Sujeito, Defensor: Pokemon_Oposto)
            Calculador_Ataque(Acao: Pokemon_Oposto.atk[Ataque_Aleatorio], Atacante: Pokemon_Oposto, Defensor: Pokemon_Sujeito)
        } else if (Ataque_Aleatorio == 0) {
            Calculador_Ataque(Acao: Pokemon_Oposto.atk[Ataque_Aleatorio], Atacante: Pokemon_Oposto, Defensor: Pokemon_Sujeito)
        }
    } else if (Ataque_Jogador == 1) {
        Calculador_Ataque(Acao: Pokemon_Sujeito.atk[Ataque_Jogador], Atacante: Pokemon_Sujeito, Defensor: Pokemon_Oposto)
        Calculador_Ataque(Acao: Pokemon_Oposto.atk[Ataque_Aleatorio], Atacante: Pokemon_Oposto, Defensor: Pokemon_Sujeito)
    } else if (Ataque_Jogador == 0) {
        if (Ataque_Aleatorio <= 1) {
            Calculador_Ataque(Acao: Pokemon_Sujeito.atk[Ataque_Jogador], Atacante: Pokemon_Sujeito, Defensor: Pokemon_Oposto)
            Calculador_Ataque(Acao: Pokemon_Oposto.atk[Ataque_Aleatorio], Atacante: Pokemon_Oposto, Defensor: Pokemon_Sujeito)
        } else if (Ataque_Aleatorio == 2) {
            Calculador_Ataque(Acao: Pokemon_Sujeito.atk[Ataque_Jogador], Atacante: Pokemon_Sujeito, Defensor: Pokemon_Oposto)
        }
    }
}
 
func Batalha2P(Pokemon_Sujeito: Pokemon, Pokemon_Oposto: Pokemon, tipo_attack: String) {
    var Ataque_Jogador:Int = 0
    
//    se o jogar 1 atacar com o low e o outro com o high só o ataque do low é q conta
    
    if (tipo_attack == "Low") {
        Ataque_Jogador = 0
    } else if (tipo_attack == "Medium") {
        Ataque_Jogador = 1
    } else if (tipo_attack == "High") {
        Ataque_Jogador = 2
    }
    
    Calculador_Ataque(Acao: Pokemon_Sujeito.atk[Ataque_Jogador], Atacante: Pokemon_Sujeito, Defensor: Pokemon_Oposto)
}
 
func Calculador_Ataque(Acao:Ataque, Atacante:Pokemon, Defensor:Pokemon) {
    let multiplicador_ataque = Float.random(in: 0.75...1.25)
    let ataque = Atacante.Power * Acao.Tipo / (Defensor.def * multiplicador_ataque)
    if(ataque > Defensor.Vida) {
        Defensor.Vida = 0
    } else {
        Defensor.Vida -= ataque
    }
}

// Funções n utilizadas:
func LevelUp(Pokemon_Sujeito:Pokemon) {
    Pokemon_Sujeito.Power += 15 * Pokemon_Sujeito.xp
    Pokemon_Sujeito.def += 15 * Pokemon_Sujeito.xp
    Pokemon_Sujeito.Vida += 15 * Pokemon_Sujeito.xp
}

func Inicia_Batalha(Pokemon_Sujeito: Pokemon, Pokemon_Oposto: Pokemon, tipo_batalha: Int) {
    
    // Tipo de batalha: Pvp ou Ai
    if(tipo_batalha == 1) {
        
    } else {
        
    }
    
//    let Primeiro = Sujeito.Clonar_Player()
//    let Segundo = Adveresario.pokemon.randomElement()!
//
//    Segundo.xp = Primeiro.pokemon[0].xp + Float.random(in: -1...1)
//
//    //scale(Primeiro; Primeir.pokemon[0]) primeiro por a batalha e o xp a funcionar depois isto
//    //scale(Segundo; Primeir.pokemon[0])
//
//    LevelUp(Pokemon_Sujeito: Primeiro.pokemon[0])
//    LevelUp(Pokemon_Sujeito: Segundo)
//
//    BatalhaAI(Pokemon_Sujeito: Primeiro.pokemon[0], Pokemon_Oposto: Segundo)
    
}
