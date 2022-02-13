//
//  PokeArena.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 24/01/2022.
//

import Foundation
import SwiftUI

struct PokeArena: View {
    @ObservedObject var pokeSelecionado:Pokemon
    @ObservedObject var pokeAdversario:Pokemon
    @Binding var player: Player
    @State var tipo_batalha: Int
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Group {
                        PokeListBatalha(pokemon: pokeSelecionado, poke_adversario: pokeAdversario, player: $player, tipo_batalha: tipo_batalha)
                    }
                    Spacer()
                }
                .frame(height: 200)
                Spacer()
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
        }
        .background(
            Image("battle_arena")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}
