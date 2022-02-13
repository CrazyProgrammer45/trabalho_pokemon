//
//  pokelist.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 11/01/2022.
//

import Foundation
import SwiftUI

// Lista para o Pokedex
struct PokeList: View {
    @State var pokemon:Pokemon
    var body: some View {
        HStack{
            Image(uiImage: self.pokemon.img)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
            HStack{
                Text("Nome: \(self.pokemon.nome)")
                Text("Nick: \(self.pokemon.nickName)")
                Text("Tipo: \(self.pokemon.PokeTipo)")
            }
        }
    }
}

// Mostrar o tipo de ataque low, medium, high
// Por os prints no Gráfico de batalha dos pokemons
// Por a imagem q envias te (luis)

// Lista para a batalha
struct PokeListBatalha: View {
    @ObservedObject var pokemon: Pokemon
    @ObservedObject var poke_adversario: Pokemon
    @Binding var player: Player
    
    @State var showingAlertWiningP1 = false
    @State var showingAlertWiningP2 = false
    
    @State var showingAlertLosing = false
    @State var showingAlertDraw = false
    @State var aux_ataque_pokemon: Float = 0
    @State var aux_ataque_adv: Float = 0
    
    @State var tipo_batalha: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Spacer()
                        VStack {
                            Text(self.pokemon.nome)
                            Image(uiImage: self.pokemon.img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                            
                            ProgressView("HP \(Int(self.pokemon.Vida)) ", value: self.pokemon.Vida, total: self.pokemon.Vida_Total)
                                .frame(width: 100)
                        } .foregroundColor(.white)
                        
                        VStack {
                            ForEach(self.pokemon.atk) { pd_ataque in
                                Button {
                                    if(tipo_batalha == 1) {
                                        if(poke_adversario.Vida > 1 && poke_adversario.Vida >= aux_ataque_adv) {
                                            Batalha2P(Pokemon_Sujeito: pokemon, Pokemon_Oposto: poke_adversario, tipo_attack: pd_ataque.Info)
                                            aux_ataque_adv = poke_adversario.Vida
                                        } else {
                                            if(pokemon.Vida == poke_adversario.Vida) {
                                                showingAlertDraw = true
                                                
                                                pokemon.Vida = pokemon.Vida_Total
                                                poke_adversario.Vida = poke_adversario.Vida_Total
                                            } else if(pokemon.Vida > poke_adversario.Vida) {
                                                player.BatalhasVencidas += 1
                                                scale(Sujeito: player, Pokemon_Sujeito: pokemon)
                                                
                                                showingAlertWiningP1 = true
                                                
                                                pokemon.Vida = pokemon.Vida_Total
                                                poke_adversario.Vida = poke_adversario.Vida_Total
                                            }
                                        }
                                    } else if(tipo_batalha == 2) {
                                        if(pokemon.Vida > 1 && pokemon.Vida >= aux_ataque_pokemon && poke_adversario.Vida > 1 && poke_adversario.Vida >= aux_ataque_adv) {
                                            BatalhaAI(Pokemon_Sujeito: pokemon, Pokemon_Oposto: poke_adversario, tipo_attack: pd_ataque.Info)
                                            aux_ataque_pokemon = pokemon.Vida
                                            aux_ataque_adv = poke_adversario.Vida
                                        } else {
                                            if(pokemon.Vida == poke_adversario.Vida) {
                                                showingAlertDraw = true
                                                
                                                pokemon.Vida = pokemon.Vida_Total
                                                poke_adversario.Vida = poke_adversario.Vida_Total
                                            } else if(pokemon.Vida > poke_adversario.Vida) {
                                                player.BatalhasVencidas += 1
                                                scale(Sujeito: player, Pokemon_Sujeito: pokemon)
                                                
                                                showingAlertWiningP1 = true
                                                
                                                pokemon.Vida = pokemon.Vida_Total
                                                poke_adversario.Vida = poke_adversario.Vida_Total
                                            } else if(pokemon.Vida < poke_adversario.Vida) { // Este caso só acontece no PvE
                                                showingAlertLosing = true
                                                
                                                pokemon.Vida = pokemon.Vida_Total
                                                poke_adversario.Vida = poke_adversario.Vida_Total
                                            }
                                        }
                                    }
                                } label: {
                                    Text("\(pd_ataque.Nome) - \(pd_ataque.Info)")
                                        .frame(width: 100, height: 40)
                                        .background(.blue)
                                        .font(.system(size: 13, weight: .bold))
                                }
                            }
                        } .foregroundColor(.white)
                        Spacer()
                    }.padding(.top, 200)
                        .edgesIgnoringSafeArea([.top,.bottom])
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        VStack {
                            Text(self.poke_adversario.nome)
                            Image(uiImage: self.poke_adversario.img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                            
                            ProgressView("HP \(Int(poke_adversario.Vida)) ", value: self.poke_adversario.Vida , total: self.poke_adversario.Vida_Total)
                                .frame(width: 100)
                        } .foregroundColor(.white)
                        
                        if(tipo_batalha == 1) {
                            VStack {
                                ForEach(self.poke_adversario.atk) { pd_ataque in
                                    Button {
                                        if(pokemon.Vida > 1 && pokemon.Vida >= aux_ataque_pokemon) {
                                            Batalha2P(Pokemon_Sujeito: poke_adversario, Pokemon_Oposto: pokemon, tipo_attack: pd_ataque.Info)
                                            aux_ataque_pokemon = pokemon.Vida
                                        } else {
                                            if(pokemon.Vida == poke_adversario.Vida) {
                                                showingAlertDraw = true
                                                
                                                pokemon.Vida = pokemon.Vida_Total
                                                poke_adversario.Vida = poke_adversario.Vida_Total
                                            } else if(poke_adversario.Vida > pokemon.Vida) {
                                                scale(Sujeito: player, Pokemon_Sujeito: poke_adversario)
                                                showingAlertWiningP2 = true
                                                
                                                pokemon.Vida = pokemon.Vida_Total
                                                poke_adversario.Vida = poke_adversario.Vida_Total
                                            }
                                        }
                                    } label: {
                                        Text("\(pd_ataque.Nome) - \(pd_ataque.Info)")
                                            .frame(width: 100, height: 40)
                                            .background(.blue)
                                            .font(.system(size: 13, weight: .bold))
                                    }
                                }
                            } .foregroundColor(.white)
                        }
                }.edgesIgnoringSafeArea([.top,.bottom])
                        .padding()
                Spacer()
                    
                    HStack(alignment: .bottom) {
                        // Para cada tipo de alerta só pode haver um por tipo de estrutura ex: button, Hstack, Vstack.....
                        // Jogador 1
                        Button(" ") {}.alert(isPresented: $showingAlertWiningP1) {
                                Alert(title: Text("Ganhou o Jogador 1"), message: Text("Parabens"), dismissButton: .default(Text("ok")){
                                    self.presentationMode.wrappedValue.dismiss()
                                })
                            }
                        
                        // Jogador 2
                        Button(" ") {}.alert(isPresented: $showingAlertWiningP2) {
                                Alert(title: Text("Ganhou o Jogador 2"), message: Text("Parabens"), dismissButton: .default(Text("ok")){
                                    self.presentationMode.wrappedValue.dismiss()
                                })
                            }
                        
                        // Para Ambos os jogadores
                        Button(" ") {}.alert(isPresented: $showingAlertDraw) {
                                Alert(title: Text("Empate"), message: Text("Bem Jogado"), dismissButton: .default(Text("ok")){
                                    self.presentationMode.wrappedValue.dismiss()
                                })
                            }
                        
                        if(tipo_batalha == 2) {
                            Button(" ") {}.alert(isPresented: $showingAlertLosing) {
                                    Alert(title: Text("Perdeste"), message: Text("Tenta Novamente"), dismissButton: .default(Text("ok")){
                                        self.presentationMode.wrappedValue.dismiss()
                                    })
                                }
                        }
                    }
                }
        }
    }
}

//struct PokeList_Previews: PreviewProvider {
//    static var previews: some View {
//        PokeList(pokemon:  Pokemon(nome: "Ditto",nickName: "Joao", img: "ditto"))
//    }
//}
