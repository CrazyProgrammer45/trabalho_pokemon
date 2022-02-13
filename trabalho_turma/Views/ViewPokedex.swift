//
//  ViewPokedex.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 15/01/2022.
//

import SwiftUI

struct ViewPokedex: View {
    @Binding var player:Player
    @State var isAddPresentedADDPokemon = false
    @State var isAddPresentedREMOVEPokemon = false
//    @State var isAddPresentedEditarPokemon = false
    
    var body: some View {
        VStack {
            List {
                ForEach(player.Pokevar) { pd in
                    ForEach(pd.pokemons){ pokemon in
                        NavigationLink { // destino
                            Detalhes(pokemon: pokemon)
                        } label: { // icon
                            PokeList(pokemon: pokemon)
                        }
                    }
                }
            }.listRowBackground(Color.cyan)
        }.background(.cyan)
         .padding()
        .navigationTitle("PokeDex")
        .navigationBarItems(trailing: Button("Add Pokemons") {
            self.isAddPresentedADDPokemon = true
        })
        .sheet (isPresented: $isAddPresentedADDPokemon,
            onDismiss: { self.isAddPresentedADDPokemon = false
        }) {
            ViewPokeAdd(player: $player)
        }
        .navigationBarItems(leading: Button("Remove Pokemon") {
            self.isAddPresentedREMOVEPokemon = true
        })
          .sheet (isPresented: $isAddPresentedREMOVEPokemon,
               onDismiss: { self.isAddPresentedREMOVEPokemon = false
           }) {
               ViewPokeRemove(player: $player)
           }
//           .navigationBarItems(leading: Button("Remove Pokemon") {
//               self.isAddPresentedEditarPokemon = true
//           })
//             .sheet (isPresented: $isAddPresentedEditarPokemon,
//                  onDismiss: { self.isAddPresentedEditarPokemon = false
//              }) {
//                  ViewPokeEditar(player: $player)
//              }
    }
}

//struct ViewPokedex_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewPokedex(player: player)
//    }
//}
