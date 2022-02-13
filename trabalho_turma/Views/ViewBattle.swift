//
//  ViewBattle.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 15/01/2022.
//

import SwiftUI

struct ViewBattle: View {
    @Binding var player:Player
    @State var tipo_de_batalha: Int = 2
    
    @State private var didTapPvP:Bool = false
    @State private var didTapPvE:Bool = true
    @State private var showingAlert: Bool = false
    
//    navegation
    var body: some View {
        VStack {
            HStack {
                Button("PvP") {
                    if(self.didTapPvE == true) {
                        self.didTapPvE = false
                    }
                    
                    self.didTapPvP = true
                    tipo_de_batalha = 1
                } .frame(width: 35, height: 20, alignment: .center)
                    .padding(.all, 20)
                    .background(didTapPvP ? Color.blue : Color.indigo)
                    .foregroundColor(.white)
                
                Button("PvE") {
                    if(self.didTapPvP == true) {
                        self.didTapPvP = false
                    }
                    
                    self.didTapPvE = true
                    tipo_de_batalha = 2
                }
                .frame(width: 35, height:20, alignment: .center)
                    .padding(.all, 20)
                    .background(didTapPvE ? Color.blue : Color.indigo)
                    .foregroundColor(.white)
            }
            
            List {
                ForEach(player.Pokevar) { pd in
                    ForEach(pd.pokemons){ pokemon in
                        NavigationLink { // destino
                            PokeArena(pokeSelecionado: pokemon, pokeAdversario: player.Pokevar.randomElement()!.pokemons.randomElement()!, player: $player, tipo_batalha: tipo_de_batalha)
                        } label: { // icon
                            PokeList(pokemon: pokemon)
                        }
                    }
                }
            }.listRowBackground(Color.cyan)
            .navigationTitle("Choose your Pokeman:")
        } .padding()
    }
}

//struct ViewBattle_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewPokedex(player: Player)
//    }
//}
